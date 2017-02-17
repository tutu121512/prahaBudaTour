package prahaBuda.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.*;
import prahaBuda.tour.service.*;

@Controller
@RequestMapping("admin")
public class adminController {
	
	@Autowired
	private ManageBoardService ManageBoardService;

	@Autowired
	private UserBenefitService UserBenefitService;
	
	@RequestMapping("{viewName}/{fileName}")
	public String move(
			@PathVariable("viewName") String viewName,
			@PathVariable("fileName") String fileName){
		return viewName + "/" +fileName;
	}
	
	@RequestMapping("LoginOk")
	public String adminlogin(String id, String pw,RedirectAttributes redirect) throws Exception{
		String nextpage = null;
		if(id.equals("favicontour")&&pw.equals("min337337")){
			nextpage="redirect:totalBoard";
		}else{
			nextpage="admin/admin";
		}
		return nextpage;
	}
	
	@RequestMapping("totalBoard")
	public String totalBoard(String page,Model model) throws Exception{
		System.out.println("이곳엔 왔니");
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<BoardDTO> totalList = ManageBoardService.ManageBoard(pageDto);
		System.out.println(totalList.toString());
		model.addAttribute("totalList", totalList);
		model.addAttribute("page",pageDto);
		return "admin/manageMain";
	}
	
	@RequestMapping("selectBoard")
	public String selectBoard(String page,Model model,BoardDTO boardDTO) throws Exception{
		
		System.out.println("selectBoard  : " +boardDTO.getBoardState() );
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<BoardDTO> totalList = ManageBoardService.ManageSelectBoard(pageDto,boardDTO);
		model.addAttribute("totalList", totalList);
		model.addAttribute("page",pageDto);
		model.addAttribute("selectBoard", boardDTO.getBoardState());
		System.out.println(totalList.toString());
		System.out.println(pageDto.toString());
		
		return "admin/manageMain";
	}
	
	@RequestMapping("AdminUserBenefit")
	public String adminUserBenefit(Model model) throws Exception{
		
		List<BoardDTO> userBenefitList = UserBenefitService.serviceSelect();
		model.addAttribute("userBenefitList", userBenefitList);
		return "admin/AdminUserBenefit";
	}
	
}
