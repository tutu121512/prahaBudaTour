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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Autowired
	private NoticeService NoticeService;
	
	@Autowired
	private ReserveCompleteService ReserveCompleteService;
	
	@Autowired
	private ReserveQuestionService resereveQeustionService;
	
	@Autowired
	private TourInfoService TourInfoService;
	
	@Autowired
	private PopupService PopupSerivce;
	
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
		
		return "admin/manageMain";
	}
	
	@RequestMapping("adminUserBenefit")
	public String adminUserBenefit(Model model) throws Exception{
		
		List<BoardDTO> userBenefitList = UserBenefitService.serviceSelect();
		model.addAttribute("userBenefitList", userBenefitList);
		return "admin/adminUserBenefit";
	}
	
	@RequestMapping("adminReserveComplete")
	public String adminReserveComplete(Model model,String Qpage,BoardDTO boardDTO,String Cpage) throws Exception{
		
		PageDTO QpageDto = new PageDTO();
		if(Qpage == null){
			QpageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(Qpage); //형변환
			QpageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		boardDTO.setBoardState("reserveQuestion");
		List<BoardDTO> list = ManageBoardService.ManageSelectBoard(QpageDto,boardDTO);
		model.addAttribute("list", list);
		model.addAttribute("Qpage",QpageDto);

		PageDTO CpageDto = new PageDTO();
		if(Cpage == null){
			CpageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(Cpage); //형변환
			CpageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<ReserveCompleteDTO> completelist = ReserveCompleteService.reserveCompleteBoard(CpageDto);
		model.addAttribute("completelist", completelist);
		model.addAttribute("Cpage",CpageDto);
		
		return "admin/adminReserveComplete";
	}
	
	@RequestMapping("adminNoticeList")
	public String adminNoticeList(Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<BoardDTO> noticeList = NoticeService.NoticeList(pageDto);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page",pageDto);
		return "admin/adminNoticeInsert";
	}
	
	@RequestMapping("adminSelect")
	@ResponseBody
	public BoardDTO adminReserve(BoardDTO boardDTO) throws Exception{
		BoardDTO bDTO = ManageBoardService.manageSelect(boardDTO);
		System.out.println("adminSelect : " + bDTO.getBoardState());
		return bDTO;
	}
	
	@RequestMapping("adminTourInfo")
	public String adminTourInfo(Model model,String page) throws Exception{
		
		PageDTO pageDto = new PageDTO();
		if(page == null){
			pageDto.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageDto.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<BoardDTO> tourInfoList = TourInfoService.tourInfoSelect(pageDto);
		System.out.println(tourInfoList.toString());
		model.addAttribute("tourInfoList", tourInfoList);
		  
		return "admin/adminTourInfo";
	}
	
	@RequestMapping("adminBoardReply")
	public String adminBoardReply(BoardDTO boardDTO,RedirectAttributes redirect) throws Exception{
		
		ManageBoardService.manageBoardReply(boardDTO);
		
		return "redirect:/admin/selectBoard?boardState="+boardDTO.getBoardState();
	}
	
	@RequestMapping("adminDelete")
	public String adminDelete(String deleteArry,RedirectAttributes redirect) throws Exception{
		String delete[] = deleteArry.split("/");
		for(int i=0; i< delete.length; i++){
			String delArry[] = delete[i].split(",");
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setBoardNo(delArry[0]);
			boardDTO.setBoardState(delArry[1]);
			ManageBoardService.manageBoardDelete(boardDTO);
		}
		
		return "redirect:/admin/totalBoard";
	}
	
	@RequestMapping("adminUpdate")
	public String adminUpadte(BoardDTO boardDTO,RedirectAttributes redirect,HttpServletRequest request) throws Exception{
		
		String nextPage = null;
		if(boardDTO.getBoardState().equals("tourInfo")){
			nextPage ="redirect:/admin/adminTourInfo";
		}else if(boardDTO.getBoardState().equals("userBenefit")){
			nextPage ="redirect:/admin/adminUserBenefit";
		}else if(boardDTO.getBoardState().equals("notice")){
			nextPage ="redirect:/admin/adminNoticeList";
		}
		
		if(boardDTO.getFile()!=null){
			boardDTO.setBoardImg0("null");
			boardDTO.setBoardImg1("null");
			boardDTO.setBoardImg2("null");
			boardDTO.setBoardImg3("null");
			boardDTO.setBoardImg4("null");
			boardDTO.setBoardImg5("null");
			boardDTO.setBoardImg6("null");
			boardDTO.setBoardImg7("null");
			boardDTO.setBoardImg8("null");
			boardDTO.setBoardImg9("null");
			
		for(int i =0; i<boardDTO.getFile().size(); i++){
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyymmdd-hhmmss");
			String Time = dayTime.format(new Date(System.currentTimeMillis()));
			String imgName = Time+boardDTO.getFile().get(i).getOriginalFilename();
			if(!imgName.equals(Time)){
				String path = request.getSession().getServletContext().getRealPath("/") + "resources\\upload\\"+imgName;
				File file = new File(path);
				boardDTO.getFile().get(i).transferTo(file);
				String db = "/resources/upload/"+ imgName;
				switch (i) {
				case 0: boardDTO.setBoardImg0(db);  break;
				case 1: boardDTO.setBoardImg1(db);  break;
				case 2: boardDTO.setBoardImg2(db);  break;
				case 3: boardDTO.setBoardImg3(db);  break;
				case 4: boardDTO.setBoardImg4(db);  break;
				case 5: boardDTO.setBoardImg5(db);  break;
				case 6: boardDTO.setBoardImg6(db);  break;
				case 7: boardDTO.setBoardImg7(db);  break;
				case 8: boardDTO.setBoardImg8(db);  break;
				case 9: boardDTO.setBoardImg9(db);  break;
					}
				}
			}
		}else{
			boardDTO.setBoardImg0("null");
			boardDTO.setBoardImg1("null");
			boardDTO.setBoardImg2("null");
			boardDTO.setBoardImg3("null");
			boardDTO.setBoardImg4("null");
			boardDTO.setBoardImg5("null");
			boardDTO.setBoardImg6("null");
			boardDTO.setBoardImg7("null");
			boardDTO.setBoardImg8("null");
			boardDTO.setBoardImg9("null");
		}
		
		ManageBoardService.manageUpdate(boardDTO);
		return nextPage;
	}
	
	@RequestMapping("adminPopup")
	public String adminPopup(Model model,String page) throws Exception{
		
		
		PopupDTO popupDTO =PopupSerivce.popup();
		
//		List<BoardDTO> noticeList = NoticeService.popupNoticeList();
//		model.addAttribute("noticeList", noticeList);
		model.addAttribute("popup", popupDTO);
		
		return "admin/adminPopup";
	}
	
	@RequestMapping("popupInsert")
	public String popupInsert(Model model,String page,RedirectAttributes redirect,PopupDTO popupDTO,HttpServletRequest request) throws Exception{
		if(!popupDTO.getFile().getOriginalFilename().equals("")){
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyymmdd-hhmmss");
			String Time = dayTime.format(new Date(System.currentTimeMillis()));
			String imgName = Time+popupDTO.getFile().getOriginalFilename();
			String path = request.getSession().getServletContext().getRealPath("/") + "resources\\upload\\"+imgName;
			File file = new File(path);
			popupDTO.getFile().transferTo(file);
			String db = "/resources/upload/"+ imgName;
			popupDTO.setPopupImg(db);
			PopupSerivce.popupInsert(popupDTO);
		}
		
		return "redirect:/admin/adminPopup";
	}
	
	@RequestMapping("popupDelete")
	public String popupDelete(PopupDTO popupDTO,RedirectAttributes redirect) throws Exception{
		
		PopupSerivce.popupDelete(popupDTO);
		
		return  "redirect:/admin/adminPopup";
	}
		
}
