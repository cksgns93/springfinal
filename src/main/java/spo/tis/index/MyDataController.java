package spo.tis.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spo.tis.domain.McVO;
import spo.tis.domain.MtVO;
import spo.tis.domain.Paging2VO;
import spo.tis.domain.Paging3VO;
import spo.tis.domain.PagingVO;
import spo.tis.domain.TeamVO;
import spo.tis.domain.UserVO;
import spo.tis.service.MatchService;
import spo.tis.service.MyDataService;
import spo.tis.service.TeamService;
import spo.tis.service.UserService;

@Controller
@RequestMapping("/mypage")
//@Log4j
public class MyDataController {

   @Inject
   private MyDataService myDataSvc;
   
   @Inject
   private UserService userSvc;
   
   @Inject
   private MatchService matchSvc;
   @Inject
   private TeamService teamSvc;
   
   @RequestMapping(value = "/mymatch")
   public String mymatch(Model model, 
		   @ModelAttribute("mtvo") MtVO mtvo,HttpSession ses) {
	   
	   //member정보
	   UserVO user = (UserVO)ses.getAttribute("loginUser");
	   int hmno = user.getIdx();
	   
	   //idx로 매칭 신청 목록 가져오기
	   List<MtVO> selectidx= matchSvc.selectidx(hmno);
	  
	   //idx로 매칭 기록 가져오기
	   List<MtVO> selectRecord= matchSvc.selectRecord(hmno);
	   
	   model.addAttribute("selectidx", selectidx);
	   model.addAttribute("selectRecord", selectRecord);
	   
       return "mypage/mymatch";
   }

   //매칭 수락
   @RequestMapping(value = "/allowMatch")
   public ModelAndView allowMatch(ModelAndView mv, 
		   @ModelAttribute("mtvo") MtVO mtvo,HttpSession ses) {
	   
	   int mtno=mtvo.getMtno();
	   
	   //mtno의 상태 state를 1로 변경
	   int n=matchSvc.updateMtstate(mtno);
	   
	   //mtvo에 mtno와 bidx 들어있음
	   //게시글번호는 같으면서 mtno가 다른 데이터 삭제
	   int n2=matchSvc.deleteMtno(mtvo);
	   
	   mv.setViewName("redirect:mymatch");
	   return mv;
   }
   
   @RequestMapping(value = "/myteam")
   public String myteam(Model mv) {
      return "mypage/myteam";
   }
	@RequestMapping(value = "/teamEdit")
	public String teamEdit(Model mv, HttpServletRequest req, @RequestParam("tno") int tno,
			@ModelAttribute("team") TeamVO vo) {
		mv.addAttribute("tno", tno);
		MtVO teamData = myDataSvc.teamEdit(tno);
		req.setAttribute("teamData", teamData);

		return "mypage/temaEdit";

	}

	@RequestMapping(value = "/privacy")
	public String privacy(Model mv) {
		return "mypage/privacy";
	}
	
	
	@PostMapping(value = "/privacyAdd")
	public String joinEnd(Model model,@ModelAttribute("user") UserVO user){//UserVO의  이름을user라고 한것임
		//log.info("user=="+user);
		System.out.println("user=="+user);
		
		int n=userSvc.updateUser(user);
		System.out.println(n);
		System.out.println("hi");
		
		 String str=(n>0)?"수정 성공":"수정 실패"; String loc=(n>0)?"login":"privacy"; 
		 model.addAttribute("message",str); model.addAttribute("loc",loc);
		 
		return "msg";
	}

	@RequestMapping(value = "/teampage")
	public String teampage(Model mv, HttpServletRequest req,
			 @ModelAttribute("mtvo") MtVO mtvo) {

		MtVO tdata = myDataSvc.teamData();
		
		req.setAttribute("tdata", tdata);
		System.out.println(tdata);
		List<MtVO> tp = myDataSvc.tPersonnel();
		req.setAttribute("tp", tp);
		return "mypage/teampage";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("tno") int tno, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		int idx=uvo.getIdx();
		Map<String, Integer> map=new HashMap<>();
		map.put("idx",idx);
		map.put("tno", tno);
		System.out.println(tno);
		myDataSvc.teamDelete(map);
		return "mypage/mydata";
	}
	

	@RequestMapping("secession")
	public String secession(@RequestParam("tno") int tno, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		UserVO uvo = (UserVO) ses.getAttribute("loginUser");
		int idx=uvo.getIdx();
		Map<String, Integer> map=new HashMap<>();
		map.put("idx",idx);
		map.put("tno", tno);
		myDataSvc.teamsecession(map);
		return "mypage/mydata";
	}
   @GetMapping(value = "/mydata")
   public String clubPaging(Model model, HttpServletRequest req, @ModelAttribute("paging") PagingVO paging,
         @ModelAttribute("paging2") Paging2VO paging2, @ModelAttribute("paging3") Paging3VO paging3) {
     // log.info("paging====" + paging);

      int totalCount = myDataSvc.clubCount(paging);

      paging.setTotalCount(totalCount);// 총 게시글 수
      paging.setPagingBlock(5);// 페이징 블럭 단위 설정
      paging.init(req.getSession());// 페이징 연산처리 메소드 호출
     // log.info("연산 후 paging====" + paging);

      List<McVO> myclub = myDataSvc.clubList(paging);

      String myctx = req.getContextPath();
      String loc = "mypage/mydata";
      String naviStr = paging.getPageNavi(myctx, loc);

      model.addAttribute("paging", paging);
      model.addAttribute("navi", naviStr);
      model.addAttribute("myclub", myclub);

     // log.info("paging2====" + paging2);

      int totalCount2 = myDataSvc.clubHCount(paging2);

      paging2.setTotalCount(totalCount2);// 총 게시글 수
      paging2.setPagingBlock(5);// 페이징 블럭 단위 설정
      paging2.init(req.getSession());// 페이징 연산처리 메소드 호출
      //log.info("연산 후 paging2====" + paging2);

      List<McVO> myHclub = myDataSvc.clubHList(paging2);

      String myctx2 = req.getContextPath();
      String loc2 = "mypage/mydata";
      String naviStr2 = paging2.getPageNavi(myctx2, loc2);

      model.addAttribute("paging2", paging2);
      model.addAttribute("navi2", naviStr2);
      model.addAttribute("myHclub", myHclub);

     // log.info("paging3====" + paging3);

      int totalCount3 = myDataSvc.teamCount(paging3);

      paging3.setTotalCount(totalCount3);// 총 게시글 수
      paging3.setPagingBlock(5);// 페이징 블럭 단위 설정
      paging3.init(req.getSession());// 페이징 연산처리 메소드 호출
      //log.info("연산 후 paging3====" + paging3);

      List<MtVO> teamList = myDataSvc.teamList(paging3);

      String myctx3 = req.getContextPath();
      String loc3 = "mypage/mydata";
      String naviStr3 = paging3.getPageNavi(myctx3, loc3);

      model.addAttribute("paging3", paging3);
      model.addAttribute("navi3", naviStr3);
      model.addAttribute("teamList", teamList);
      
      return "mypage/mydata";
   }

}