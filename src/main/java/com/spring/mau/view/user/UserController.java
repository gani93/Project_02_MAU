package com.spring.mau.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/updateform",method=RequestMethod.GET)
	public String updateform(UserVO vo,HttpSession session,HttpServletRequest request) {
		System.out.println("회원정보 수정폼");
		String userSeqId = request.getParameter("userSeqId");
		
		session.setAttribute("userInfo", userService.getDetail(vo));
		return "user/updateForm.jsp";

	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String login(UserVO vo,HttpSession session,HttpServletResponse response) {
		userService.updateUser(vo);
		return "/index";
	}

}
