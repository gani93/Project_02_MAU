package com.spring.mau.view.index;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Controller
public class IndexController {
	
	@Autowired
	private PlaceService placeService;
	@Autowired
	private MapViewService mapViewService;
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/index")
	public ModelAndView home(Model model,MapViewVO mapViewVO,PlaceVO placeVO) {
		// TODO Auto-generated method stub
		System.out.println("메인으로");
		
		
		// 추천 가이드지도
		List<MapViewVO> randomList = mapViewService.getRandomMap(mapViewVO);
		
		ArrayList<Integer> mapSeq = new ArrayList<Integer>();
		for(MapViewVO vo : randomList) {
			int a = vo.getMapSeq();
			mapSeq.add(a);
		}
		Collections.shuffle(mapSeq);
//		System.out.println(mapSeq);

		List<MapViewVO> randomMap = new ArrayList<MapViewVO>();
		
		for(int num : mapSeq) {
			mapViewVO = new MapViewVO();
			System.out.println(num);
			mapViewVO.setMapSeq(num);
			mapViewVO = mapViewService.getBySeq(mapViewVO);
			int cnt = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
			mapViewVO.setPlaceCnt(cnt);
			randomMap.add(mapViewVO);
		}
		
		// 최신 가이드 지도
		List<MapViewVO> newestList = mapViewService.getNewestMap(mapViewVO);
		List<MapViewVO> newestMap = new ArrayList<MapViewVO>();
		
		ArrayList<Integer> mapSeq2 = new ArrayList<Integer>();
		for(MapViewVO vo : newestList) {
			int a = vo.getMapSeq();
			mapSeq2.add(a);
		}
		for(int vo : mapSeq2) {
			mapViewVO = new MapViewVO();
			mapViewVO.setMapSeq(vo);
			mapViewVO = mapViewService.getBySeq(mapViewVO);
			int cnt2 = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
			mapViewVO.setPlaceCnt(cnt2);
			newestMap.add(mapViewVO);
		}
//		for(int i=0;i<randomMap.size();i++) {
//			mapViewVO.setMapSeq(randomMap.get(i).getMapSeq());
//			int count = mapViewService.getMapCount(mapViewVO);
//			
//			model.addAllAttributes("placeCnt"+i,count);
//		}
		
		// 활발한 가이더
		List<MapViewVO> getHotUser = mapViewService.getHotUser(mapViewVO);
		
//		// 추천 가이더 지도
		List<MapViewVO> favoriteMap = mapViewService.favoriteMap(mapViewVO);
//		List<MapViewVO> favoriteMap = new ArrayList<MapViewVO>();
//		
//		ArrayList<Integer> mapSeq3 = new ArrayList<Integer>();
//		for(MapViewVO vo : fvMap) {
//			int a = vo.getMapSeq();
//			mapSeq3.add(a);
//		}
//		for(int vo : mapSeq3) {
//			mapViewVO = new MapViewVO();
//			
//			mapViewVO.setMapSeq(vo);
//			
//			mapViewVO = mapViewService.getBySeq2(mapViewVO);
////			int cnt3 = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
////			System.out.println("실행함");
////			mapViewVO.setPlaceCnt(cnt3);
//			favoriteMap.add(mapViewVO);
//		}
		
		// 요즘 사랑받는 장소
		List<MapViewVO> fvPlace= mapViewService.favoritePlace(mapViewVO);
		List<PlaceVO> favoritePlace = new ArrayList<PlaceVO>();
		
		ArrayList<Integer> mapSeq4 = new ArrayList<Integer>();
		for(MapViewVO vo : fvPlace) {
			int a = vo.getPlaceSeq();
			System.out.println(a);
			mapSeq4.add(a);
		}
		for(int vo : mapSeq4) {
			placeVO = new PlaceVO();
			placeVO.setPlaceSeq(vo);
			placeVO = placeService.getPlace(placeVO);
			favoritePlace.add(placeVO);
		}
		
		// 인기 가이드 지도
		List<MapViewVO> favoriteGuide = mapViewService.favoriteGuide(mapViewVO);
//		List<MapViewVO> favoriteGuide = new ArrayList<MapViewVO>();
//		
//		ArrayList<Integer> mapSeq5 = new ArrayList<Integer>();
//		for(MapViewVO vo : fvGuide) {
//			int a = vo.getMapSeq();
//			System.out.println("a출력성공");
//			mapSeq3.add(a);
//		}
//		for(int vo : mapSeq5) {
//			mapViewVO = new MapViewVO();
//			
//			mapViewVO.setMapSeq(vo);
//			
//			mapViewVO = mapViewService.getBySeq2(mapViewVO);
////			int cnt3 = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
////			System.out.println("실행함");
////			mapViewVO.setPlaceCnt(cnt3);
//			favoriteGuide.add(mapViewVO);
//		}
		// 추천 가이드지도
		List<MapViewVO> randomList2 = mapViewService.getRandomGuide(mapViewVO);
		
		ArrayList<Integer> mapSeq6 = new ArrayList<Integer>();
		for(MapViewVO vo : randomList2) {
			int a = vo.getMapSeq();
			mapSeq6.add(a);
		}
		Collections.shuffle(mapSeq6);
//		System.out.println(mapSeq);

		List<MapViewVO> randomGuide = new ArrayList<MapViewVO>();
		
		for(int num : mapSeq6) {
			mapViewVO = new MapViewVO();
			System.out.println(num);
			mapViewVO.setMapSeq(num);
			mapViewVO = mapViewService.getBySeq(mapViewVO);
			int cnt = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
			mapViewVO.setPlaceCnt(cnt);
			randomGuide.add(mapViewVO);
		}
		
		model.addAttribute("randomGuide", randomGuide);
		model.addAttribute("favoriteGuide", favoriteGuide);
		model.addAttribute("favoriteMap", favoriteMap);
		model.addAttribute("favoritePlace", favoritePlace);
		model.addAttribute("getHotUser", getHotUser);
		model.addAttribute("newestMap", newestMap);
		model.addAttribute("randomMap", randomMap);
		return new ModelAndView("index.jsp");
	}
}
