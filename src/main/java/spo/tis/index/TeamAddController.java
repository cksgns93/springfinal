package spo.tis.index;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spo.tis.domain.TeamVO;
import spo.tis.domain.UserVO;
import spo.tis.service.TeamService;

@Controller
public class TeamAddController {

   @Inject
   private TeamService teamSvc;
   
   @RequestMapping(value = "/teamAdd")
   public String teamAdd() {
      return "match/teamAdd";
   }

   @RequestMapping(value = "/teamAddEnd")
   public String teamAddEnd(Model model, @ModelAttribute("team") TeamVO team, HttpSession ses) {
      System.out.println("user=="+team);
      UserVO vo = (UserVO)ses.getAttribute("loginUser");
      String tking = vo.getName();
      System.out.println(tking);
      team.setTking(tking);

      int n = teamSvc.insertTeam(team);
      String str = (n > 0) ? "ÆÀµî·Ï ¼º°ø" : "ÆÀµî·Ï ½ÇÆÐ";
      String loc = (n > 0) ? "index" : "signup";
      model.addAttribute("message", str);
      model.addAttribute("loc", loc);

      return "msg";
   }

}