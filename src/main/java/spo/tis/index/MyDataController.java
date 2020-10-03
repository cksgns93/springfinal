package spo.tis.index;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import spo.tis.domain.McVO;
import spo.tis.domain.PagingVO;
import spo.tis.service.MyDataService;

@Controller
@RequestMapping("/mypage")
//@Log4j
public class MyDataController {

   @Inject
   private MyDataService myDataSvc;
   
   
   @RequestMapping(value="/mymatch")
   public String mymatch(Model mv){
      return "mypage/mymatch";
   }
   
   @RequestMapping(value="/myteam")
   public String myteam(Model mv){
      return "mypage/myteam";
   }
   
   @RequestMapping(value="/myteamselect")
   public String myteamselect(Model mv){
      
      
      
      return "mypage/myteamselect";
      
   }
   
   @RequestMapping(value="/privacy")
   public String privacy(Model mv){
      return "mypage/privacy";
   }
   
   @RequestMapping(value="/teampage")
   public String teampage(Model mv){
      return "mypage/teampage";
   }
   
   @GetMapping(value="/mydata")
   public String clubPaging(Model model,HttpServletRequest req,
         @ModelAttribute("paging") PagingVO paging) {
      //log.info("paging===="+paging);
      
      int totalCount=myDataSvc.clubCount(paging);
      
      paging.setTotalCount(totalCount);//총 게시글 수
      paging.setPagingBlock(5);//페이징 블럭 단위 설정
      paging.init(req.getSession());//페이징 연산처리 메소드 호출
      //log.info("연산 후 paging===="+paging);
      
      List<McVO> myclub=myDataSvc.clubList(paging);
      
      String myctx=req.getContextPath();
      String loc="mypage/mydata";
      String naviStr=paging.getPageNavi(myctx, loc);
      
      model.addAttribute("paging", paging);
      model.addAttribute("navi", naviStr);
      model.addAttribute("myclub", myclub);
      
      return "mypage/mydata";
   }

   @GetMapping(value="/mydata2")
   public String clubHistoryPaging(Model model,HttpServletRequest req,
         @ModelAttribute("paging") PagingVO paging) {
      //log.info("paging===="+paging);
      
      int totalCount=myDataSvc.clubHCount(paging);
      
      paging.setTotalCount(totalCount);//총 게시글 수
      paging.setPagingBlock(5);//페이징 블럭 단위 설정
      paging.init(req.getSession());//페이징 연산처리 메소드 호출
     // log.info("연산 후 paging===="+paging);
      
      List<McVO> myHclub=myDataSvc.clubHList(paging);
      
      String myctx=req.getContextPath();
      String loc="mypage/mydata2";
      String naviStr=paging.getPageNavi(myctx, loc);
      
      model.addAttribute("paging", paging);
      model.addAttribute("navi2", naviStr);
      model.addAttribute("myHclub", myHclub);
      
      return "mypage/clubHList";
   }
   

}