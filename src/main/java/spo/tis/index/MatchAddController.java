package spo.tis.index;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spo.tis.domain.TeamVO;
import spo.tis.domain.UserVO;
import spo.tis.domain.matchaddVO;
import spo.tis.service.MatchService;
import spo.tis.service.TeamService;

@Controller
public class MatchAddController {
   
   @Inject
   private MatchService matchSvc;
   @Inject
   private TeamService teamSvc;
   
   @RequestMapping(value="/matchAdd")
   public String matchAdd(Model mv,HttpServletRequest req,HttpSession ses){
     UserVO mtuser = (UserVO)ses.getAttribute("loginUser");
      String user = mtuser.getName();
      System.out.println(user);
      TeamVO vo = teamSvc.Teaminfo(user);
      
      req.setAttribute("tvo", vo);

      return "match/matchAdd";
   }
   
   @RequestMapping(value = "/matchAddEnd")
   public String teamAddEnd(Model model, @ModelAttribute("match") matchaddVO match
         ,@ModelAttribute("Team") TeamVO Team ,HttpSession ses,HttpServletRequest req) {
      
        UserVO uvo = (UserVO)ses.getAttribute("loginUser");
         TeamVO tvo = teamSvc.selectByKname(uvo.getName());
         System.out.println(tvo);
         String mno=req.getParameter("mno");
         int tno=tvo.getTno();
         String game=req.getParameter("game");
         String mname=req.getParameter("mname");
         String away=req.getParameter("away");
         String mcontent=req.getParameter("mcontent");
         String addr=req.getParameter("addr");
         String ph1=req.getParameter("ph1");
         String ph2=req.getParameter("ph2");
         String ph3=req.getParameter("ph3");
         String map=req.getParameter("map");
         String tlevel=req.getParameter("tlevel");
         
         matchaddVO vo=new matchaddVO(0,tno,game,mname,away,mcontent,null,addr,ph1,ph2,ph3,map,tlevel,null);
         
         int n=matchSvc.insertMatching(vo);
         
         String msg=(n>0)?"등록성공":"등록실패";
         String loc=(n>0)?"matchBoard":"javascript:history.back()";
         
         req.setAttribute("message", msg);
         req.setAttribute("loc", loc);

      return "msg";
   }
}