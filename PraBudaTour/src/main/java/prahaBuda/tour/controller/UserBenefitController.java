package prahaBuda.tour.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import prahaBuda.tour.dto.*;
import prahaBuda.tour.service.*;

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
	@RequestMapping("serviceInsert")
	public String serviceInsert(BoardDTO boardDTO) throws Exception{
		UserBenefitService.serviceInsert(boardDTO);
		return "pageName";
	}
	
	//이용혜택 update
	@RequestMapping("serviceUpdate")
	public String serviceUpdate(BoardDTO boardDTO) throws Exception{

		UserBenefitService.serviceUpdate(boardDTO);
		return "pageName";
		
	}		

	//이용혜택 delete
	@RequestMapping("serviceDelete")
	public String serviceDelete(BoardDTO boardDTO) throws Exception{
		UserBenefitService.serviceDelete(boardDTO);
		return "pageName";
	}
	
	//이용혜택 selectList
	@RequestMapping("serviceSelect")
	public String serviceSelect() throws Exception{
		List<BoardDTO> selectList = UserBenefitService.serviceSelect();
		return "pageName";

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
