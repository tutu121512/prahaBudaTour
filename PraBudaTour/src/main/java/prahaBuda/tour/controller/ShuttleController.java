package prahaBuda.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;
import prahaBuda.tour.service.ShuttleService;

@Controller
@RequestMapping("shuttle")
public class ShuttleController {
	
	@Autowired 
	private ShuttleService ShuttleService;
	
	@RequestMapping("{fileName}")
	public String noneSignUpMove(
			@PathVariable("fileName") String fileName){
		return fileName;
	}
	
	@RequestMapping("praha/shuttleBoard")
	public String PrahaReserveSelect(BoardDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		
		List<BoardDTO> selectList =  ShuttleService.ShuttleList(pageDto);
		model.addAttribute("shuttleSelectList", selectList);
		model.addAttribute("page",pageDto);
		return "shuttleBoard";
	}
	
	@RequestMapping("praha/ShuttleInsert")
	public String PrahaReserveInsert(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ShuttleService.ShuttleInsert(boardDto);
		System.out.println("insert성공");
		
		return "redirect:/shuttle/praha/shuttleBoard";
	}
	
	@RequestMapping("praha/shuttlePasswordCheck")
	public String prahaReservePasswordCheck(BoardDTO boardDto,Model model,RedirectAttributes redirect) throws Exception{
		String nextpage ="";
		
		System.out.println("값 : " + boardDto.getBoardNo() +"  - " + boardDto.getPassword());
		BoardDTO bDTO =ShuttleService.ShuttlePasswordCheck(boardDto);
		
		
		if(bDTO!=null){
			model.addAttribute("shuttleViewInfo",bDTO);
			nextpage="shuttleView";
		}else{
			nextpage="redirect:/shuttle/praha/shuttleBoard";
		}
		
		return nextpage;
		
	}
	
	@RequestMapping("praha/shuttleDelete")
	public String prahaReserveDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ShuttleService.ShuttleDelete(boardDto);
		
		return "redirect:/shuttle/praha/shuttleBoard";
	}
	
	@RequestMapping("praha/shuttleUpdate")
	public String prahaReserveUpdate(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		System.out.println("카카오 " + boardDto.getKakaoId());
		ShuttleService.ShuttleUpdate(boardDto);
		
		return "redirect:/shuttle/praha/shuttleBoard";
	}
	
	
}
