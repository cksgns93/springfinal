package spo.tis.index;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spo.tis.common.util.CommonUtil;
import spo.tis.domain.CBoardVO;
import spo.tis.domain.ClubVO;
import spo.tis.domain.UserVO;
import spo.tis.service.CBoardService;
import spo.tis.service.ClubService;

@Controller
@RequestMapping("/club")
public class ClubBoardController {

	@Inject
	private CommonUtil util;

	@Autowired
	private CBoardService CBoardSvc;

	@Autowired
	private ClubService ClubSvc;

	@RequestMapping("/board")
	public String clubBoard(Model model, @RequestParam(defaultValue = "0") int cpage,
			@RequestParam(defaultValue = "0") int cno) {

		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 글번호, 제목, 글쓴이, 날짜, 조회수 가져오기
		// List<CBoardVO> cbList = cbdao.getClubBoardList(cno);

		// 1. 총 게시글 수 가져오기
		int totalCount = CBoardSvc.getCbdTotalCount(cno);
		System.out.println(totalCount);

		int pageSize = 6; // 한 페이지당 보여줄 게시글 수

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
		CBoardVO cbvo = new CBoardVO();// start, end값을 넣을 객체 생성
		cbvo.setStart(start);
		cbvo.setEnd(end);
		cbvo.setCno(cno);

		List<CBoardVO> cbList = CBoardSvc.getCbdList(cbvo);
		int pagingBlock = 5; // 페이지를 5개 단위로 블럭 처리
		int prevBlock = 1, nextBlock = 1;

		prevBlock = (cpage - 1) / pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);

		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cpage", cpage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pagingBlock", pagingBlock);
		model.addAttribute("prevBlock", prevBlock);
		model.addAttribute("nextBlock", nextBlock);
		model.addAttribute("clubView", clubView);

		// req에 저장
		model.addAttribute("cno", cno);
		model.addAttribute("cbList", cbList);

		return "/club/clubBoard";
	}

	@RequestMapping("/boardAdd")
	public String clubBoardAdd(Model model, @RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 모임번호로 모임 정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cno", cno);
		model.addAttribute("clubView", clubView);

		return "/club/clubBoardAdd";
	}

	
	
	@RequestMapping("/boardAddEnd")
	public String clubBoardAddEnd(Model model, HttpSession ses,
			@ModelAttribute("cboardVo") CBoardVO cboardVo,
			@RequestParam(defaultValue="0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}
		//글제목, 글내용 받기
		String cbtitle=cboardVo.getCbtitle();
		String cbcontent=cboardVo.getCbcontent();
		
		if(cbtitle==null || cbcontent==null || 
				cbtitle.trim().isEmpty() || cbcontent.trim().isEmpty()) {
			
			return util.addMsgBack(model, "글제목과 글내용을 입력하지 않았습니다.");
		}
		
		//회원번호 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		if(uvo!=null) {
			//게시글 등록하기
			CBoardVO cbvo=new CBoardVO(); 
			cbvo.setCno(cno);	//모임번호
			cbvo.setIdx(uvo.getIdx());  //회원번호
			cbvo.setCbtitle(cbtitle);
			cbvo.setCbcontent(cbcontent);
	
			int n=CBoardSvc.insertBoard(cbvo);
			//System.out.println("n=="+n);
			
			String msg=(n>0)? "등록 성공":"등록 실패";
			String loc=(n>0)?  "board?cno="+cno:"javascript:history.back()";
			
			return util.addMsgLoc(model, msg, loc);
		}
		
		return "club/clubBoard";
	}

		
		
	@RequestMapping("/boardMy")
	public String clubBoardMy(Model model, HttpSession ses, @RequestParam(defaultValue = "0") int cno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		// 회원번호 가져오기
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");

		if (uvo != null) {
			// 나의 게시글 목록 가져오기
			CBoardVO cbvo = new CBoardVO();
			cbvo.setCno(cno); // 모임번호
			cbvo.setIdx(uvo.getIdx()); // 회원번호

			List<CBoardVO> cbList = CBoardSvc.getMyBoard(cbvo);

			model.addAttribute("cbList", cbList);
		}

		// 회원번호로 모임정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cno", cno);
		model.addAttribute("clubView", clubView);

		return "/club/clubBoardMy";
	}

	@RequestMapping("/boardDel")
	public String clubBoardDel(Model model, @RequestParam(defaultValue = "0") int cno,
			@RequestParam(defaultValue = "0") int cbno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		if (cbno == 0) {
			return util.addMsgBack(model, "삭제할 글이 없습니다.");
		}

		int n = CBoardSvc.deleteBoard(cbno);

		String msg = (n > 0) ? "삭제 성공" : "삭제 실패";
		String loc = "boardMy.do?cno=" + cno;
		
		return util.addMsgLoc(model, msg, loc);
	}

	@RequestMapping("/boardEdit")
	public String clubBoardEdit(Model model, @RequestParam(defaultValue = "0") int cno,
			@RequestParam(defaultValue = "0") int cbno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		if (cbno == 0) {
			return util.addMsgBack(model, "수정할 글이 없습니다.");
		}

		CBoardVO cbvo = CBoardSvc.getBoardDetail(cbno);

		// 회원번호로 모임정보 가져오기
		ClubVO clubView = ClubSvc.viewClub(cno);

		model.addAttribute("cno", cno);
		model.addAttribute("cbno", cbno);
		model.addAttribute("clubView", clubView);
		model.addAttribute("cbvo", cbvo);

		return "/club/clubBoardEdit";
	}
	
	
	
	
	@RequestMapping("/boardEditEnd")
	public String clubBoardEditEnd(Model model, 
			@RequestParam(defaultValue = "0") int cno,
			@RequestParam(defaultValue = "0") int cbno,
			@ModelAttribute("cboardVo") CBoardVO cboardVo) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		if (cbno == 0) {
			return util.addMsgBack(model, "수정할 글이 없습니다.");
		}
		
		//글제목, 글내용 받기
		String cbtitle=cboardVo.getCbtitle();
		String cbcontent=cboardVo.getCbcontent();
		
		if(cbtitle==null || cbcontent==null || 
				cbtitle.trim().isEmpty() || cbcontent.trim().isEmpty()) {
			
			return util.addMsgBack(model, "글제목과 글내용을 입력하지 않았습니다.");
		}
		
		
		//게시글 등록하기
		CBoardVO cbvo=new CBoardVO(); 
		cbvo.setCbno(cbno);
		cbvo.setCbtitle(cbtitle);
		cbvo.setCbcontent(cbcontent);

		int n=CBoardSvc.updateBoard(cbvo);
		
		String msg=(n>0)? "수정 성공":"수정 실패";
		String loc="boardMy.do?cno="+cno;
		
		return util.addMsgLoc(model, msg, loc);
		
	}
		
		

	@RequestMapping("/boardView")
	public String clubBoardView(Model model, @RequestParam(defaultValue = "0") int cno,
			@RequestParam(defaultValue = "0") int cbno) {

		// 유효성 체크 => list로 redirect이동
		if (cno == 0) {
			return "redirect:list";
		}

		if (cbno == 0) {
			return util.addMsgBack(model, "해당하는 게시글이 없습니다.");
		}

		// 조회수 증가
		int n = CBoardSvc.udpateCbReadnum(cbno);

		CBoardVO cboard = CBoardSvc.getBoardDetail(cbno);

		// req에 저장
		model.addAttribute("cboard", cboard);
		model.addAttribute("cno", cno);

		// 페이지 이동
		return "/club/clubBoardView";

	}
}
