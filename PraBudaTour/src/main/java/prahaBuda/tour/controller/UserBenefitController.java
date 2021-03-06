package prahaBuda.tour.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.service.UserBenefitService;

@Controller
@RequestMapping("userBenefit")
public class UserBenefitController {

	@Autowired
	private UserBenefitService UserBenefitService;
	
	@RequestMapping("{viewName}/{fileName}")
	public String move(
			@PathVariable("viewName") String viewName,
			@PathVariable("fileName") String fileName){
		return viewName + "/" +fileName;
	}
	
	//이용혜택 insert
	@RequestMapping(value="praha/serviceInsert")
	public String serviceInsert(BoardDTO boardDto,HttpServletRequest request,RedirectAttributes redirect) throws Exception{
	
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
			if(!imgName.equals(Time)){
				String path = request.getSession().getServletContext().getRealPath("resources/upload/");
				File file = new File(path+"/"+imgName);
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
		
		UserBenefitService.serviceInsert(boardDto);
		
		return "redirect:/admin/adminUserBenefit?location="+boardDto.getLocation();
	}
	
	//이용혜택 update
	@RequestMapping("praha/serviceUpdate")
	public String serviceUpdate(BoardDTO boardDTO) throws Exception{

		UserBenefitService.serviceUpdate(boardDTO);
		return "pageName";
		
	}		 

	//이용혜택 delete
	@RequestMapping("praha/serviceDelete")
	public String serviceDelete(BoardDTO boardDTO,RedirectAttributes redirect) throws Exception{
		UserBenefitService.serviceDelete(boardDTO);
		
		return "redirect:/admin/adminUserBenefit?location="+boardDTO.getLocation();
	}
	
	//이용혜택 selectList
	@RequestMapping("praha/userBenefitBoard")
	public String serviceSelect(Model m,BoardDTO boardDTO) throws Exception{
		System.out.println("지역 : " +boardDTO.getLocation());
		List<BoardDTO> selectList = UserBenefitService.serviceSelect(boardDTO);
		m.addAttribute("selectList", selectList);
		System.out.println("selectList : "+selectList.toString());
		return "prahaUseGuide/userBenefitBoard";
	}
	
	//이용혜택 selectList
	@RequestMapping("serviceView")
	@ResponseBody
	public void serviceView(BoardDTO boardDTO) throws Exception{
		HashMap<String, Object> viewAndList = new HashMap<String,Object>();
		List<BoardDTO> selectList = null;
		viewAndList.put("selectView", boardDTO);
		viewAndList.put("selectList", selectList);
	}
}
