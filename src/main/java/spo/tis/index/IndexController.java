package spo.tis.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/top")
	public void showTop() {
		//top 보여주자
	}
	
	@RequestMapping(value="/index")
	public String home(Model mv){
		return "index";
	}
	
	
	@RequestMapping("/foot")
	public void showFoot() {
		
	}
	
	@RequestMapping("/")
	public void show() {
		
	}

}
