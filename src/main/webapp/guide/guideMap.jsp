<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="com.spring.mau.user.UserVO"%>
<%@page import="com.spring.mau.mapfavorite.MapFavoriteVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MapViewVO> placeList = (List<MapViewVO>)request.getAttribute("placeList");
    MapVO favorite = (MapVO)request.getAttribute("mapFavorite");
    MapFavoriteVO chk = (MapFavoriteVO)request.getAttribute("chk");
    int mapSeq= (int)request.getAttribute("mapSeq");
    UserVO user = (UserVO)session.getAttribute("loginUser");
    MapVO placegetMap = (MapVO)request.getAttribute("placegetMap");
%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
<title>MAU</title>
    <link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/image/logo/mauicon.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <style>/* (가이더지도) */
.customoverlay {position:relative;bottom:-20px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a:nth-of-type(2) {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:800px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
.map_leftb {position:absolute;bottom:0;left:0;width:250px;margin:10px 0 30px 30px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;}
.map_rightb {position:absolute;bottom:0;right:0;width:250px;margin:10px 30px 10px 10px;padding:5px;overflow-y:auto;z-index: 1;border-radius: 10px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
input[type="checkbox"]+label {
    display: block;
    width: 50px;
    height: 50px;
    background: url(${pageContext.request.contextPath}/image/favoriteCheck/heart_off.png) no-repeat 0 0px / contain;
}

input[type='checkbox']:checked+label {
    background: url(${pageContext.request.contextPath}/image/favoriteCheck/heart_on.png) no-repeat 0 0px / contain;
}

input[type="checkbox"] {
    display: none;
}
.card div{
background: #FEFFED;
border-radius: 5px;
}
.card:hover div{
color: white;
background: #3384C6;
}
</style>

  </head>
  <body>
  <div class="p-3 mb-2 " style="float: none; margin:100 auto; color: #3384C6; background-color:  #FEFFED;" >
    <!-- Optional JavaScript; choose one of the two! -->
    <nav class="navbar navbar-light" color: #3384C6; style="background-color:  #FEFFED;">
        <div class="container-fluid">
          <a style="font-family: 'Rajdhani', sans-serif;" class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/image/logo/mau.png" alt="mau" height="50px"></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
              <h5 style="font-family: 'Rajdhani', sans-serif;" class="offcanvas-title" id="offcanvasNavbarLabel">Me And U<BR>
            MAU</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <c:choose>
      <c:when test="${empty sessionScope.loginUser}">   
            <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">홈으로</a>
                </li>
                <li class="nav-item">
               <a class="nav-link" href="javascript:kakaoLogin();">로그인</a>
              </ul>
            </div>
      </c:when>
      <c:otherwise>
         <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">홈으로</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="#">${sessionScope.loginUser.userNickName}(No.${sessionScope.loginUser.userSeqId})님 환영합니다.</a>
                  </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/mypage">나의 가이드 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/updateform?userSeqId=${sessionScope.loginUser.userSeqId}">내 정보 변경</a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                  </li>
                  <%if(user.getAdminNum()==1){ %>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminForm">관리자페이지</a>
                  </li>
                  <%} %>
              </ul>
            </div>
      </c:otherwise>
   </c:choose>
          </div>
        </div>
      </nav>
   
  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
<!-- map start -->
    <div class="map_wrap">
    <div id="map" style="width:100%;height:800px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" >
<!-- 지도이름 -->
<div>
<button class="btn btn-primary"  style="border-radius:20px; font-size : 15px; border-style: none; color: black;background-color: #F3B922; width: 100%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='/mau/guideMap/<%=mapSeq %>'"><%=placegetMap.getMapIcon()%> <%=placegetMap.getMapName()%></button><br><br>
</div>
<!-- 지도즐겨찾기 -->
   	<div style="display: flex;">
   		<!-- <h1 style="font-size: 3em;">찜하기</h1> -->
   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="myCheck" name="myCheck"<%if(chk!=null){ %>checked<%} %>>
		<label for="myCheck"></label>
    </div>
    </div><!-- menu_wrap end -->
<!-- 내위치 -->
<div class="map_leftb">
	<div class="" onclick="geolocation()"> 
		<img id="mapbutton" src="../image/map/mylocation.png" alt="현재위치" height="50px">
	</div><br>
<!-- 지도공유 -->
	<div class="share-box">
	   <div class="share-btn link" onclick="copy_url()">
			<img id="mapbutton" src="../image/map/share.png" alt="지도공유" height="50px">
			<input type="hidden" name="url" id="SharePlaceUrl" value="http://localhost:8181/mau/guideMap/<%=mapSeq%>">
	   </div>
	</div>
</div><!-- map_leftb end -->
<!-- 장소 검색창(키워드) -->
<%if(user!=null){
if(user.getUserSeqId()==placegetMap.getUserSeqId()){%>
<div class = "map_rightb">
<form method="post" action="${pageContext.request.contextPath}/guideMap/search/${mapSeq}">
	<div class="input-group mb-3">
				<input type="text" class="form-control rounded" autocomplete="off" name="keyword" placeholder="여기에서 장소를 검색하고 등록!"  aria-label="Recipient's username" aria-describedby="basic-addon2">
				<button class="btn btn-outline-secondary"  id="mapbutton"><img id="mapbutton" src="../image/map/search.png" alt="장소찾기" height="50px"></button>
		</div>
		</form>
	</div><!-- map_rightb end -->
     <%}} %>
</div><!-- map_wrap end -->
</div>
<%for(int i = 0; i< placeList.size();i++){%>
<input type="hidden" name ="placeName" value ="<%=placeList.get(i).getPlaceName().toString() %>"><%-- <%=placeList.get(i).getPlaceName() %> </input>--%>
<input type="hidden" name ="SouthWest" value ="<%=placeList.get(i).getPlaceSouthWest() %>">
<input type="hidden" name ="NorthEast" value ="<%=placeList.get(i).getPlaceNorthEast() %>">
<input type="hidden" name ="userSeqId" value ="<%=placeList.get(i).getUserSeqId() %>"><!-- (가이드지도) -->
<input type="hidden" name ="userIcon" value ="<%=placeList.get(i).getUserIcon() %>">
<input type="hidden" name ="placeSeq" value ="<%=placeList.get(i).getPlaceSeq() %>">
<%} %>
<%if(user!=null) {%>
<form method="get" id="mapFavorite">
<input type="hidden" name="mapSeq" value="<%=favorite.getMapSeq()%>">
<input type="hidden" name="userSeqId" value="<%=favorite.getUserSeqId()%>">
</form>
<%} %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e31943b9bfc138a7aaae61fa825c403c"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

$('input:checkbox[name=myCheck]').on('click',function(){
	var chk = $(this).is(":checked");
	if(chk){
		$('#mapFavorite').attr('action','${pageContext.request.contextPath}/insertMap1Favorite');
		$('#mapFavorite').submit();
	}else{
		$('#mapFavorite').attr('action','${pageContext.request.contextPath}/deleteMap1Favorite');
		$('#mapFavorite').submit();
	}
});


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
center: new kakao.maps.LatLng(37.51822, 126.90471), // 지도의 중심좌표
level: 8 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var cnt =$("input[name=SouthWest]").length;
var south = new Array(cnt);
var east = new Array(cnt);
var name;
var userSeqId;//(가이드지도)
var userIcon;
var placeSeq;
var seq=[];
var positions=[];
var points=[];
for(var i=0;i<cnt;i++){
south[i]=$("input[name=SouthWest]").eq(i).val();
east[i]=$("input[name=NorthEast]").eq(i).val();
name=($("input[name=placeName]").eq(i).val());
placeSeq=($("input[name=placeSeq]").eq(i).val());
userSeqId=($("input[name=userSeqId]").eq(i).val());//(가이드지도)
userIcon=($("input[name=userIcon]").eq(i).val());
console.log(east[i]);
console.log(name);
positions.push({
	content:'<div class="customoverlay"><a href="${pageContext.request.contextPath}/guiding/guider/'+userSeqId+'" >' + userIcon + '</a>   <a href="#none" target="_blank" onclick="openPop(' + placeSeq + ')"><span class="title">' + name + '</span></a></div>',
	latlng: new kakao.maps.LatLng(south[i],east[i])
});
points.push(positions[i].latlng);//마커들을 기점으로 다시 지도의 중심좌표 설정으로 인한 코드
}

var bounds = new kakao.maps.LatLngBounds();

function setBounds(){
	map.setBounds(bounds);
}

console.log(positions);
if(points!=null){
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
        
    });
    bounds.extend(points[i]);
    console.log(marker);
	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    position: positions[i].latlng,
	    content: positions[i].content,
	    xAnchor: 0.5,
	    yAnchor: 2.1
	});

	customOverlay.setMap(map, marker);  
	map.setBounds(bounds);
}

}else{
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    seq = positions[i].seq;
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	    bounds.extend(points[i]);
		console.log(marker);
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
}
}
// 현재 위치 버튼을 누르면 현지 위치로 중심을 바꾸고 지도를 확대하는 함수입니다
function geolocation() {

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			
			var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
			
			var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			
			// 마커를 표시합니다
			displayMarker(locPosition);

		});
		
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
		alert('현재 위치를 알 수 없어요 😨')
			
	}
}

// 지도에 현재 위치 마커를 표시하고 지도를 확대하는 함수입니다
function displayMarker(locPosition) {

	var locimageSrc = '../../static/img/icon-mylocation.svg', // 마커이미지의 주소입니다    
	locimageSize = new kakao.maps.Size(16, 16), // 마커이미지의 크기입니다
	locimageOption = {offset: new kakao.maps.Point(8, 8)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var locmarkerImage = new kakao.maps.MarkerImage(locimageSrc, locimageSize, locimageOption);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({  
		map: map, 
		position: locPosition,
		image: locmarkerImage // 마커이미지 설정 
	}); 

	// 지도 중심좌표를 접속위치로 변경하고 맵 크기를 조정합니다
	map.setCenter(locPosition);   
	map.setLevel(5);   
}    
//장소 url 공유
function copy_url() {
	var copy_url = jQuery('#SharePlaceUrl').val();
	navigator.clipboard.writeText(copy_url).then(() => { 
		alert('URL이 복사되었습니다.'); return false; });
	}
//장소 팝업 띄우기
function openPop(placeSeq){
	/* alert(placeSeq); */
	var popup = window.open('${pageContext.request.contextPath}/detailInfo/' + placeSeq + '', '장소팝업', 'width=1000px,height=1000px,scrollbars=yes');
}
</script>
  </body>
</html>