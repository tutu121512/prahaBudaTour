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
import prahaBuda.tour.service.TourInfoService;

@Controller
@RequestMapping("tourInfo")
public class TourInfoController {

	@Autowired
	private TourInfoService TourInfoService;
	
	@RequestMapping("{viewName}/{fileName}")
	public String move(
			@PathVariable("viewName") String viewName,
			@PathVariable("fileName") String fileName){
		return viewName + "/" +fileName;
	}
	
	//여행정보 insert
	@RequestMapping("tourInfoInsert")
	public String tourInfoInsert(BoardDTO boardDto, HttpServletRequest request,RedirectAttributes redirect) throws Exception{
		if(boardDto.getFile()!=null){
			boardDto.setBoardImg0("null");
			boardDto.setBoardImg1("null");
			boardDto.setBoardImg2("null");
			boardDto.setBoardImg3("null");
			boardDto.setBoardImg4("null");
			boardDto.setBoardImg5("null");
			boardDto.setBoardImg6("null");
			boardDto.setBoardImg7("null");
			boardDto.setBoardImg8("null");
			boardDto.setBoardImg9("null");
			
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
			case 4: boardDto.setBoardImg4(db);  break;
			case 5: boardDto.setBoardImg5(db);  break;
			case 6: boardDto.setBoardImg6(db);  break;
			case 7: boardDto.setBoardImg7(db);  break;
			case 8: boardDto.setBoardImg8(db);  break;
			case 9: boardDto.setBoardImg9(db);  break;
				}
			}
		}else{
			boardDto.setBoardImg0("null");
			boardDto.setBoardImg1("null");
			boardDto.setBoardImg2("null");
			boardDto.setBoardImg3("null");
			boardDto.setBoardImg4("null");
			boardDto.setBoardImg5("null");
			boardDto.setBoardImg6("null");
			boardDto.setBoardImg7("null");
			boardDto.setBoardImg8("null");
			boardDto.setBoardImg9("null");
		}
		TourInfoService.tourInfoInsert(boardDto);
		return "redirect:/admin/adminTourInfo";
	}
	
	//여행정보 update
	@RequestMapping("tourInfoUpdate")
	public String tourInfoUpdate(BoardDTO boardDTO) throws Exception{
		TourInfoService.tourInfoUpdate(boardDTO);
		return "pageName";
	}		 

	//여행정보 delete
	@RequestMapping("tourInfoDelete")
	public String tourInfoDelete(BoardDTO boardDTO) throws Exception{
		System.out.println("tourInfoDelete : " +boardDTO.getBoardNo());
		TourInfoService.tourInfoDelete(boardDTO);
		return "redirect:/admin/adminTourInfo";
	}
	
	//여행정보 selectList
	@RequestMapping("tourInfoSelect")
	public String tourInfoSelect(BoardDTO boardDto,Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		List<BoardDTO> selectList = TourInfoService.tourInfoSelect(pageDto);
		model.addAttribute("selectList", selectList);
		model.addAttribute("page",pageDto);
		return "prahaCommunity/tourInfoBoard";

	}
	
}
