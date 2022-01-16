package com.spring.mau.view.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteService;
import com.spring.mau.mapfavorite.MapFavoriteVO;
import com.spring.mau.mapplace.MapPlaceService;
import com.spring.mau.mapplace.MapPlaceVO;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;
import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;

	@Autowired
	private MapService mapService;
	
	@Autowired
	private MapPlaceService mapPlaceService;
	@Autowired
	private UserPlaceService userPlaceService;
	@Autowired
	private MapFavoriteService mapFavoriteService;
	@RequestMapping("/adminForm")
	public ModelAndView adminForm(Model model,HttpSession session) {
		System.out.println("관리자페이지");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user.getAdminNum()!=1) {
			return new ModelAndView("index");
			}else {
				List<MapVO>AllUsersGuiderMap=mapService.getguiderMapListAll();//가이더맵 리스트
				List<MapVO>AllUsersGuideMap=mapService.getguideMapListAll();//가이드맵 리스트
				model.addAttribute("AllUsersGuiderMap",AllUsersGuiderMap);
				model.addAttribute("AllUsersGuideMap",AllUsersGuideMap);
				return new ModelAndView("myPage/adminPage.jsp");
			}
	}
	@RequestMapping("/adminMapDelete/{mapSeq}")
	public ModelAndView deleteMap(@PathVariable("mapSeq") int mapSeq,UserPlaceVO userplacevo,MapVO mapvo,MapPlaceVO mapplacevo,MapFavoriteVO mapfavoritevo, Model model,HttpSession session) {
		System.out.println("맵삭제하기");
		System.out.println("등록된장소 삭제");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user.getAdminNum()==1) {
		UserPlaceVO userPlaceSeq= userPlaceService.getUserPlaceMapSeq(userplacevo);
		MapPlaceVO mapPlace = mapPlaceService.getMapPlaceSeq(mapplacevo);
		MapFavoriteVO mapFavoriteSeq = mapFavoriteService.getFavoriteMapSeq(mapfavoritevo);
		if(mapPlace!=null) {
			mapPlaceService.deleteMapPlace(mapplacevo);	
		}
		if(mapFavoriteSeq!=null) {
			mapFavoriteService.deleteFavoriteNoUserSeqId(mapFavoriteSeq);
		}
		if(userPlaceSeq!=null) {
			userPlaceService.deleteUserPlace(userplacevo);
		}
		mapService.deleteMap(mapvo);
		return new ModelAndView("redirect:../adminForm");
		}else {
			return new ModelAndView("redirect:index");
		}
	}
	@RequestMapping("/mapUpdateForm/{mapSeq}")
	public ModelAndView UpdateMapForm(@PathVariable("mapSeq") int mapSeq,MapVO mapvo, Model model,HttpSession session) {
		MapVO mapInfo = mapService.getMap(mapvo);
		model.addAttribute("mapInfo",mapInfo);
		return new ModelAndView("../myPage/updateMapForm.jsp");
	}
	@RequestMapping("/AdminMapUpdate/{mapSeq}")
	public ModelAndView UpdateMap(@PathVariable("mapSeq") int mapSeq,MapVO mapvo, Model model,HttpSession session) {
		System.out.println("맵수정하기");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user.getAdminNum()==1) {
		mapService.updateMap(mapvo);
		return new ModelAndView("redirect:../adminForm");
		}else {
			return new ModelAndView("redirect:index");
		}
	}
	
	
}
