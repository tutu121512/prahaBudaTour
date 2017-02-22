package prahaBuda.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.*;
import prahaBuda.tour.service.*;

@Controller
@RequestMapping("praha")
public class PrahaController {
	
	@Autowired 
	private ReserveQuestionService ReserveQuestionService;

	@Autowired 
	private NoticeService NoticeService;
	
	@Autowired
	private UserBenefitService UserBenefitService;
	
	@Autowired
	private TourInfoService TourInfoService;
	
	@Autowired
	private ReviewService ReviewService;
	
	@RequestMapping("{fileName}")
	public String noneSignUpMove(
			@PathVariable("fileName") String fileName){
		return fileName;
	}
	
	@RequestMapping("{viewName}/{fileName}")
	public String onlyMove(
			@PathVariable("viewName") String viewName,
			@PathVariable("fileName") String fileName){
		return viewName + "/" +fileName;
	}
	
	@RequestMapping("prahaMain")
	public ModelAndView PrahaMain() throws Exception{
		
		PageDTO pageDto = new PageDTO();
		pageDto.setCurPage(1);
		
		List<BoardDTO> noticeList =  NoticeService.NoticeList(pageDto);
		List<BoardDTO> userBenefitList = UserBenefitService.serviceSelect();
		List<BoardDTO> tourInfoList =  TourInfoService.tourInfoSelect(pageDto);
		List<BoardDTO> reviewList =  ReviewService.ReviewList(pageDto);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/prahaMain");
		mv.addObject("noticetList", noticeList);
		mv.addObject("userBenefitList", userBenefitList);
		mv.addObject("tourInfoList", tourInfoList);
		mv.addObject("reviewList", reviewList);

		return mv;
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
		return "prahaReserve/reserveBoard";
	}
	
	@RequestMapping("prahaReserveInsert")
	public String PrahaReserveInsert(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ReserveQuestionService.ReserveQuestionInsert(boardDto);
		System.out.println("insert성공");
		
		return "redirect:/praha/reserveBoard";
	}
	
	@RequestMapping("prahaReservePasswordCheck")
	public String prahaReservePasswordCheck(BoardDTO boardDto,Model model,RedirectAttributes redirect) throws Exception{
		String nextpage ="";
		
		System.out.println("값 : " + boardDto.getBoardNo() +"  - " + boardDto.getPassword());
		BoardDTO bDTO =ReserveQuestionService.prahaReservePasswordCheck(boardDto);
		
		if(bDTO!=null){
			model.addAttribute("reserveViewInfo",bDTO);
			nextpage="prahaReserve/reserveView";
		}else{
			nextpage="redirect:/praha/reserveBoard";
		}
		
		return nextpage;
	}
	
	@RequestMapping("prahaReserveDelete")
	public String prahaReserveDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		ReserveQuestionService.prahaReserveDelete(boardDto);
		
		return "redirect:/praha/reserveBoard";
	}
	
	@RequestMapping("adminReserveDelete")
	public String prahaAdminDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		ReserveQuestionService.prahaReserveDelete(boardDto);
		
		return "redirect:/admin/adminReserveComplete";
	}
	
	
	@RequestMapping("prahaReserveUpdate")
	public String prahaReserveUpdate(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		ReserveQuestionService.prahaReserveUpdate(boardDto);
		
		return "redirect:/praha/reserveBoard";
	}
}
