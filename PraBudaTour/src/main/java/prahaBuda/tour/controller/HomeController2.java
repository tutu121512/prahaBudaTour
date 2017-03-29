package prahaBuda.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("r")
public class HomeController2 {
	
	@RequestMapping("re")
	public String homed(RedirectAttributes redirect){
		return "redirect:praha/prahaMain";
	}
}
