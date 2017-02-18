package prahaBuda.tour.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.PageDTO;
import prahaBuda.tour.dto.ReserveCompleteDTO;
import prahaBuda.tour.service.ReserveCompleteService;

@Controller
@RequestMapping("complete")
public class CompleteController {

	@Autowired
	private ReserveCompleteService CompleteService;
	
	@RequestMapping("praha/completeCalendar")
	public String reserveCompleteCalrendar(Model model) throws Exception {
		System.out.println("completeCalendar에 들어왔음");
		List<ReserveCompleteDTO> reserveCompleteDTO = CompleteService.reserveCompleteCalendar();
		System.out.println(reserveCompleteDTO.toString());
		model.addAttribute("CalendarList", reserveCompleteDTO);

		return "prahaReserve/reserveCalendar";
	}
	
	@RequestMapping("praha/completeBoard")
	public String PrahaReserveSelect( ReserveCompleteDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<ReserveCompleteDTO> completeList =  CompleteService.reserveCompleteBoard(pageDto);
		System.out.println(completeList.toString());
		model.addAttribute("CompleteList", completeList);
		model.addAttribute("page",pageDto);
		
		return "prahaReserve/reserveCompleteBoard";
	}
	
	@RequestMapping("praha/CompleteInsert")
	public String reserveCompleteInsert(ReserveCompleteDTO reserveCompleteDTO,RedirectAttributes redirect) throws Exception {
		CompleteService.reserveCompleteInsert(reserveCompleteDTO);
		return "redirect:/admin/adminReserveComplete";
	}

	@RequestMapping("praha/CompleteUpdate")
	public void reserveCompleteUpdate(ReserveCompleteDTO reserveCompleteDTO) throws Exception {
		CompleteService.reserveCompleteUpdate(reserveCompleteDTO);
	}

	@RequestMapping("praha/CompleteDelete")
	public String reserveCompleteDelete(ReserveCompleteDTO reserveCompleteDTO,RedirectAttributes redirect) throws Exception {
		CompleteService.reserveCompleteDelete(reserveCompleteDTO);
		return "redirect:/admin/adminReserveComplete";
	}
}
