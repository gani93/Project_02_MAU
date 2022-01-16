<%@page import="com.spring.mau.placefavorite.PlaceFavoriteVO"%>
<%@page import="com.spring.mau.upload.UploadVO"%>
<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="com.spring.mau.review.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.mau.user.UserVO"%>
<%@page import="com.spring.mau.place.PlaceVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    List<UploadVO> photo = (List<UploadVO>)request.getAttribute("photoList");
    List<ReviewVO> review = (List<ReviewVO>)request.getAttribute("reviewList");
    List<MapViewVO> keyword = (List<MapViewVO>)request.getAttribute("keywordList");
    PlaceVO place = (PlaceVO)request.getAttribute("place");   
    UserVO user = (UserVO)session.getAttribute("loginUser");
    PlaceFavoriteVO chk = (PlaceFavoriteVO)request.getAttribute("placeFavorite");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>MAU</title>
    <link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/image/logo/mauicon.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mau.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
  	<script src="jquery-1.7.1.min.js"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <!-- 카카오 링크 공유 -->
    <!-- Kakao API -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
   //카카오로 url 공유하기
   function kakao() { 
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('51c537c4b3603a65b8ba8a854278340e');
    
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: 'MAU - ME AND YOU',
        imageUrl: "http://localhost:8181/mau/index",
        link: {
          webUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%>,
          mobileWebUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%> // 내용 클릭시 열리는 url 여기에 입력
        }
      },
      buttons: [
        {
          title: 'MAU에는 시크릿 스팟들이 숨어있어요!',
          link: {
            mobileWebUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%> , //버튼 클릭시 열리는 url 여기에 입력
            webUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%>
          }
        }  
      ]
    });
}
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
            
            $('#placeState').val(emoji_value);
        		});
           	});
</script>
<script> 
	//장소 url 공유
	function copy_url() {
		var copy_url = jQuery('#SharePlaceUrl').val();
		navigator.clipboard.writeText(copy_url).then(() => { 
			alert('URL이 복사되었습니다.'); return false; });
		}
</script>
</head>
<body>
    <div id="modal-overflow"  class="place-info-window" uk-modal>
        <div class="uk-modal-dialog border-radius shadow">
            <div class="uk-modal-header">
                <div id="modal_place_name" class="place_name_text">
                	<%=place.getPlaceName()%>
         		</div>   
         		<div id="modal_place_addr" class="place_addr_text">
                   <%=place.getPlaceAddr()%>
               </div> 
         		<div><!-- 장소 즐겨찾기 -->
                 	<input type="checkbox" id="myCheck" name="myCheck" style="display: none;"
                 	<%if(chk!=null){ %>checked<%}%>>
					<label for="myCheck"></label> 
         			<%if(user!=null) {%>
					<form method="get" id="placeFavorite">
					<input type="hidden" name="placeSeq" value="<%=place.getPlaceSeq()%>">
					<input type="hidden" name="userSeqId" value="<%=user.getUserSeqId()%>">
					</form>
					<%} %>
				</div>
				<script>
				$('input:checkbox[name=myCheck]').on('click',function(){
					var chk = $(this).is(":checked");
					if(chk){
						$('#placeFavorite').attr('action','${pageContext.request.contextPath}/insertPlaceFavorite');
						$('#placeFavorite').submit();
					}else{
						$('#placeFavorite').attr('action','${pageContext.request.contextPath}/deletePlaceFavorite');
						$('#placeFavorite').submit();
					}
				});
				</script>
                <div id="modal_place_address" class="place_address clear" onclick="">
                </div>
            </div>
            <div class="uk-modal-body" uk-overflow-auto>
                 <!-- 사진 업로드 -->
                <div class="img-box">
                    <div class="img_upload_box" style="width:950px">
                        <img src="" class="img_upload">
                        <%if(photo==null){ %>
                        <div class="size">장소와 관련된 사진을 올려주시면 <br> 페이지가 더 유익해질 것 같아요!
                    		<form action="${pageContext.request.contextPath}/uploadImg/<%=place.getPlaceSeq()%>" method="post" enctype="multipart/form-data">
								<input type="file" name="photoUpload"/>
								<input type="submit" value="업로드" style=" width:200px;">
							 </form><br>
                        </div>
                        <%} else {%>
                         <div class="size">장소와 관련된 사진을 올려주시면 <br> 페이지가 더 유익해질 것 같아요!
                    		<form action="${pageContext.request.contextPath}/uploadImg/<%=place.getPlaceSeq()%>" method="post" enctype="multipart/form-data">
								<div id="img_input">
										<input type="file" name="photoUpload" style="position: relative; left: 40px; padding-top: 20px; padding-bottom: 10px"/>
										<input type="submit" value="업로드" style=" width:200px;">
								</div>
							 </form>
                        </div>
                          <!-- 사진 출력 부분 -->
                         <%for(int i=0; i< photo.size(); i++) { %>
							 	<div class="img_upload_box">
	                            <img src="/mau/imgPath/<%=photo.get(i).getPhotoName()%>" style="width:250px; height:200px;">
                            	</div>
                            <%}%>
                        <%} %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="height: 650px;">
                        <div class="info-box">
                            <div class="title">여기는 어떤 곳인가요?</div>
                            <!-- 장소 키워드카드 -->
                            <div class="inline-theme-cards clear" onclick="trackOutboundLink('place_page','inbound','go-to-theme');"> <!-- style="padding-left: 15px;" -->
                            	<table style="font-size:16px;">
                            	<%for(int i=0; i< keyword.size(); i++) { %>
                            	<tr>
	                            	<td><%=keyword.get(i).getMapIcon()%></td>
	                            	<td><%=keyword.get(i).getMapName()%></td>
                            	</tr>
                            	<%} %>
                            	</table>
                            </div>
                        </div>
               		<!--  카카오맵 지도 -->
                    <div class="info-box">
                        <div class="title">어디에 있나요?</div>
                        <a id="static_map">
                            <div id="info-map" class="map-box border-radius shadow">
                            <div id="map" style="width:100%; height:230px;"></div>
                            <input type="hidden" name ="SouthWest" value ="<%=place.getPlaceSouthWest() %>">
                     		<input type="hidden" name ="NorthEast" value ="<%=place.getPlaceNorthEast() %>">
                     <!-- <p><em>마커를 클릭해주세요!</em></p>  -->
                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51c537c4b3603a65b8ba8a854278340e"></script>
                     <script>
	                     var south= $("input[name=SouthWest]").val();
	                     var east= $("input[name=NorthEast]").val();
	                     console.log(south);
	                     console.log(east); 
	                     
	                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	                         mapOption = { 
	                             center: new kakao.maps.LatLng(south,east), // 지도의 중심좌표
	                             level: 3 // 지도의 확대 레벨
	                         };
	                     
	                     var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	                       
	                     // 마커를 표시할 위치입니다 
	                     var position =  new kakao.maps.LatLng(south,east);
	                     
	                     
	                     // 마커를 생성합니다
	                     var marker = new kakao.maps.Marker({
	                       position: position,
	                       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	                     });
	                     
	                     // 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
	                     // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	                     // marker.setClickable(true);
	                     
	                     // 마커를 지도에 표시합니다.
	                     marker.setMap(map);
	                     
	                     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	                     var iwContent = '<div style="padding:5px;"><%=place.getPlaceName()%></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                         iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	                     
	                     // 인포윈도우를 생성합니다
	                     var infowindow = new kakao.maps.InfoWindow({
	                         content : iwContent,
	                         removable : iwRemoveable
	                     });
	                     
	                     // 마커에 클릭이벤트를 등록합니다
	                     kakao.maps.event.addListener(marker, 'click', function() {
	                           // 마커 위에 인포윈도우를 표시합니다
	                           infowindow.open(map, marker);  
	                           location.href="https://map.kakao.com/?itemId="+<%=place.getPlaceId()%> //여기에 url 등록
	                     });
                     </script>
                           </div>
                        </a>
                    </div>
                    <!--  장소 url 공유 -->
                    <div class="info-box" style="position: relative; bottom: 80px;">
                      <div class="title_2">이 장소 공유하기</div>
                        <div class="share-box">
                             <div class="share-btn shadow link" onclick="copy_url()" style="margin-right: 10px; border-radius: 50%; width: 30px; height: 30px;">
                            	<img src="${pageContext.request.contextPath}/resources/images/icon-share.png" style="position: relative; right:20px; bottom:20px;">
                            	<input type="hidden" name="url" id="SharePlaceUrl" value="http://localhost:8181/mau/detailInfo/<%=place.getPlaceSeq() %>">
                            </div>
                            <!-- <input type="text" id="SharePlaceUrl"> -->
                             <a href="javascript:kakao();" id="kakao-link-btn">
                                <div class="share-btn shadow kakao">
	                                <img id="kakao_url" src="${pageContext.request.contextPath}/resources/images/icon-kakao.png"
	                                href="'http://localhost:8181/mau/detailInfo/'+<%=place.getPlaceSeq()%>">
                                </div>
                            </a>
                            <a class="share-place-btn" class="fb-share-button" target="_blank" href="https://http://localhost:8181/mau/index">
                                <div class="share-btn shadow facebook">
                              	  <img id="kakao_url" src="${pageContext.request.contextPath}/resources/images/icon-facebook.png">
                                </div>
                            </a>
                        </div>
                    </div>
                </div> 
                <!-- 반응형 1단 끝 -->
                <!-- 반응형 2단 시작-->
                <div class="col-md-6" >
                    <div id="comment-box" class="info-box">
                        <div class="title">이 장소에 대한 이야기들</div>
                        <div onclick="get_more_place_comment()" class="load-more button shadow bg-white padding-15" style="width:245%;">
                            <!-- <span>더 불러오기</span> -->
                            <table>
                            <%for(int i = 0; i<review.size();i++){ 
                            	if(user!=null){
                            if(user.getUserSeqId()==review.get(i).getUserSeqId()){%>
                            <tr>
                            	<td><img class="img" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/<%=review.get(i).getPlaceState() %>" width="30px"></td>
                            	<td><%=review.get(i).getReview() %>
                            	</td> 
                            	<td>
                            		<form action="${pageContext.request.contextPath}/reviewDelete" method="post" name="frm">
	                            		<input type="hidden" name="placeSeq" value="<%=place.getPlaceSeq()%>">
	                            		<input type="hidden" name="reviewSeq" value="<%=review.get(i).getReviewSeq()%>">
	                            		<input type="submit" id="delete_review_btn" value="    "    
	                            		style="background-color: white; border-style: none; background-image: url('${pageContext.request.contextPath}/resources/images/close.png')">
                            		</form>
                            	</td>
                            </tr>
                            <%}
                            }else{%>
                       	 <tr>
                       	<td><img class="img" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/<%=review.get(i).getPlaceState() %>" width="30px"></td>
                       	<td><%=review.get(i).getReview() %></td>
                       	</tr>
                       	<%}
                       }%>
                       </table>
                            	
                            	
                            	
                        </div>
                    </div>
					<!-- 댓글 달기 / 이모티콘 -->
                       <div class="info-box">
                       <!--  <div class="title">직접 의견을 남겨보세요!</div> -->
                          <div class="comment-cards" style="font-size: 17px; width:80%">
                            아래 이모지를 눌러서 의견을 남겨보세요!
                        </div>
                        <div class="emoji-list">
                            <div class="uk-width-1-5">
                                <div id="emoji_1" class="emoji-box bg-white border-radius shadow" data-icon="1-a" data-score="1">
                                    <input id="radio_1"type="radio" name="emoji" class="emoji" value="disappointed-face_1f61e.png" style="display: none">
                                    <label for="radio_1" style="cursor: pointer;"><img id="img1" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/disappointed-face_1f61e.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div id="emoji_2" class="emoji-box bg-white border-radius shadow" data-icon="2-a" data-score="2">
                                    <input id="radio_2" type="radio" name="emoji" class="emoji" value="expressionless-face_1f611.png"style="display: none">
                                    <label for="radio_2" style="cursor: pointer;"><img id="img2" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/expressionless-face_1f611.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div id="emoji_3" class="emoji-box bg-white border-radius shadow" data-icon="3-a" data-score="3">
                                    <input id="radio_3" type="radio"  name="emoji" class="emoji" value="grinning-face-with-smiling-eyes_1f604.png"style="display: none">
                                    <label for="radio_3" style="cursor: pointer;"><img id="img3" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/grinning-face-with-smiling-eyes_1f604.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div id="emoji_4" class="emoji-box bg-white border-radius shadow" data-icon="4-a" data-score="4">
                                    <input id="radio_4" type="radio" name="emoji" class="emoji" value="partying-face_1f973.png" style="display: none;">
                                    <label for="radio_4" style="cursor: pointer;"><img id="img4" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/partying-face_1f973.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div id="emoji_5" class="emoji-box bg-white border-radius shadow" data-icon="5-a" data-score="5">
                                    <input id="radio_5" type="radio" name="emoji" class="emoji" value="face-with-steam-from-nose_1f624.png" style="display: none">
                                    <label for="radio_5" style="cursor: pointer;"><img id="img5" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-steam-from-nose_1f624.png" width="30px"></label>
                                </div>
                            </div>
                            

                            <div class="uk-width-1-6">
                                <div id="emoji_6" class="emoji-box bg-white border-radius shadow" data-icon="1-b" data-score="1">
                                    <input id="radio_6" type="radio" name="emoji" class="emoji" value="pleading-face_1f97a.png" style="display: none">
                                    <label for="radio_6" style="cursor: pointer;"><img id="img6" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/pleading-face_1f97a.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div id="emoji_7" class="emoji-box bg-white border-radius shadow" data-icon="2-b" data-score="2">
                                    <input id="radio_7" type="radio" name="emoji" class="emoji" value="zipper-mouth-face_1f910.png" style="display: none">
                                    <label for="radio_7" style="cursor: pointer;"><img id="img7" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/zipper-mouth-face_1f910.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div id="emoji_8" class="emoji-box bg-white border-radius shadow" data-icon="3-b" data-score="3">
                                     <input id="radio_8" type="radio" name="emoji" class="emoji" value="face-with-rolling-eyes_1f644.png" style="display: none">
                                    <label for="radio_8" style="cursor: pointer;"><img id="img8" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-rolling-eyes_1f644.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div id="emoji_9" class="emoji-box bg-white border-radius shadow" data-icon="4-b" data-score="4">
                                    <input id="radio_9" type="radio" name="emoji" class="emoji" value="kissing-face-with-smiling-eyes_1f619.png" style="display: none">
                                    <label for="radio_9" style="cursor: pointer;"><img id="img9" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/kissing-face-with-smiling-eyes_1f619.png" width="30px"></label>
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div id="emoji_10" class="emoji-box bg-white border-radius shadow" data-icon="5-b" data-score="5">
                                    <input id="radio_10" type="radio" name="emoji" class="emoji" value="smiling-face-with-heart-eyes_1f60d.png" style="display: none">
                                    <label for="radio_10" style="cursor: pointer;"><img id="img10" src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/smiling-face-with-heart-eyes_1f60d.png" width="30px"></label>
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
                               <form action="${pageContext.request.contextPath}/review" method="post" name="frm">
                                   <textarea id="review" class="shadow bg-white" name="review" rows="4" cols="50" placeholder="여기에 의견을 입력해주세요." style="margin-top:30px"></textarea>
                                   <input type="hidden" id="placeSeq" name="placeSeq" value="<%=place.getPlaceSeq()%>">
                                   
                                   <input type="hidden" id="userSeqId" name="userSeqId"<%if(user!=null){%> value="<%=user.getUserSeqId()%><%}%>">
                                   <input type="hidden" id="placeState" name="placeState" value="">
                                   <div class="submit-button disabled button shadow bg-white padding-15" style="width:450px;">
                                       <input type="submit" value="저장하기" style="width: 380px;border-style: none; background-color: white;">
                                   </div>
                                </form>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        	<!-- 카카오 맵으로 자세히 보기 -->
            <div class="uk-modal-footer info-footer">
                <a id="modal_place_info_url" class="go-kakao-btn">
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="button" onclick="location.href='https://place.map.kakao.com/<%=place.getPlaceId()%>'">카카오맵으로 자세히 보기</button>
                      </div>
                </a>
            </div>
            <div class="external-panel">
                <!-- <embed class="kakao-embed" type="text/html" src=""> -->
             <!--    <div class="bg-embed">
                    <div class="close-box">
                        <div class="close">닫기</div>
                    </div>
                    <div class="embed-box"></div>
                </div> -->
            </div>
        </div>
</body>
</html>