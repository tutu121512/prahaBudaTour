package prahaBuda.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;
import prahaBuda.tour.service.NoticeService;

@Controller
@RequestMapping("Login")
public class LoginController<LoginService> {
	
	    @Autowired
	    private LoginService LoginService;
	   
	    
	    @RequestMapping("{fileName}")
		public String noneSignUpMove(
				@PathVariable("fileName") String fileName){
			return fileName;
		}
		
	    
	    // 세션사용 화면
	    @RequestMapping("page1")
	    public String page1() {
	        return "page1";
	    }
	    // 세션 사용 안하는 화면
	    @RequestMapping("page2")
	    public String page2() {
	        return "page2";
	    }
	    // 로그인 화면
	    @RequestMapping("login")
	    public String login() {
	        return "login";
	    }
	    // 로그아웃
	    @RequestMapping("logout")
	    public String logout(HttpSession session) {
	        session.setAttribute("userLoginInfo", null);
	        return "redirect:login";
	    }
	    // 로그인 처리
	    @RequestMapping(value="loginProcess", method = RequestMethod.POST)
	    public ModelAndView loginProcess(admin Admin, HttpSession session, HttpServletRequest request) {
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("redirect:login");
	 
	        Admin loginUser = LoginService.findByUserIdAndPassword(admin.getadminId(), admin.getadminPassword());
	 
	        if (loginUser != null) {
	            session.setAttribute("userLoginInfo", loginUser);
	        }
	        return mav;
	    }
	}

