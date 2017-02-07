package prahaBuda.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import favicon.tour.service.ReserveQuestionService;
import favicon.tour.dto.*;

@Controller
@RequestMapping("praha")
public class PrahaContrller {
	
	@Autowired
	private ReserveQuestionService ReserveQuestionService;
	
	@RequestMapping("{viewName}/{fileName}")
	public String noneSignUpMove(
			@PathVariable("viewName") String viewName,
			@PathVariable("fileName") String fileName){
		return viewName+"/"+fileName;
	}
	
	@RequestMapping("prahaMain")
	public String PrahaMain(){
		try {
			ReserveQuestionService.ReserveQuestionInsert();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "praha/prahaMain";
	}
	
	
}
