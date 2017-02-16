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
import prahaBuda.tour.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired 
	private NoticeService NoticeService;
	
	@RequestMapping("{fileName}")
	public String noneSignUpMove(
			@PathVariable("fileName") String fileName){
		return fileName;
	}
	
	
	@RequestMapping("praha/noticeBoard")
	public String PrahaNoticeSelect(BoardDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		
		List<BoardDTO> selectList =  NoticeService.NoticeList(pageDto);
		model.addAttribute("noticeSelectList", selectList);
		model.addAttribute("page",pageDto);
		return "noticeBoard";
	}
	
	@RequestMapping("praha/NoticeInsert")
	public String PrahaNoticeInsert(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		NoticeService.NoticeInsert(boardDto);
		System.out.println("insert성공");
		
		return "redirect:/notice/praha/noticeBoard";
	}
	
	@RequestMapping("praha/noticeView")
	public String prahaNoticePasswordCheck(BoardDTO boardDto,Model model,RedirectAttributes redirect) throws Exception{
		
		BoardDTO bDTO =NoticeService.NoticeView(boardDto);
		model.addAttribute("noticeViewInfo",bDTO);
		
		return "noticeView";
		
	}
	
	@RequestMapping("praha/NoticeDelete")
	public String prahaNoticeDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		NoticeService.NoticeDelete(boardDto);
		
		return "redirect:/notice/praha/noticeBoard";
	}
	
	@RequestMapping("praha/NoticeUpdate")
	public String prahaNoticeUpdate(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		NoticeService.NoticeUpdate(boardDto);
		
		return "redirect:/notice/praha/noticeBoard";
	}
	
	
}
