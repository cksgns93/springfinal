package spo.tis.index;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spo.tis.domain.MtVO;
import spo.tis.domain.TeamVO;
import spo.tis.domain.UserVO;
import spo.tis.domain.matchaddVO;
import spo.tis.service.MatchService;
import spo.tis.service.TeamService;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchSvc;

	@Inject
	private TeamService teamSvc;

	@RequestMapping(value = "/matchBoard")
	public String matchBoard(Model model,
			 @RequestParam(defaultValue = "0") int cpage) {

		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}

		model.addAttribute("cpage", cpage);
		
		return "match/matchBoard";
	}

	@RequestMapping(value = "/matchList")
	public String matchList(Model m, HttpServletRequest req) throws Exception {


		// 현재 페이지
		String cpStr = req.getParameter("cpage");
		if (cpStr == null || cpStr.trim().isEmpty()) {
			cpStr = "1";
		}
		int cpage = Integer.parseInt(cpStr);
		System.out.println("cpage="+cpage);
		
		// 1. 총 게시글 수 가져오기
		int totalCount = matchSvc.getTotalCount();
		//System.out.println(totalCount);

		int pageSize = 5; // 한 페이지당 보여줄 게시글 수

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
		matchaddVO mvo = new matchaddVO();// start, end값을 넣을 객체 생성
		mvo.setStart(start);
		mvo.setEnd(end);

		List<matchaddVO> mlist = matchSvc.getAllMatch(mvo); //변경
		int pagingBlock = 5; // 페이지를 5개 단위로 블럭 처리
		int prevBlock = 1, nextBlock = 1;

		prevBlock = (cpage - 1) / pagingBlock * pagingBlock;
		nextBlock = prevBlock + (pagingBlock + 1);

		req.setAttribute("cpage", cpage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);

		// 반환해주는 List<CmatchaddVO>를 req에 저장
		m.addAttribute("mlist", mlist);

		return "match/list";
	}

	@RequestMapping(value = "/matchAdd")
	public String matchAdd(Model mv, HttpServletRequest req, HttpSession ses) {
		UserVO mtuser = (UserVO) ses.getAttribute("loginUser");
		String user = mtuser.getName();
		System.out.println(user);
		TeamVO vo = teamSvc.Teaminfo(user);

		req.setAttribute("tvo", vo);

		return "match/matchAdd";
	}

	@RequestMapping(value = "/matchAddEnd")
	public String matchAddEnd(Model model, @ModelAttribute("match") matchaddVO match,
			@ModelAttribute("Team") TeamVO Team, HttpSession ses, HttpServletRequest req) {

		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		TeamVO tvo = teamSvc.selectByKname(uvo.getName());
		System.out.println(tvo);
		String mno = req.getParameter("mno");
		int tno = tvo.getTno();
		int idx = uvo.getIdx(); //추가
		String game = req.getParameter("game");
		String mname = req.getParameter("mname");
		String away = req.getParameter("away");
		String mcontent = req.getParameter("mcontent");
		String addr = req.getParameter("addr");
		String ph1 = req.getParameter("ph1");
		String ph2 = req.getParameter("ph2");
		String ph3 = req.getParameter("ph3");
		String map = req.getParameter("map");
		String tlevel = req.getParameter("tlevel");

		matchaddVO vo = new matchaddVO(0, tno, idx, game, mname, away, mcontent, null, addr, ph1, ph2, ph3, map, tlevel,
				null);

		int n = matchSvc.insertMatching(vo);

		String msg = (n > 0) ? "등록성공" : "등록실패";
		String loc = (n > 0) ? "matchBoard" : "javascript:history.back()";

		req.setAttribute("message", msg);
		req.setAttribute("loc", loc);

		return "msg";
	}

	@RequestMapping(value = "/match")
	public String match(Model m, HttpServletRequest req, @ModelAttribute("matchadd") matchaddVO match)
			throws Exception {
		String mno = match.getMno() + ""; //글쓴 사람 매치글번호
		
		matchaddVO vo = matchSvc.getMatchinfo(mno);
		//System.out.println(vo.getGame());
		m.addAttribute("vo", vo);

		return "match/match";
	}
	
	@RequestMapping(value = "/mtstart")
	public String mtStart(Model model, HttpServletRequest req, 
			@ModelAttribute("mtvo") MtVO mtvo) {
		String bidx = mtvo.getBidx();
		int amno = mtvo.getAmno();
		
		matchaddVO vo = matchSvc.getMatchinfo(bidx); //글번호로 글쓴 사람 정보 가져오기
		int hmno=vo.getIdx();
		
		mtvo.setBidx(bidx); //글번호 
		mtvo.setAmno(amno); //매치 신청한 사람의 회원번호
		mtvo.setHmno(hmno); //글 쓴 사람 회원번호
		
		TeamVO tvo1 = teamSvc.Teaminfo2(amno);
		TeamVO tvo2 = teamSvc.Teaminfo2(hmno);
		
		mtvo.setAtno(tvo1.getIdx()); //매치 신청한 사람의 팀번호
		mtvo.setHtno(tvo2.getIdx()); //글쓴 사람의 팀번호
		
		int n = this.matchSvc.applymatch(mtvo);

		String msg = (n > 0) ? "신청성공" : "신청실패";
		String loc = (n > 0) ? "index" : "javascript:history.back()";

		req.setAttribute("message", msg);
		req.setAttribute("loc", loc);

		return "msg"; 
		
	}
	
	
	@RequestMapping(value = "/matchFind")
	public String matchFind(Model model, 
			@ModelAttribute("mtvo") matchaddVO mtvo,
			@RequestParam(defaultValue = "0") int cpage) {

		//String findType = mtvo.getFindType();
		//String findKeyword = mtvo.getFindKeyword();
		//String selSports = mtvo.getSelSports();
		//System.out.println("findType="+findType);
		//System.out.println("findKeyword="+findKeyword);
		
		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}
		
		//vo생성
		//matchaddVO mvo = new matchaddVO();// start, end값을 넣을 객체 생성
		//mvo.setFindType(findType);
		//mvo.setFindKeyword(findKeyword);
		//mvo.setSelSports(selSports);
		
		// 1. 총 게시글 수 가져오기
		int totalCount = matchSvc.getFindCount(mtvo);
		//System.out.println("totalCount="+totalCount);

		int pageSize = 5; // 한 페이지당 보여줄 게시글 수

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
		mtvo.setStart(start);
		mtvo.setEnd(end);

		List<matchaddVO> mlist = matchSvc.getFindMatch(mtvo); //변경
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

		// 반환해주는 List<CmatchaddVO>를 req에 저장
		model.addAttribute("mlist", mlist);
		
		return "match/matchFind";
		
	}
	
	
	@RequestMapping(value = "/matchFindCate")
	public String matchFindCate(Model model, 
			@ModelAttribute("mtvo") matchaddVO mtvo,
			@RequestParam(defaultValue = "0") int cpage) {

		//String selSports = mtvo.getSelSports();
		//System.out.println("selSports="+selSports);
		
		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}
		
		//vo생성
		//matchaddVO mvo = new matchaddVO();// start, end값을 넣을 객체 생성
		//mvo.setSelSports(selSports);
		
		// 1. 총 게시글 수 가져오기
		int totalCount = matchSvc.getFindCateCount(mtvo);
		//System.out.println("totalCount="+totalCount);

		int pageSize = 5; // 한 페이지당 보여줄 게시글 수

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
		mtvo.setStart(start);
		mtvo.setEnd(end);

		List<matchaddVO> mlist = matchSvc.getFindMatchCate(mtvo); //변경
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

		// 반환해주는 List<CmatchaddVO>를 req에 저장
		model.addAttribute("mlist", mlist);

		return "match/matchFindCate";
	}
	
}
