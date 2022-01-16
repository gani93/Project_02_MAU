package com.spring.mau.view.mapfavorite;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteService;
import com.spring.mau.mapfavorite.MapFavoriteVO;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.placefavorite.PlaceFavoriteService;
import com.spring.mau.placefavorite.PlaceFavoriteVO;
import com.spring.mau.user.UserVO;

@Controller
public class MapFavoriteController {
	// TODO Auto-generated method stub
	@Autowired
	private MapFavoriteService mapFavoriteService;
	@Autowired
	private PlaceFavoriteService placeFavoriteService;
	
	@RequestMapping("/insertMapFavorite")
	public ModelAndView myPage(HttpSession session, Model model,MapFavoriteVO mapVo) {
		// TODO Auto-generated method stub
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user!=null) {
			mapVo.setUserSeqId(user.getUserSeqId());
			mapFavoriteService.insertFavorite(mapVo);
		}
		return new ModelAndView("redirect:guiderMap/"+mapVo.getMapSeq());
	}

	@RequestMapping("/deleteMapFavorite")
	public ModelAndView index(Model model, HttpSession session, MapFavoriteVO mapVo) {
		// TODO Auto-generated method stub
		mapFavoriteService.deleteFavorite(mapVo);
		return new ModelAndView("redirect:guiderMap/"+mapVo.getMapSeq());
	}
	   @RequestMapping("/insertMap1Favorite")
	   public ModelAndView myPage1(HttpSession session,Model model,MapFavoriteVO mapVo) {
	      // TODO Auto-generated method stub
		   UserVO user = (UserVO)session.getAttribute("loginUser");
			if(user!=null) {
				mapVo.setUserSeqId(user.getUserSeqId());
				mapFavoriteService.insertFavorite(mapVo);
			}
	      return new ModelAndView("redirect:guideMap/"+mapVo.getMapSeq());

	   }

	   @RequestMapping("/deleteMap1Favorite")
	   public ModelAndView index1(Model model, HttpSession session, MapFavoriteVO mapVo) {
	      // TODO Auto-generated method stub
	      mapFavoriteService.deleteFavorite(mapVo);
	      return new ModelAndView("redirect:guideMap/"+mapVo.getMapSeq());
	   }
	   
	   @RequestMapping("/insertPlaceFavorite")
	   public ModelAndView detailinfo(int placeSeq, Model model, PlaceVO pvo,PlaceFavoriteVO fvo) {
	      // TODO Auto-generated method stub
		   placeFavoriteService.insertPlaceFavorite(fvo);
		   System.out.println("장소 즐찾 성공!");
		   return new ModelAndView("redirect:/detailInfo/"+placeSeq);

	   }

	   @RequestMapping("/deletePlaceFavorite")
	   public ModelAndView detailinfo(int placeSeq, Model model, HttpSession session, PlaceVO pvo, PlaceFavoriteVO fvo) {
	      // TODO Auto-generated method stub
		   placeFavoriteService.deletePlaceFavorite(fvo);
		   System.out.println("장소 즐찾 삭제!");
	      return new ModelAndView("redirect:/detailInfo/"+placeSeq);
	   }
}


