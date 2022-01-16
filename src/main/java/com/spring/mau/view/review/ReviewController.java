package com.spring.mau.view.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.review.ReviewService;
import com.spring.mau.review.ReviewVO;

@Controller
@SessionAttributes("review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/review", method = RequestMethod.POST)
	public ModelAndView insertReview (ReviewVO vo,HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
			System.out.println("리뷰등록");
		
		  	String review = request.getParameter("review");
		  	int placeSeq = Integer.parseInt(request.getParameter("placeSeq"));
		  	int userSeqId = Integer.parseInt(request.getParameter("userSeqId"));
		  	String placeState = request.getParameter("placeState");
			
			vo.setPlaceSeq(placeSeq);
			vo.setReview(review);
			vo.setUserSeqId(userSeqId);
			vo.setPlaceState(placeState);

			reviewService.insertReview(vo);
			
			System.out.println("리뷰 insert 성공!");
			
			return new ModelAndView("redirect:detailInfo/"+placeSeq);
	}
	
	@RequestMapping(value="/reviewDelete", method = RequestMethod.POST)
	public ModelAndView deleteReview (ReviewVO vo,HttpServletRequest request, Model model,PlaceVO pvo) {
			System.out.println("리뷰삭제");
			int placeSeq = Integer.parseInt(request.getParameter("placeSeq"));
			System.out.println(placeSeq);
		  	int reviewSeq =  Integer.parseInt(request.getParameter("reviewSeq"));
		  	System.out.println("리뷰 Seq :" +reviewSeq);
//		  	
		  	int placeSeq1 = pvo.getPlaceSeq();
		  	int reviewSeq1 = vo.getReviewSeq();

			if(placeSeq1 == placeSeq && reviewSeq1 == reviewSeq) {
				reviewService.deleteReview(vo);
				System.out.println("리뷰 delete 성공!");
			}
			return new ModelAndView("redirect:detailInfo/"+placeSeq);
	}
	
}
