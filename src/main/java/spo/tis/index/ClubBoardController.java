package spo.tis.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClubBoardController {
	
	@RequestMapping(value="clubBoard")
	public String clubBoard() {
		return "club/clubBoard";
	}

}
