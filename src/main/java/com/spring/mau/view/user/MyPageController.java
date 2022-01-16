package com.spring.mau.view.user;



import java.util.ArrayList;
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
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;
import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Controller
public class MyPageController {
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
	@RequestMapping("/mypage")
	public ModelAndView myPage(UserVO userVo,Model model,HttpSession session,MapVO mapVo){
		// TODO Auto-generated method stub
				System.out.println("mypage호출");
				UserVO user = null;
				Integer user_seq = (Integer)session.getAttribute("userSeqId");
				if(user_seq!=null) {
					userVo.setUserSeqId(user_seq);
					user = userService.mypageGetUser(userVo);
					model.addAttribute("user", user);
					mapVo.setUserSeqId(user.getUserSeqId());
					model.addAttribute("user", user);
					List<MapVO> allmap = mapService.getMapList(mapVo); //지도모든타입리스트 가져오기
					model.addAttribute("allmap", allmap);
					List<MapVO> guideMap = mapService.getguideMapList(mapVo); //가이드지도리스트 가져오기
					model.addAttribute("guideMap", guideMap);
					List<MapVO> guiderMap = mapService.getguiderMapList(mapVo); //가이더지도리스트 가져오기
					model.addAttribute("guiderMap", guiderMap);
		               List<MapVO> getMapSeq = mapService.getMapSeq(mapVo); //즐겨찾기 mapSeq 받아오기
		               int fvcnt = mapService.getfvcnt(mapVo).getFvCnt();
		               int plcnt = mapService.getplcnt(mapVo).getPlCnt();
		               session.setAttribute("plcnt", plcnt);
		               session.setAttribute("fvcnt", fvcnt);
		               ArrayList<Integer> mapSeq = new ArrayList<Integer>();
		               for(MapVO vo : getMapSeq) {
		                  int a = vo.getMapSeq();
		                  mapSeq.add(a);
		               }
		               
		               List<MapVO> myFavorite = new ArrayList<MapVO>();
		               for(int num : mapSeq) {
		                  mapVo = new MapVO();
		                  mapVo.setMapSeq(num);
		                  mapVo = mapService.getMap(mapVo);
		                  myFavorite.add(mapVo);
		               }
		               model.addAttribute("myFavorite", myFavorite);
					return new ModelAndView("myPage/myPage.jsp");
				}else {
					return new ModelAndView("index");
				}
	}
	
	@RequestMapping("/createGuiderMapForm")
	public ModelAndView createGuiderMapForm(Model model,HttpSession session) {
		System.out.println("가이더지도등록하러가자");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user==null) {
			return new ModelAndView("index");
			}else {
				return new ModelAndView("myPage/insertMapForm.jsp");
			}
	}
	@RequestMapping("/createGuideMapForm")
	public ModelAndView createGuideMapForm(Model model,HttpSession session) {
		System.out.println("가이드지도등록하러가자");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user==null) {
			return new ModelAndView("index");
			}else {
				return new ModelAndView("myPage/insertGuideMapForm.jsp");
			}
	}
	
	@RequestMapping("/UserGuiderMapUpdateForm/{mapSeq}")
	public ModelAndView userGuiderMapUpdateForm(@PathVariable("mapSeq") int mapSeq, Model model,HttpSession session,MapVO mapvo) {
		MapVO map = mapService.getMap(mapvo);
		model.addAttribute("map",map);
		return new ModelAndView("redirect:../myPage/guiderMapUpdate.jsp");
		
	}
	
	@RequestMapping("/mapUpdate/{mapSeq}")
	public ModelAndView UpdateMap(@PathVariable("mapSeq") int mapSeq,MapVO mapvo, Model model,HttpSession session) {
		System.out.println("맵수정하기");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user!=null) {
		mapService.updateMap(mapvo);
		return new ModelAndView("redirect:../mypage");
		}else {
			return new ModelAndView("redirect:index");
		}
	}
	@RequestMapping("/mapDelete/{mapSeq}")
	public ModelAndView deleteMap(@PathVariable("mapSeq") int mapSeq,UserPlaceVO userplacevo,MapVO mapvo,MapPlaceVO mapplacevo,MapFavoriteVO mapfavoritevo, Model model,HttpSession session) {
		System.out.println("맵삭제하기");
		System.out.println("등록된지도 삭제");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user!=null) {
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
		return new ModelAndView("redirect:../mypage");
		}else {
			return new ModelAndView("redirect:index");
		}
	}
	
	
	
}