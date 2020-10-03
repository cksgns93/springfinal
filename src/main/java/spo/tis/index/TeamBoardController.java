package spo.tis.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spo.tis.domain.TeamVO;
import spo.tis.service.TeamService;

@Controller
public class TeamBoardController {
	
	@Autowired
	   private TeamService teamSvc;

	@RequestMapping(value="/teamBoard")
	public String teamBoard() {
		
		return "match/teamBoard";
	}
	
	 @RequestMapping(value="/teamList")
	   public String matchList(Model m,HttpServletRequest req) throws Exception {

	      List<TeamVO> tlist = teamSvc.getAllTeam();
	      
	      m.addAttribute("tlist", tlist);
	      
	      return "match/teamList";
	  }
	
}
