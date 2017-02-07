package prahaBuda.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import prahaBuda.tour.service.ReserveQuestionService;
import prahaBuda.tour.dto.*;

@Controller
@RequestMapping("praha")
public class PrahaContrller {
	
	@Autowired
	private ReserveQuestionService ReserveQuestionService;
	
	@RequestMapping("{fileName}")
	public String noneSignUpMove(
			@PathVariable("fileName") String fileName){
		return fileName;
	}
	
	@RequestMapping("/praha/reserveQuestion")
	public String PrahaReserveSelect(BoardDTO boardDto,Model model) throws Exception{
		
		List<BoardDTO> selectList =  ReserveQuestionService.ReserveQuestionSelect();
		model.addAttribute("reserveSelectList", selectList);
		System.out.println("전송되는 List 갯수 : " +selectList);
		 
		return "praha/reserveQuestion";
	}
	
	@RequestMapping("parahaReserveInsert")
	public void ParahaReserveInsert(BoardDTO boardDto) throws Exception{
		
		ReserveQuestionService.ReserveQuestionInsert(boardDto);
	}
}
