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
   <!-- ????????? ?????? ?????? -->
    <!-- Kakao API -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
   //???????????? url ????????????
   function kakao() { 
    // // ????????? ?????? JavaScript ?????? ????????? ?????????.
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
          mobileWebUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%> // ?????? ????????? ????????? url ????????? ??????
        }
      },
      buttons: [
        {
          title: 'MAU?????? ????????? ???????????? ???????????????!',
          link: {
            mobileWebUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%> , //?????? ????????? ????????? url ????????? ??????
            webUrl: "http://localhost:8181/mau/detailInfo/"+<%=place.getPlaceSeq()%>
          }
        }  
      ]
    });
}
   //????????? ?????????, ????????? ??????
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
	//?????? url ??????
	function copy_url() {
		var copy_url = jQuery('#SharePlaceUrl').val();
		navigator.clipboard.writeText(copy_url).then(() => { 
			alert('URL??? ?????????????????????.'); return false; });
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
         		<div><!-- ?????? ???????????? -->
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
                 <!-- ?????? ????????? -->
                <div class="img-box">
                    <div class="img_upload_box" style="width:950px">
                        <img src="" class="img_upload">
                        <%if(photo==null){ %>
                        <div class="size">????????? ????????? ????????? ??????????????? <br> ???????????? ??? ???????????? ??? ?????????!
                    		<form action="${pageContext.request.contextPath}/uploadImg/<%=place.getPlaceSeq()%>" method="post" enctype="multipart/form-data">
								<input type="file" name="photoUpload"/>
								<input type="submit" value="?????????" style=" width:200px;">
							 </form><br>
                        </div>
                        <%} else {%>
                         <div class="size">????????? ????????? ????????? ??????????????? <br> ???????????? ??? ???????????? ??? ?????????!
                    		<form action="${pageContext.request.contextPath}/uploadImg/<%=place.getPlaceSeq()%>" method="post" enctype="multipart/form-data">
								<div id="img_input">
										<input type="file" name="photoUpload" style="position: relative; left: 40px; padding-top: 20px; padding-bottom: 10px"/>
										<input type="submit" value="?????????" style=" width:200px;">
								</div>
							 </form>
                        </div>
                          <!-- ?????? ?????? ?????? -->
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
                            <div class="title">????????? ?????? ?????????????</div>
                            <!-- ?????? ??????????????? -->
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
               		<!--  ???????????? ?????? -->
                    <div class="info-box">
                        <div class="title">????????? ??????????</div>
                        <a id="static_map">
                            <div id="info-map" class="map-box border-radius shadow">
                            <div id="map" style="width:100%; height:230px;"></div>
                            <input type="hidden" name ="SouthWest" value ="<%=place.getPlaceSouthWest() %>">
                     		<input type="hidden" name ="NorthEast" value ="<%=place.getPlaceNorthEast() %>">
                     <!-- <p><em>????????? ??????????????????!</em></p>  -->
                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51c537c4b3603a65b8ba8a854278340e"></script>
                     <script>
	                     var south= $("input[name=SouthWest]").val();
	                     var east= $("input[name=NorthEast]").val();
	                     console.log(south);
	                     console.log(east); 
	                     
	                     var mapContainer = document.getElementById('map'), // ????????? ????????? div 
	                         mapOption = { 
	                             center: new kakao.maps.LatLng(south,east), // ????????? ????????????
	                             level: 3 // ????????? ?????? ??????
	                         };
	                     
	                     var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????
	                       
	                     // ????????? ????????? ??????????????? 
	                     var position =  new kakao.maps.LatLng(south,east);
	                     
	                     
	                     // ????????? ???????????????
	                     var marker = new kakao.maps.Marker({
	                       position: position,
	                       clickable: true // ????????? ???????????? ??? ????????? ?????? ???????????? ???????????? ????????? ???????????????
	                     });
	                     
	                     // ?????? ????????? ?????? ????????? ???????????? ???????????? clickable: true ??? ??????
	                     // ????????? ???????????? ??? ????????? ?????? ???????????? ???????????? ????????? ???????????????
	                     // marker.setClickable(true);
	                     
	                     // ????????? ????????? ???????????????.
	                     marker.setMap(map);
	                     
	                     // ????????? ???????????? ??? ?????? ?????? ????????? ?????????????????? ???????????????
	                     var iwContent = '<div style="padding:5px;"><%=place.getPlaceName()%></div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
	                         iwRemoveable = true; // removeable ????????? ture ??? ???????????? ?????????????????? ?????? ??? ?????? x????????? ???????????????
	                     
	                     // ?????????????????? ???????????????
	                     var infowindow = new kakao.maps.InfoWindow({
	                         content : iwContent,
	                         removable : iwRemoveable
	                     });
	                     
	                     // ????????? ?????????????????? ???????????????
	                     kakao.maps.event.addListener(marker, 'click', function() {
	                           // ?????? ?????? ?????????????????? ???????????????
	                           infowindow.open(map, marker);  
	                           location.href="https://map.kakao.com/?itemId="+<%=place.getPlaceId()%> //????????? url ??????
	                     });
                     </script>
                           </div>
                        </a>
                    </div>
                    <!--  ?????? url ?????? -->
                    <div class="info-box" style="position: relative; bottom: 80px;">
                      <div class="title_2">??? ?????? ????????????</div>
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
                <!-- ????????? 1??? ??? -->
                <!-- ????????? 2??? ??????-->
                <div class="col-md-6" >
                    <div id="comment-box" class="info-box">
                        <div class="title">??? ????????? ?????? ????????????</div>
                        <div onclick="get_more_place_comment()" class="load-more button shadow bg-white padding-15" style="width:245%;">
                            <!-- <span>??? ????????????</span> -->
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
					<!-- ?????? ?????? / ???????????? -->
                       <div class="info-box">
                       <!--  <div class="title">?????? ????????? ???????????????!</div> -->
                          <div class="comment-cards" style="font-size: 17px; width:80%">
                            ?????? ???????????? ????????? ????????? ???????????????!
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
                               <div class="text">??????</div>
                               <div class="text">???..?</div>
                               <div class="text">????????????</div>
                               <div class="text">????????????!</div>
                               <div class="text">????????????!!</div>
                            </div>
                        </div>
                	</div>
               		<!-- ????????? 2??? ??? -->
                			<!-- ???????????? -->
                            <div id="inputbox" style="display: none;">
                               <form action="${pageContext.request.contextPath}/review" method="post" name="frm">
                                   <textarea id="review" class="shadow bg-white" name="review" rows="4" cols="50" placeholder="????????? ????????? ??????????????????." style="margin-top:30px"></textarea>
                                   <input type="hidden" id="placeSeq" name="placeSeq" value="<%=place.getPlaceSeq()%>">
                                   
                                   <input type="hidden" id="userSeqId" name="userSeqId"<%if(user!=null){%> value="<%=user.getUserSeqId()%><%}%>">
                                   <input type="hidden" id="placeState" name="placeState" value="">
                                   <div class="submit-button disabled button shadow bg-white padding-15" style="width:450px;">
                                       <input type="submit" value="????????????" style="width: 380px;border-style: none; background-color: white;">
                                   </div>
                                </form>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        	<!-- ????????? ????????? ????????? ?????? -->
            <div class="uk-modal-footer info-footer">
                <a id="modal_place_info_url" class="go-kakao-btn">
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="button" onclick="location.href='https://place.map.kakao.com/<%=place.getPlaceId()%>'">?????????????????? ????????? ??????</button>
                      </div>
                </a>
            </div>
            <div class="external-panel">
                <!-- <embed class="kakao-embed" type="text/html" src=""> -->
             <!--    <div class="bg-embed">
                    <div class="close-box">
                        <div class="close">??????</div>
                    </div>
                    <div class="embed-box"></div>
                </div> -->
            </div>
        </div>
</body>
</html>