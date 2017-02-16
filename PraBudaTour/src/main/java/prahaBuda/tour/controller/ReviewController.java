package prahaBuda.tour.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;
import prahaBuda.tour.service.ReviewService;

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
	public String PrahaReserveInsert(BoardDTO boardDto,RedirectAttributes redirect,HttpServletRequest request) throws Exception{

		if(boardDto.getFile()!=null){
			boardDto.setBoardImg0("null");
			boardDto.setBoardImg1("null");
			boardDto.setBoardImg2("null");
			boardDto.setBoardImg3("null");
			
		for(int i =0; i<boardDto.getFile().size(); i++){			
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyymmdd-hhmmss");
			String Time = dayTime.format(new Date(System.currentTimeMillis()));
			String imgName = Time+boardDto.getFile().get(i).getOriginalFilename();
			String path = request.getSession().getServletContext().getRealPath("/") + "resources\\upload\\"+imgName;
			File file = new File(path);
			boardDto.getFile().get(i).transferTo(file);

			String db = "/resources/upload/"+ imgName;
			switch (i) {
			case 0: boardDto.setBoardImg0(db);  break;
			case 1: boardDto.setBoardImg1(db);  break;
			case 2: boardDto.setBoardImg2(db);  break;
			case 3: boardDto.setBoardImg3(db);  break;
				}
			}
		}else{
			boardDto.setBoardImg0("null");
			boardDto.setBoardImg1("null");
			boardDto.setBoardImg2("null");
			boardDto.setBoardImg3("null");
		}
		
		ReviewService.ReviewInsert(boardDto);
		System.out.println("insert성공");
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	@RequestMapping("praha/reviewPasswordCheck")
	public String prahaReservePasswordCheck(BoardDTO boardDto,Model model,RedirectAttributes redirect,HttpServletRequest request) throws Exception{
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
	
	@RequestMapping("praha/reviewDelete")
	public String prahaReserveDelete(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ReviewService.ReviewDelete(boardDto);
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	@RequestMapping("praha/reviewUpdate")
	public String prahaReserveUpdate(BoardDTO boardDto,RedirectAttributes redirect) throws Exception{
		
		ReviewService.ReviewUpdate(boardDto);
		
		return "redirect:/review/praha/reviewBoard";
	}
	
	
}
