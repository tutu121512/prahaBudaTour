package prahaBuda.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.service.*;
import prahaBuda.tour.dto.*;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired 
	private ReviewService ReviewService;
	
	
	@RequestMapping("{fileName}")
	public String noneSignUpMove(
			@PathVariable("fileName") String fileName){
		return fileName;
	}
	
	@RequestMapping("praha/reviewBoard")
	public String PrahaReserveSelect(BoardDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		
		List<BoardDTO> selectList =  ReviewService.ReviewList(pageDto);
		model.addAttribute("reviewSelectList", selectList);
		model.addAttribute("page",pageDto);
		return "reviewBoard";
	}
	
	@RequestMapping("praha/ReviewInsert")
	public String PrahaReserveInsert(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ReviewService.ReviewInsert(boardDto);
		System.out.println("insert성공");
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	@RequestMapping("praha/reviewPasswordCheck")
	public String prahaReservePasswordCheck(BoardDTO boardDto,Model model,RedirectAttributes redirect) throws Exception{
		String nextpage ="";
		
		System.out.println("값 : " + boardDto.getBoardNo() +"  - " + boardDto.getPassword());
		BoardDTO bDTO =ReviewService.ReviewPasswordCheck(boardDto);
		
		
		if(bDTO!=null){
			model.addAttribute("reviewViewInfo",bDTO);
			nextpage="reviewView";
		}else{
			nextpage="redirect:/review/praha/reviewBoard";
		}
		
		return nextpage;
		
	}
	
	@RequestMapping("praha/ReivewDelete")
	public String prahaReserveDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ReviewService.ReviewDelete(boardDto);
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	@RequestMapping("praha/ReviewUpdate")
	public String prahaReserveUpdate(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		System.out.println("카카오 " + boardDto.getKakaoId());
		ReviewService.ReviewUpdate(boardDto);
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	
}
