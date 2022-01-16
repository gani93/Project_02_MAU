package com.spring.mau.view.user;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;

@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST,produces ="text/plain;charset=UTF-8")
	public String login(UserVO vo,HttpSession session,HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("로그인 처리");	
		
		if(userService.getUser(vo) == null) {
			String id = vo.getUserNickName().toString();
			System.out.println(id);
			userService.insertUser(vo);
			if(userService.getUser(vo) != null) {
//				session.setAttribute("userNickName", userService.getUser(vo).getUserNickName());
				session.setAttribute("userSeqId", userService.getUser(vo).getUserSeqId());
				session.setAttribute("loginUser", userService.getUser(vo));
			}
			return "redirect:index"; 
		}else if(userService.getUser(vo) != null) {
//			session.setAttribute("userNickName", userService.getUser(vo).getUserNickName());
			session.setAttribute("userSeqId", userService.getUser(vo).getUserSeqId());
			session.setAttribute("loginUser", userService.getUser(vo));
			return "redirect:index"; 
		}else{
			return "";
		}
		
	}
}
