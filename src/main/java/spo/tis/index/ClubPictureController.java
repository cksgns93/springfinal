package spo.tis.index;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import lombok.extern.log4j.Log4j;
import spo.tis.common.util.CommonUtil;
import spo.tis.domain.CPictureVO;
import spo.tis.domain.ClubVO;
import spo.tis.domain.UserVO;
import spo.tis.service.CPictureService;
import spo.tis.service.ClubService;

@Controller
@RequestMapping("/club")
@Log4j
public class ClubPictureController {

	@Autowired
	private ClubService ClubSvc;

	@Autowired
	private CPictureService CPictureSvc;

	@Inject
	private CommonUtil util;
	
	@RequestMapping("/photo")
	public String clubPhoto(Model model, @RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		// 모임번호로 특정 모임의 사진들 가져오기
		List<CPictureVO> cpList = CPictureSvc.getClubPicture(cno);

		// req에 저장
		model.addAttribute("cpList", cpList);
		model.addAttribute("clubView", clubView);
		model.addAttribute("cno", cno);

		return "/club/clubPhoto";
	}

	
	
	
	@RequestMapping("/photoAdd")
	public String clubPhotoAdd(Model model, @RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cno", cno);
		model.addAttribute("clubView", clubView);

		return "/club/clubphotoAdd";
	}

	
	
	
	
	@RequestMapping("/photoAddEnd")
	public String clubPhotoAddEnd(Model model, HttpServletRequest req,
			@RequestParam(defaultValue = "0") int cno,
			@ModelAttribute("cpicture") CPictureVO cpicture,
			@RequestParam("mfilename") MultipartFile mfilename) {

		//값 받아오기
		String cptitle = cpicture.getCptitle();
		
		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}
		
		if(cptitle==null || cptitle.trim().isEmpty() || mfilename==null) {
			return util.addMsgBack(model, "사진제목과 사진을 입력해주세요.");
		}
		
		//업로드할 디렉토리의 절대경로 얻어오기
		ServletContext ctx = req.getServletContext();
		String upDir = ctx.getRealPath("/clubphotoimage");
		log.info("upDir===" + upDir);
		
		File dir=new File(upDir);
		if(! dir.exists()) {
			dir.mkdirs();//디렉토리 생성
		}
		//파일을 첨부했다면
		if(!mfilename.isEmpty()) {
			
			//첨부파일명, 파일 크기를 알아내자.
			String fname=mfilename.getOriginalFilename();//원본파일명
			
			//첨부파일이 이미 존재하는 파일일 경우 덮어쓰기를 방지하기 위해
			UUID uuid=UUID.randomUUID();//랜덤한 문자열을 발생시키기 위해 UUID객체를 얻어오자.
			String str=uuid.toString();
			String fname2=str+"_"+fname;//물리적파일명
			
			cpicture.setCpimage(fname2); ;//물리적파일명

			//파일 업로드 처리==> transferTo()를 이용해서 업로드 처리			
			try {
				///////////////////////////////////
				mfilename.transferTo(new File(upDir,fname2));
				////////////////////////////////
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//회원번호 가져오기
		HttpSession ses=req.getSession();
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		
		//모임번호
		cpicture.setCno(cno);
		
		if(uvo!=null) {
			
			cpicture.setIdx(uvo.getIdx());
			
			int n=CPictureSvc.insertPhoto(cpicture);
			
			//업로드 성공 >사진첩 이동, 실패>뒤로가기
			String msg=(n>0)? "사진 등록 성공":"사진 등록 실패";
			String loc=(n>0)? "photo?cno="+cno:"javascript:history.back()"; 
			
			return util.addMsgLoc(model, msg, loc);
		}
		
		return util.addMsgBack(model, "로그인을 해야해요.");
	}

	
	
	@RequestMapping("/photoMy")
	public String clubPhotoMy(Model model, HttpSession ses, @RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 내 정보 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");

		if (uvo != null) {
			// 나의 사진첩 가져오기
			CPictureVO cpvo = new CPictureVO();
			cpvo.setCno(cno);
			cpvo.setIdx(uvo.getIdx());

			List<CPictureVO> cpList = CPictureSvc.getMyPicture(cpvo);

			model.addAttribute("cpList", cpList);
		}

		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cno", cno);
		model.addAttribute("clubView", clubView);

		return "/club/clubphotoMy";
	}

	
	
	
	@RequestMapping("/photoDel")
	public String clubPhotoDel(Model model, HttpSession ses, 
			@RequestParam(defaultValue = "0") int cno,
			@RequestParam(defaultValue = "0") int cpno) {
		
		// 유효성 체크
		if (cno == 0) {
			return util.addMsgBack(model, "해당하는 모임이 없습니다.");
		}
		if (cpno == 0) {
			return util.addMsgBack(model, "삭제할 그림이 없습니다.");
		}

		int n = CPictureSvc.deletePhoto(cpno);

		String msg = (n > 0) ? "삭제 성공" : "삭제 실패";
		String loc = "photoMy?cno=" + cno;

		return util.addMsgLoc(model, msg, loc);
	}
}
