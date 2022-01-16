package com.spring.mau.view.place;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapplace.MapPlaceService;
import com.spring.mau.mapplace.MapPlaceVO;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.review.ReviewService;
import com.spring.mau.review.ReviewVO;
import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Controller
@SessionAttributes("place")
public class PlaceController {
	@Autowired
	private PlaceService placeService;
	@Autowired
	private UserPlaceService userPlaceService;
	@Autowired
	private MapPlaceService mapPlaceService;
	@Autowired
	private MapViewService mapViewService;
	@Autowired
	private MapService mapService;
	@Autowired
	private ReviewService reviewService;
	@RequestMapping(value="/guideMap/{mapSeq}", method = RequestMethod.POST)
	   public void insertPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo, UserPlaceVO vo2, MapPlaceVO vo3, HttpServletRequest request, HttpServletResponse response, ReviewVO rvo) {
	      // TODO Auto-generated method stub
	      System.out.println("장소등록");
	         int placeId = Integer.parseInt(request.getParameter("placeId"));
	         double placeSouthWest = Double.parseDouble(request.getParameter("placeSouthWest"));
	         double placeNorthEast = Double.parseDouble(request.getParameter("placeNorthEast"));
	         String placeName = request.getParameter("placeName");
	         String placeAddr = request.getParameter("placeAddr");
	      vo.setPlaceId(placeId);
	      vo.setPlaceSouthWest(placeSouthWest);
	      vo.setPlaceNorthEast(placeNorthEast);
	      vo.setPlaceName(placeName);
	      vo.setPlaceAddr(placeAddr);
	      PlaceVO plId = placeService.getPlaceId(vo);
	      PlaceVO plSeq;
	      if(plId == null) {//새로운 장소등록
	         placeService.insertPlace(vo);
	         plSeq = placeService.getPlaceSeq(vo);//새로 만들어진 장소의 시퀀스 값(placeSeq) 가져오기
	      } else {//이미있는 장소등록은 insertPlace하지 않는다.
	         plSeq = placeService.getPlaceId(vo);
	      }
	      System.out.println("유저-장소등록");
	      vo2.setPlaceSeq(plSeq.getPlaceSeq());
	      vo2.setMapSeq(mapSeq);
	      HttpSession session = request.getSession();
	      int userSeqId = (Integer)session.getAttribute("userSeqId");
	      vo2.setUserSeqId(userSeqId);
	      userPlaceService.insertUserPlace(vo2);
	      
	      System.out.println("맵-장소등록");
	      vo3.setPlaceSeq(plSeq.getPlaceSeq());
	      vo3.setMapSeq(mapSeq);
	      mapPlaceService.insertMapPlace(vo3);
	      try {
	         response.sendRedirect(mapSeq + "");
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      //모달창 리뷰 등록 처리
	         System.out.println("모달창 리뷰 등록!");
	         String modalReview = request.getParameter("modalReview2");
	         System.out.println(modalReview);
	         String modalPlaceState = request.getParameter("modalPlaceState2");
	         System.out.println(modalPlaceState);
	      
	         PlaceVO placeSeq = placeService.getPlaceSeq(vo); 
	         int placeSeq_new = placeSeq.getPlaceSeq(); //가장 마지막 placeSeq(new)
	         int plceId_new =placeSeq.getPlaceId();//가장 마지막 placeId(new)
	         
	     
	         PlaceVO place = placeService.getPlaceId(vo);
	         int placeSeq_alreday = place.getPlaceSeq();//기존에 있는 placeSeq
	         int placeId_already = place.getPlaceId(); //기존에 있는 placeId
	         
	         if(plceId_new == placeId_already ) { //이미 있는 장소일 경우
	        	 rvo.setPlaceSeq(placeSeq_new);
	             rvo.setUserSeqId(userSeqId);
	             rvo.setReview(modalReview);
	             rvo.setPlaceState(modalPlaceState);
	             reviewService.insertReview(rvo);
	             System.out.println("모달 새로운 장소에 리뷰 성공!");
	           
	         }else { // 장소 없음
	        	 System.out.println("모달 기존 장소에 리뷰 성공!");
	             rvo.setPlaceSeq(placeSeq_alreday);
	             rvo.setUserSeqId(userSeqId);
	             rvo.setReview(modalReview);
	             rvo.setPlaceState(modalPlaceState);
	             reviewService.insertReview(rvo);
	             System.out.println("모달 새로운 장소에 리뷰 성공!");
	         }
	   }
	@RequestMapping(value="/guiderMap/{mapSeq}", method = RequestMethod.POST)
	   public void insertGuiderPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo, UserPlaceVO vo2, MapPlaceVO vo3, HttpServletRequest request, HttpServletResponse response,ReviewVO rvo) {
	      // TODO Auto-generated method stub
	      System.out.println("장소등록");
	         int placeId = Integer.parseInt(request.getParameter("placeId"));
	         double placeSouthWest = Double.parseDouble(request.getParameter("placeSouthWest"));
	            double placeNorthEast = Double.parseDouble(request.getParameter("placeNorthEast"));
	         String placeName = request.getParameter("placeName");
	         String placeAddr = request.getParameter("placeAddr");
	      vo.setPlaceId(placeId);
	      vo.setPlaceSouthWest(placeSouthWest);
	      vo.setPlaceNorthEast(placeNorthEast);
	      vo.setPlaceName(placeName);
	      vo.setPlaceAddr(placeAddr);
	      PlaceVO plId = placeService.getPlaceId(vo);
	      PlaceVO plSeq;
	      if(plId == null) {//새로운 장소등록
	         placeService.insertPlace(vo);
	         plSeq = placeService.getPlaceSeq(vo);//새로 만들어진 장소의 시퀀스 값(placeSeq) 가져오기
	      } else {//이미있는 장소등록은 insertPlace하지 않는다.
	         plSeq = placeService.getPlaceId(vo);
	      }
	      System.out.println("유저-장소등록");
	      vo2.setPlaceSeq(plSeq.getPlaceSeq());
	      vo2.setMapSeq(mapSeq);
	      HttpSession session = request.getSession();
	      int userSeqId = (Integer)session.getAttribute("userSeqId");
	      vo2.setUserSeqId(userSeqId);
	      userPlaceService.insertUserPlace(vo2);
	      
	      System.out.println("맵-장소등록");
	      vo3.setPlaceSeq(plSeq.getPlaceSeq());
	      vo3.setMapSeq(mapSeq);
	      mapPlaceService.insertMapPlace(vo3);
	      try {
	         response.sendRedirect(mapSeq + "");
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      //모달창 리뷰 등록 처리
	      System.out.println("모달창 리뷰 등록!");
	      String modalReview = request.getParameter("modalReview2");
	      System.out.println(modalReview);
	      String modalPlaceState = request.getParameter("modalPlaceState2");
	      System.out.println(modalPlaceState);
	   
	      PlaceVO placeSeq = placeService.getPlaceSeq(vo); //가장 마지막 placeSeq(new)
	      int placeSeq_new = placeSeq.getPlaceSeq(); //가장 마지막 placeSeq(new)
	      int plceId_new =placeSeq.getPlaceId();//가장 마지막 placeId(new)
	      
	  
	      PlaceVO place = placeService.getPlaceId(vo); //기존에 있는 placeSeq
	      int placeSeq_alreday = place.getPlaceSeq();//기존에 있는 placeSeq
	      int placeId_already = place.getPlaceId(); //기존에 있는 placeId
	      
	      if(plceId_new == placeId_already ) { //이미 있는 장소일 경우
	     	 rvo.setPlaceSeq(placeSeq_new);
	          rvo.setUserSeqId(userSeqId);
	          rvo.setReview(modalReview);
	          rvo.setPlaceState(modalPlaceState);
	          reviewService.insertReview(rvo);
	          System.out.println("모달 새로운 장소에 리뷰 성공!");
	        
	      }else { // 장소 없음
	     	 System.out.println("모달 기존 장소에 리뷰 성공!");
	          rvo.setPlaceSeq(placeSeq_alreday);
	          rvo.setUserSeqId(userSeqId);
	          rvo.setReview(modalReview);
	          rvo.setPlaceState(modalPlaceState);
	          reviewService.insertReview(rvo);
	          System.out.println("모달 새로운 장소에 리뷰 성공!");
	      }
	   }
	@RequestMapping(value="/guideMap/search/{mapSeq}", method = RequestMethod.POST)
	public ModelAndView searchPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo,MapViewVO vo2,HttpServletRequest request, Model model,MapVO mapvo) {
		// TODO Auto-generated method stub
		System.out.println("장소검색");
		String keyword = request.getParameter("keyword");
		request.setAttribute("keyword", keyword);
		
		vo2.setMapSeq(mapSeq);
		MapViewVO map = mapViewService.getBySeq(vo2);
		MapVO mapType = mapService.getMap(mapvo);
		model.addAttribute("map", map);
		model.addAttribute("mapType",mapType);
		return new ModelAndView("/guide/searchplace.jsp");
	}
	
	@RequestMapping("myfavorite")
	   public ModelAndView getFavoritePlace (PlaceVO vo,MapViewVO vo2, Model model, HttpSession session, HttpServletRequest request ) {
	      // TODO Auto-generated method stub
	      System.out.println("장소즐겨찾기(지도형태로) 상세 보기");
	      session = request.getSession();
	      int userSeqId = (Integer)session.getAttribute("userSeqId");
	      vo.setUserSeqId(userSeqId);
	      System.out.println(userSeqId);
	      placeService.getPlace(vo);
	      List<PlaceVO> fvList = placeService.getPlacebyId(vo);
	      List<MapViewVO> fvPlace = new ArrayList<MapViewVO>();
	      ArrayList<Integer> placeSeq = new ArrayList<Integer>();
	      for(PlaceVO placeVO : fvList) {
	         int a = placeVO.getPlaceSeq();
	         System.out.println(a);
	         placeSeq.add(a);
	      }
	      for(int seq : placeSeq) {
	         vo2 = new MapViewVO();
	         vo2.setPlaceSeq(seq);
	         vo2 = mapViewService.getPlace2(vo2);
	         fvPlace.add(vo2);
	      }
	      /*
	       * vo2.setUserSeqId(userSeqId); List<MapViewVO> placeList =
	       * placeService.getfavoritePlaceSeq(vo2); model.addAttribute("placeList",
	       * placeList);
	       */
	      model.addAttribute("placeList",fvPlace);
	      return new ModelAndView("guider/myfavorite.jsp");
	   }
	
	   @RequestMapping("here")
	   public ModelAndView getHerePlace (PlaceVO vo, Model model, double lat, double lng, HttpServletRequest request ) {
	      // TODO Auto-generated method stub
	      System.out.println("지도에서 장소찾기 상세 보기");
	      System.out.println(lat);
	      System.out.println(lng);

	      vo.setPlaceSouthWest(lat);
	      vo.setPlaceNorthEast(lng); 
	       
	      List<PlaceVO> herePlaceList = placeService.getPlaceList(vo);
	      model.addAttribute("herePlaceList", herePlaceList);
	       
	       return new ModelAndView("guiding/here.jsp");
	   }
	   @RequestMapping("deletePlace/{mapSeq}/{placeSeq}")
	   public ModelAndView deletePlace (@PathVariable("placeSeq") int placeSeq,@PathVariable("mapSeq")int mapSeq,MapPlaceVO mapVo,UserPlaceVO userPlaceVo) {
		   mapPlaceService.deleteMapPlaceSeq(mapVo);
		   userPlaceService.deleteUserPlaceSeqMapSeq(userPlaceVo);
		   return new ModelAndView("redirect:/guiderMap/"+mapSeq);
	   }
	

	
}
