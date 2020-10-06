package spo.tis.index;

import java.util.List;

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
import spo.tis.service.MyDataService;
import spo.tis.service.TeamService;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamSvc;
	
	@Autowired
	private MyDataService myDataSvc;

	@RequestMapping(value = "/teamBoard")
	public String teamBoard(Model model, @RequestParam(defaultValue = "0") int cpage) {

		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}

		model.addAttribute("cpage", cpage);

		return "match/teamBoard";
	}

	@RequestMapping(value = "/teamList")
	public String matchList(Model model, @RequestParam(defaultValue = "0") int cpage) throws Exception {
		
		// 현재 페이지
		if (cpage == 0) {
			cpage = 1;
		}

		// 1. 총 게시글 수 가져오기
		int totalCount = teamSvc.getTotalCount();
		// System.out.println(totalCount);

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
		TeamVO tvo = new TeamVO();// start, end값을 넣을 객체 생성
		tvo.setStart(start);
		tvo.setEnd(end);

		List<TeamVO> tlist = teamSvc.listTeam2(tvo);// 변경
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
		model.addAttribute("tlist", tlist);

		return "match/teamList";
	}

	@RequestMapping(value = "/teamAdd")
	public String teamAdd() {
		return "match/teamAdd";
	}

	@RequestMapping(value = "/teamAddEnd")
	public String teamAddEnd(Model model, @ModelAttribute("team") TeamVO team, HttpSession ses) {
		System.out.println("user==" + team);
		UserVO vo = (UserVO) ses.getAttribute("loginUser");
		String tking = vo.getName();
		System.out.println(tking);
		team.setTking(tking);
		team.setIdx(vo.getIdx());

		int n = teamSvc.insertTeam(team);
		String str = (n > 0) ? "팀등록 성공" : "팀등록 실패";
		String loc = (n > 0) ? "index" : "signup";
		model.addAttribute("message", str);
		model.addAttribute("loc", loc);

		return "msg";
	}
	
	@RequestMapping(value = "/teampage")
	public String teampage(Model mv,HttpServletRequest req) {
		
		MtVO tdata=myDataSvc.teamData();
		req.setAttribute("tdata",tdata);
		System.out.println(tdata);
		List<MtVO> tp=myDataSvc.tPersonnel();
		req.setAttribute("tp", tp);
		return "mypage/teampage";
	}

}
