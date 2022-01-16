package com.spring.mau.view.detailInfo;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.placefavorite.PlaceFavoriteService;
import com.spring.mau.placefavorite.PlaceFavoriteVO;
import com.spring.mau.review.ReviewService;
import com.spring.mau.review.ReviewVO;
import com.spring.mau.upload.UploadService;
import com.spring.mau.upload.UploadVO;
import com.spring.mau.user.UserVO;

@Controller
@SessionAttributes("detailInfo")
public class DetailInfoController {
	@Autowired
	private PlaceService placeService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MapViewService mapViewService;
	@Autowired
	private UploadService uploadService;
	@Autowired
	private PlaceFavoriteService placeFavoriteService;
	
	@RequestMapping("/detailInfo/{placeSeq}")
	public ModelAndView getGuiderMap(@PathVariable("placeSeq") int placeSeq,PlaceFavoriteVO fvo, HttpSession session,Model model, PlaceVO vo, ReviewVO rvo,
			MapViewVO mvo, UploadVO uvo) throws IOException {
		// TODO Auto-generated method stub
		UserVO user = (UserVO)session.getAttribute("loginUser");
		PlaceVO place = placeService.getPlace(vo);
		model.addAttribute("place", place);
		System.out.println("상세 보기");

		// 댓글등록
		List<ReviewVO> reviewList = reviewService.getReview(rvo);
		model.addAttribute("reviewList", reviewList);

		// 맵이름 가져오기
		List<MapViewVO> keywordList = mapViewService.getkeyword(mvo);
		model.addAttribute("keywordList", keywordList);
		System.out.println("상세페이지-맵이름 가져오기");

		// 업로드한 사진 가져오기
		List<UploadVO> photoList = uploadService.getPhoto(uvo);
		model.addAttribute("photoList", photoList);
		System.out.println("업로드 사진 리스트 가져오기");

		// 장소즐찾 가져오기
		if(user!=null) {
		fvo.setUserSeqId(user.getUserSeqId());
		PlaceFavoriteVO placeFavorite = placeFavoriteService.getPlaceFavorite(fvo);
		model.addAttribute("placeFavorite", placeFavorite);
		}
		return new ModelAndView("../detailInfo/detailview.jsp");
	}

	@RequestMapping("/uploadImg/{placeSeq}")
	public ModelAndView uploadImg(@PathVariable("placeSeq") int placeSeq, Model model, PlaceVO vo, ReviewVO rvo,
			MapViewVO mvo, UploadVO uvo) throws IllegalStateException, IOException {
		// 파일 업로드 처리
		MultipartFile photoUpload = uvo.getPhotoUpload();
		String fileName = photoUpload.getOriginalFilename();
		if (!photoUpload.isEmpty()) {
			photoUpload.transferTo(new File("C:/imgPath/" + fileName));
			System.out.println("사진 업로드 성공!");
		}
//		uvo.setPhotoUpload(photoUpload);
		uvo.setPlaceSeq(placeSeq);
		uvo.setPhotoName(fileName);
		uploadService.insertPhoto(uvo);
		System.out.println("사진 업로드--> DB insert 성공!");
		return new ModelAndView("redirect:/detailInfo/" + placeSeq);
	}
}
