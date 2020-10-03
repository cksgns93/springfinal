package spo.tis.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spo.tis.domain.UserVO;
import spo.tis.service.UserService;

@Controller
public class JoinController {
	
	@Autowired
	private UserService userSvc;
	
	@RequestMapping(value="/signup")
	public String join(Model mv){
		return "member/signup";
	}
	
	@PostMapping("/join")
	public String joinEnd(Model model,@ModelAttribute("user") UserVO user){//UserVO의  이름을user라고 한것임
		//log.info("user=="+user);
		System.out.println("user=="+user);
		
		int n=userSvc.createUser(user);
		System.out.println("hi");
		
		 String str=(n>0)?"회원가입 성공":"가입실패"; String loc=(n>0)?"index":"signup"; 
		 model.addAttribute("message",str); model.addAttribute("loc",loc);
		 
		return "msg";
	}
	
}