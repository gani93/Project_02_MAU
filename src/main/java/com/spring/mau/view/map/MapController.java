package com.spring.mau.view.map;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.user.UserVO;
@Controller
public class MapController {
	// TODO Auto-generated method stub
	@Autowired
	private MapService mapService;
	@RequestMapping("/createGuiderMap")
	public ModelAndView myPage(Model model,HttpSession session,MapVO mapVo){
		// TODO Auto-generated method stub
			UserVO user = (UserVO)session.getAttribute("loginUser");
			if(user==null) {
				return new ModelAndView("index");
			}else {
				mapService.insertMap(mapVo);
				return new ModelAndView("redirect:mypage");
			}
	}
	@RequestMapping("/createGuideMap")
	public ModelAndView index(Model model,HttpSession session,MapVO mapVo){
		// TODO Auto-generated method stub
			UserVO user = (UserVO)session.getAttribute("loginUser");
			if(user==null) {
				return new ModelAndView("index");
			}else {
				mapService.insertGuideMap(mapVo);
				return new ModelAndView("redirect:index");
			}
	}
}
