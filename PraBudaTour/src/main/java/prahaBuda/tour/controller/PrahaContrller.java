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
	
	@RequestMapping("reserveBoard")
	public String PrahaReserveSelect(BoardDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		
		List<BoardDTO> selectList =  ReserveQuestionService.ReserveQuestionList(pageDto);
		model.addAttribute("reserveSelectList", selectList);
		model.addAttribute("page",pageDto);
		return "reserveBoard";
	}
	
	@RequestMapping("parahaReserveInsert")
	public void ParahaReserveInsert(BoardDTO boardDto) throws Exception{
		
		ReserveQuestionService.ReserveQuestionInsert(boardDto);
	}
}
