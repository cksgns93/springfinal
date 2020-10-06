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
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import spo.tis.common.util.CommonUtil;
import spo.tis.domain.ClubVO;
import spo.tis.domain.MemberVO;
import spo.tis.domain.UserVO;
import spo.tis.service.ClubService;
import spo.tis.service.MemberService;

@Controller
@RequestMapping("/club")
@Log4j
public class ClubController {
	
	@Autowired
	private ClubService ClubSvc;
	
	@Autowired
	private MemberService MemberSvc;
	
	@Inject
	private CommonUtil util;
	
	/*모임 리스트*/
	@RequestMapping("/list")
	public String clubList(Model model, @RequestParam(defaultValue="0") int cpage) {
		
		// 현재 페이지
		//String cpStr = req.getParameter("cpage");
		if (cpage==0) {
			cpage = 1;
		}
		//int cpage = Integer.parseInt(cpStr);

		// 1. 총 게시글 수 가져오기
		int totalCount = ClubSvc.getTotalCount();
		System.out.println(totalCount);

		int pageSize = 4; // 한 페이지당 보여줄 게시글 수

		int pageCount = (totalCount - 1) / pageSize + 1;
		if (cpage < 1) {
			cpage = 1; // 첫 페이지로 지정
		}
		if (cpage > pageCount) {
			cpage = pageCount; // 마지막 페이지로 지정
		}
		// DB에서 끊어오기 위한 변수(start, end) 값 구하기
		int end = cpage * pageSize;
		int start = end - (pageSize - 1);

		// 2. 게시목록 가져오기
		ClubVO cvo = new ClubVO();// start, end값을 넣을 객체 생성
		cvo.setStart(start);
		cvo.setEnd(end);

		List<ClubVO> clubList = ClubSvc.listClub2(cvo);
		int pagingBlock = 5; // 페이지를 5개 단위로 블럭 처리
		int prevBlock = 1, nextBlock = 1;

		prevBlock = (cpage - 1) / pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);

		model.addAttribute("cpage", cpage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pagingBlock", pagingBlock);
		model.addAttribute("prevBlock", prevBlock);
		model.addAttribute("nextBlock", nextBlock);

		// 반환해주는 List<ClubdVO>를 req에 저장
		model.addAttribute("clubList", clubList);

		return "club/clubList";
	}
	
	
	
	
	/*모임 만들기*/
	@RequestMapping("/add")
	public String clubAdd() {
		
		return "club/clubAdd";
	}
	
	


	/*모임 만들기(end)*/
	@RequestMapping("/addEnd")
	public String clubAddEnd(Model model, 
			HttpServletRequest req,
			@ModelAttribute("clubVo") ClubVO clubVo,
			@RequestParam("mcimage") MultipartFile mcimage) {
		
		log.info("clubVo="+clubVo);
		log.info("mcimage="+mcimage);
		
		String cname=clubVo.getCname();
		String csports=clubVo.getCsports();
		String cplace=clubVo.getCplace();
		String chp1=clubVo.getChp1();
		String chp2=clubVo.getChp2();
		String chp3=clubVo.getChp3();
		String cinfo=clubVo.getCinfo();
		
		int chp1_int = Integer.parseInt(chp1);
		int chp2_int = Integer.parseInt(chp2);
		int chp3_int = Integer.parseInt(chp3);
		
		//유효성 체크
		if (cname == null || cname.trim().isEmpty() || chp1 == null || chp1.trim().isEmpty()
			|| chp2 == null || chp2.trim().isEmpty() || chp3 == null || chp3.trim().isEmpty()
			|| cinfo == null || cinfo.trim().isEmpty() || mcimage == null) {
			
			return util.addMsgBack(model, "값을 입력하지 않았습니다. 다시 모임을 만들어 주세요.");
			
		}
			
		//업로드할 디렉토리의 절대경로 얻어오기
		ServletContext ctx = req.getServletContext();
		String upDir = ctx.getRealPath("/clubimage");
		log.info("upDir===" + upDir);
		
		File dir=new File(upDir);
		if(! dir.exists()) {
			dir.mkdirs();//디렉토리 생성
		}
		//파일을 첨부했다면
		if(!mcimage.isEmpty()) {
			
			//첨부파일명, 파일 크기를 알아내자.
			String fname=mcimage.getOriginalFilename();//원본파일명
			
			//첨부파일이 이미 존재하는 파일일 경우 덮어쓰기를 방지하기 위해
			UUID uuid=UUID.randomUUID();//랜덤한 문자열을 발생시키기 위해 UUID객체를 얻어오자.
			String str=uuid.toString();
			String fname2=str+"_"+fname;//물리적파일명
			
			clubVo.setCimage(fname2); ;//물리적파일명

			//파일 업로드 처리==> transferTo()를 이용해서 업로드 처리			
			try {
				///////////////////////////////////
				mcimage.transferTo(new File(upDir,fname2));
				////////////////////////////////
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//모임 테이블에 insert
		//ClubVO cvo=new ClubVO(cname, csports, cplace, cinfo, chp1, chp2, chp3, cimage);
		int n=ClubSvc.insertClub(clubVo);
		
		//내 정보 가져오기
		HttpSession ses=req.getSession();
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		
		//mc테이블에 모임장 추가(grade가 1)
		if(uvo!=null) {
			
			clubVo.setIdx(uvo.getIdx());
			int n2=ClubSvc.insertMCKing(clubVo);
		}
				
		//업로드 성공 >사진첩 이동, 실패>뒤로가기
		String msg=(n>0)? "모임 등록 성공":"모임 등록 실패";
		String loc=(n>0)? "list" : "javascript:history.back()"; 
		
		return util.addMsgLoc(model, msg, loc);
	}
	

	
	/*모임 상세페이지*/
	@RequestMapping("/view")
	public String clubView(Model model, HttpSession ses,
			@RequestParam(defaultValue="0") int cno) {
		
		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}
		//System.out.println("cno="+cno);
		
		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		// 모임번호로 모임에 가입된 사람들 정보 가져오기
		List<MemberVO> mList = MemberSvc.getJoinInfo(cno);

		// 내 정보 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");

		// 모임장의 idx 가져오기
		int kingIdx = ClubSvc.getClubKingInfo(cno);

		String joincheck = "noJoin";
		if (uvo != null && kingIdx != 0) {
			int idx = uvo.getIdx();
			// System.out.println(idx);

			for (MemberVO mvo : mList) {
				// System.out.println(mvo.getIdx());

				if (idx == mvo.getIdx()) {
					joincheck = "join";

					if (idx == kingIdx) {
						joincheck = "king";
					}
				}
			}
		}

		// req에 저장
		model.addAttribute("clubView", clubView);
		model.addAttribute("mList", mList);
		model.addAttribute("joincheck", joincheck);

		return "club/clubView";
	}
	
	
	
	
	
	
	/*모임 가입하기*/
	@RequestMapping("/join")
	public ModelAndView clubJoin(ModelAndView mv, HttpSession ses,
			@RequestParam(defaultValue = "0") int cno) {
		
		//유효성 체크
		if (cno == 0) {
			mv.setViewName("redirect:list");
			return mv;
		}

		// 내 정보 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");

		// n이 실패일지 성공일지 체크안함=> 필요??
		if (uvo != null) {
			ClubVO cvo = new ClubVO();
			cvo.setCno(cno);
			cvo.setIdx(uvo.getIdx());

			// 모임에 가입하기
			int n1 = ClubSvc.insertMC(cvo);

			// 모임 멤버 수 증가시키기
			int n2 = ClubSvc.incCNumber(cno);
		
		}
		
		mv.setViewName("redirect:view?cno="+cno);
		return mv;
	}
	
	
	/*모임 탈퇴하기 */
	@RequestMapping("/joinDel")
	public ModelAndView clubJoinDel(ModelAndView mv, HttpSession ses,
			@RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크
		if (cno == 0) {
			mv.setViewName("redirect:list");
			return mv;
		}
		
		//내 정보 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		
		
		//n이 실패일지 성공일지 체크안함=> 필요??
		if(uvo!=null) {		
			//모임에서 탈퇴하기(mcstate를 0으로 update)
			int n1=ClubSvc.updateMC(uvo.getIdx());
						
			//탈퇴일 기록
			int n2=ClubSvc.updateOutdate(uvo.getIdx());
			
			//모임 멤버 수 감소시키기
			int n3=ClubSvc.decCNumber(cno);
		}
		
		mv.setViewName("redirect:view?cno="+cno);
		return mv;		
	}
	
	
	/*모임장이 모임회원 탈퇴시키기 */
	@RequestMapping("/drop")
	public ModelAndView clubDrop(Model model, ModelAndView mv, @RequestParam(defaultValue = "0") int idx,
			@RequestParam(defaultValue = "0") int cno) {
		
		// 유효성 체크 => list.do로 redirect이동
		if (cno == 0) {
			mv.setViewName(util.addMsgBack(model, "모임이 없습니다."));
			return mv;
		}
		if (idx == 0) {
			mv.setViewName(util.addMsgBack(model, "탈퇴시킬 회원을 선택해주세요."));
			return mv;
		}
		
		//모임에서 탈퇴하기(mcstate를 0으로 update)
		int n1=ClubSvc.updateMC(idx);
					
		//탈퇴일 기록
		int n2=ClubSvc.updateOutdate(idx);
		
		//모임 멤버 수 감소시키기
		int n3=ClubSvc.decCNumber(cno);
		
		mv.setViewName("redirect:view?cno="+cno);
		return mv;	
	}
	
	
	
	/* 검색하기 */
	@RequestMapping("/find")
	public String clubFind(Model model, HttpSession ses,
			@ModelAttribute("clubVo") ClubVO clubVo,
			@RequestParam(defaultValue="0") int cpage) {

		//검색 관련 사항들 받기
		String findType=clubVo.getFindType();
		String findKeyword=clubVo.getFindKeyword();
		String sportsType=clubVo.getSportsType();
		
		//값 확인
		//System.out.println("findType :"+findType);
		//System.out.println("findKeyword :"+findKeyword);
		//System.out.println("sportsType :"+sportsType);
		
		
		//유효성 체크
		if(findType==null || findType.equals("0")) {
			findType=clubVo.getFindTypeh();
			findKeyword=clubVo.getFindKeywordh();
			sportsType=clubVo.getSportsTypeh();
			
			if(findType==null || findType.equals("0")||
					(findType.equals("1") && (findKeyword.trim().isEmpty() || findKeyword==null)) 	) {
				return util.addMsgBack(model, "검색유형과 검색어를 입력하세요.");
			}
		}
		
		if(findType.equals("1") && (findKeyword.trim().isEmpty() || findKeyword==null) ) {
			findType=clubVo.getFindTypeh();
			findKeyword=clubVo.getFindKeywordh();
			sportsType=clubVo.getSportsTypeh(); 
			
			if(findType==null || findType.equals("0")||
					(findType.equals("1") && (findKeyword.trim().isEmpty() || findKeyword==null)) 	) {
				return util.addMsgBack(model, "검색유형과 검색어를 입력하세요.");
			}
		}
		
		//나중 값 확인
		//System.out.println("findType :"+findType);
		//System.out.println("findKeyword :"+findKeyword);
		//System.out.println("sportsType :"+sportsType);
		
		//현재 페이지
		if (cpage==0) {
			cpage = 1;
		}
		
		//1. 총 게시글 수 가져오기 
		ClubVO cvo = new ClubVO();//start, end값을 넣을 객체 생성
		cvo.setFindKeyword(findKeyword);
		cvo.setSportsType(sportsType);
		
		int totalCount=0; //총 게시글 수 
		if(findType.equals("1")) { //모임이름
			totalCount = ClubSvc.getFindNameCount(cvo);  //검색한 게시글 수
		}else if(findType.equals("2")){ //종목
			totalCount = ClubSvc.getFindSportsCount(cvo); 
		}
		//System.out.println(totalCount);
		
		int pageSize = 4; //한 페이지당 보여줄 게시글 수 
		
		int pageCount=(totalCount-1)/pageSize + 1;
		if(cpage<1) {
			cpage=1; // 첫 페이지로 지정 
		}
		if(cpage>pageCount) {
			cpage=pageCount; //마지막 페이지로 지정
		}
		//DB에서 끊어오기 위한 변수(start, end) 값 구하기 
		int end=cpage * pageSize;
		int start = end - (pageSize-1);
		
		//2. 게시목록 가져오기	 	
		cvo.setStart(start);
		cvo.setEnd(end);
		
		List<ClubVO> clubList=null; //게시목록
		if(findType.equals("1")) { //모임이름
			clubList = ClubSvc.findClubByName(cvo);   
		}else if(findType.equals("2")){ //종목
			clubList = ClubSvc.findClubBySports(cvo); 
		}
		
		int pagingBlock=5; //페이지를 5개 단위로 블럭 처리
		int prevBlock=1, nextBlock=1;
		
		prevBlock=(cpage-1)/pagingBlock * pagingBlock;
		nextBlock=prevBlock + (pagingBlock+1);
		
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pagingBlock", pagingBlock);
		model.addAttribute("prevBlock", prevBlock);
		model.addAttribute("nextBlock", nextBlock);		
		
		//검색
		model.addAttribute("findType", findType);
		model.addAttribute("findKeyword", findKeyword);
		model.addAttribute("sportsTypeh", sportsType);
		
		//반환해주는 List<ClubdVO>를 req에 저장
		model.addAttribute("clubList", clubList);
		
		return "club/clubFind";
	}
}
