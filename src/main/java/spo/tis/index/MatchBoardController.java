package spo.tis.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spo.tis.domain.matchaddVO;
import spo.tis.service.MatchService;

@Controller
public class MatchBoardController {

	@Autowired
	private MatchService matchSvc;
	
	@RequestMapping(value="/matchBoard")
	public String matchBoard(Model mv){
		return "match/matchBoard";
	}
	@RequestMapping(value="/matchList")
	public String matchList(Model m,HttpServletRequest req) throws Exception {

		List<matchaddVO> mlist = matchSvc.getAllMatch();
		
		m.addAttribute("mlist", mlist);
		
		return "match/list";
	}
	
	@RequestMapping(value="/match")
	public String match(Model m,HttpServletRequest req,
			@ModelAttribute("matchadd") matchaddVO match) throws Exception {
		String mno = match.getMno()+"";
		matchaddVO vo = matchSvc.getMatchinfo(mno);
		System.out.println(vo.getGame());
		m.addAttribute("vo", vo);
		
		return "match/match";
	}
}
