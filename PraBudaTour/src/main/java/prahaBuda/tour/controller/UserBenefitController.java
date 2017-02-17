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
	@RequestMapping("praha/serviceInsert")
	public String serviceInsert(BoardDTO boardDto,HttpServletRequest request) throws Exception{
	
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
		
		UserBenefitService.serviceInsert(boardDto);
		return "pageName";
	}
	
	//이용혜택 update
	@RequestMapping("praha/serviceUpdate")
	public String serviceUpdate(BoardDTO boardDTO) throws Exception{

		UserBenefitService.serviceUpdate(boardDTO);
		return "pageName";
		
	}		 

	//이용혜택 delete
	@RequestMapping("praha/serviceDelete")
	public String serviceDelete(BoardDTO boardDTO) throws Exception{
		UserBenefitService.serviceDelete(boardDTO);
		return "pageName";
	}
	
	//이용혜택 selectList
	@RequestMapping("praha/userBenefitBoard")
	public String serviceSelect(Model m) throws Exception{
		List<BoardDTO> selectList = UserBenefitService.serviceSelect();
		m.addAttribute("selectList", selectList);
		System.out.println("selectList : "+selectList.toString());
		return "userBenefitBoard";
	}
	
	//이용혜택 selectList
	@RequestMapping("serviceView")
	public String serviceView(BoardDTO boardDTO) throws Exception{
		HashMap<String, Object> viewAndList = new HashMap<String,Object>();
		List<BoardDTO> selectList = null;
		viewAndList.put("selectView", boardDTO);
		viewAndList.put("selectList", selectList);
		return null;
	}
}
