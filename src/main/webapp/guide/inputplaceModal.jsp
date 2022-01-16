<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   MapViewVO map = (MapViewVO)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset='utf-8'>
  <meta name="theme-color" content="#ffffff">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mau.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
     <script src="jquery-1.7.1.min.js"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<!-- 장소등록 1차 시작-->
 <div class="modal fade" id="modal-group-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장소저장</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
            <div class="place_name" style="font-size : large; color : #F3B922; font-weight: bold ;"><h2>여기</h2></div>
            <div><%if(map != null) {%><%=map.getMapIcon()%> <%=map.getMapName()%><%} else {%>첫 장소로 해당 지도<%} %>에<br>선택한 장소를 저장하시겠습니까?</div>
            <div><br>🔥<br>이전에 등록한 장소가 있다면<br>새로 등록한 장소로 변경됩니다.<br><br>📣해당 장소는 공유됩니다.<br>개인 가이드 지도는 장소 삭제가 가능합니다.<br>함께 만드는 가이드 지도는 장소 삭제가 불가합니다.<br>🔔주제에 맞지 않을 시 관리자가 임의 삭제할 수 있습니다.<br><br></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
        <div onclick="add_place(placeId, placeSouthWest, placeNorthEast , placeName, placeAddr)" class="add-place-btn btn btn-primary"><span>장소저장</span></div>
      </div>
    </div>
  </div>
</div>
<!--장소등록 1차 끝-->
<!-- 장소등록 2차 시작-->
<div class="modal fade" id="modal-group-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장소 저장 완료!</h5>
      </div>
      <div class="modal-body text-center">
       <div>이 장소에 대해 하고 싶은 이야기가 있나요?</div>
        <div>아래 이모지를 눌러서 의견을 남겨보세요!?</div>
        <!-- 댓글 달기 / 이모티콘 -->
        <script>
           //이모지 클릭시, 댓글창 오픈
         $(function(){
            $('input:radio[name="emoji"]').click(function(){
            if($('#inputbox').css("display") == "none") {
                $('#inputbox').show();
                $('.uk-modal-body').scrollTop( $('.uk-modal-body').height() );
                $('#comment_text').focus();
            }
            var emoji_value = $('input:radio[name=emoji]:checked').val();
        
            console.log(emoji_value);
            
            $('#modalPlaceState').val(emoji_value);
              });
            });
      </script>
					<div>
						<div>
							<div>
								<div>
									<div>
										<div class="info-box">
											<!--  <div class="title">직접 의견을 남겨보세요!</div> -->
											<div class="emoji-list">
												<div class="uk-width-1-5">
													<div id="emoji_1"
														class="emoji-box bg-white border-radius shadow"
														data-icon="1-a" data-score="1">
														<input id="radio_1" type="radio" name="emoji"
															class="emoji" value="disappointed-face_1f61e.png"
															style="display: none"> <label for="radio_1"
															style="cursor: pointer;"><img id="img1"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/disappointed-face_1f61e.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-5">
													<div id="emoji_2"
														class="emoji-box bg-white border-radius shadow"
														data-icon="2-a" data-score="2">
														<input id="radio_2" type="radio" name="emoji"
															class="emoji" value="expressionless-face_1f611.png"
															style="display: none"> <label for="radio_2"
															style="cursor: pointer;"><img id="img2"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/expressionless-face_1f611.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-5">
													<div id="emoji_3"
														class="emoji-box bg-white border-radius shadow"
														data-icon="3-a" data-score="3">
														<input id="radio_3" type="radio" name="emoji"
															class="emoji"
															value="grinning-face-with-smiling-eyes_1f604.png"
															style="display: none"> <label for="radio_3"
															style="cursor: pointer;"><img id="img3"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/grinning-face-with-smiling-eyes_1f604.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-5">
													<div id="emoji_4"
														class="emoji-box bg-white border-radius shadow"
														data-icon="4-a" data-score="4">
														<input id="radio_4" type="radio" name="emoji"
															class="emoji" value="partying-face_1f973.png"
															style="display: none;"> <label for="radio_4"
															style="cursor: pointer;"><img id="img4"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/partying-face_1f973.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-5">
													<div id="emoji_5"
														class="emoji-box bg-white border-radius shadow"
														data-icon="5-a" data-score="5">
														<input id="radio_5" type="radio" name="emoji"
															class="emoji" value="face-with-steam-from-nose_1f624.png"
															style="display: none"> <label for="radio_5"
															style="cursor: pointer;"><img id="img5"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-steam-from-nose_1f624.png"
															width="30px"></label>
													</div>
												</div>


												<div class="uk-width-1-6">
													<div id="emoji_6"
														class="emoji-box bg-white border-radius shadow"
														data-icon="1-b" data-score="1">
														<input id="radio_6" type="radio" name="emoji"
															class="emoji" value="pleading-face_1f97a.png"
															style="display: none"> <label for="radio_6"
															style="cursor: pointer;"><img id="img6"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/pleading-face_1f97a.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-6">
													<div id="emoji_7"
														class="emoji-box bg-white border-radius shadow"
														data-icon="2-b" data-score="2">
														<input id="radio_7" type="radio" name="emoji"
															class="emoji" value="zipper-mouth-face_1f910.png"
															style="display: none"> <label for="radio_7"
															style="cursor: pointer;"><img id="img7"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/zipper-mouth-face_1f910.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-6">
													<div id="emoji_8"
														class="emoji-box bg-white border-radius shadow"
														data-icon="3-b" data-score="3">
														<input id="radio_8" type="radio" name="emoji"
															class="emoji" value="face-with-rolling-eyes_1f644.png"
															style="display: none"> <label for="radio_8"
															style="cursor: pointer;"><img id="img8"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-rolling-eyes_1f644.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-6">
													<div id="emoji_9"
														class="emoji-box bg-white border-radius shadow"
														data-icon="4-b" data-score="4">
														<input id="radio_9" type="radio" name="emoji"
															class="emoji"
															value="kissing-face-with-smiling-eyes_1f619.png"
															style="display: none"> <label for="radio_9"
															style="cursor: pointer;"><img id="img9"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/kissing-face-with-smiling-eyes_1f619.png"
															width="30px"></label>
													</div>
												</div>
												<div class="uk-width-1-6">
													<div id="emoji_10"
														class="emoji-box bg-white border-radius shadow"
														data-icon="5-b" data-score="5">
														<input id="radio_10" type="radio" name="emoji"
															class="emoji"
															value="smiling-face-with-heart-eyes_1f60d.png"
															style="display: none"> <label for="radio_10"
															style="cursor: pointer;"><img id="img10"
															src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/smiling-face-with-heart-eyes_1f60d.png"
															width="30px"></label>
													</div>
												</div>
												<div class="text_box">
													<div class="text">ㅠㅠ</div>
													<div class="text">음..?</div>
													<div class="text">괜찮아요</div>
													<div class="text">좋았어요!</div>
													<div class="text">완벽해요!!</div>
												</div>
											</div>
										</div>
										<!-- 반응형 2단 끝 -->
										<!-- 댓글달기 -->
										<div id="inputbox" style="display: none;">
											<form method="post" name="frm">
												<textarea id="modalReview" class="shadow bg-white"
													name="modalReview" rows="4" cols="50"
													placeholder="여기에 의견을 입력해주세요." style="margin-top: 30px"></textarea>
												<input type="hidden" id="modalPlaceState"
													name="modalPlaceState" value="">
												<!-- div class="submit-button disabled button shadow bg-white padding-15">
                                       <input type="submit" value="저장하기" style="width: 380px;border-style: none; background-color: white;">
                                   </div> -->
											</form>
										</div>

									</div>
								</div>
							</div>
						</div>
						<!-- emoji-list end -->
					</div>
					<!--info-box end -->
      </div><!--modal-body end -->
      <div class="modal-footer">
              <div class="btn btn-secondary" onclick="last_step();">건너뛰기</div>
             <button type="button" class="btn btn-primary" onclick="add_review();">리뷰 남기기</button>
        </div>
        </div>
   </div>      
</div>
<!-- 장소등록 2차 끝 -->
<!-- 장소등록 3차 시작 -->
<!-- <div class="modal fade" id="modal-group-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">사진을 추가해주세요.</h5>
      </div>
      <div class="modal-body text-center">
                <span class="icon">🙌</span><br>
                <span>잠시만요!</span>
            <div class="sub-title">혹시, <b><span id="place_name"></span></b> 사진이 있으신가요?</div>
         
         <form id="ajaxform" action="/submit_image" method="post" enctype="multipart/form-data">
            <input type="hidden" id="source_type" value="mytheme_add" name="source_type">
            <input style="display: none;" type="file" multiple name="image" id="photo_upload">
         </form>

            <div class="img-box">
                owl css
                <link rel="stylesheet" type="text/css" href="/static/css/owl.carousel.min.css?q=1627023708">
                <link rel="stylesheet" type="text/css" href="/static/css/owl.theme.default.min.css?q=1627023708">
                <div id="image-waiting">
               <div class="image-waiting spinner-cover uk-flex uk-flex-cen/seq/1middle">
                  <div class="lds-ring"><div></div><div></div><div></div><div></div></div>
                  <div class="text">잠시만 기다려주세요.</div>
               </div>
            </div>
                <div class="info-images chocolat-parent owl-carousel owl-theme clear"></div>
            </div>

            <div class="desc">여기에 업로드한 사진은<br>장소 상세페이지에 공유됩니다.</div>
        </div>
        <div class="modal-footer">
                <div class="close-modal btn btn-secondary justify-content-center " onclick="last_step();">건너뛰기</div>
                <div onclick="upload_trigger();" class="btn btn-primary"><span>사진 추가하기</span></div>
        </div>
    </div>
  </div>
</div> -->
<!-- 장소등록 3차 끝 -->
</body>
</html>