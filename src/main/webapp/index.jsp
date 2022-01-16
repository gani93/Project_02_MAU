<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% %>
    <% UserVO user=(UserVO)session.getAttribute("loginUser"); %>
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
        <style>
    /* 인디케이터*/
body, ul, li, h1 {
    margin:0;
    padding:0;
    list-style:none;
}

/* .page {
    height:30vh;
    box-sizing:border-box;
}

.page-2 {
    height:80vh;
}

.page-3 {
    height:80vh;
}

.page-4 {
    height:80vh;
}

.page-5 {
    height:80vh;
}

.page-6 {
    height:80vh;
} */

.page-indicator > ul > li > a {
text-decoration: none;
color:black;  
}


.page-indicator {
    position:fixed;
    top:50%;
    right:20px;
    transform:translateY(-50%);
    padding:10px;
    background-color: #FEFFED;
    opacity:0.5;
    transition:transform 0.3s;
    border-radius:20%;
}

.page-indicator > ul > li.active {
    background-color:#F3B922;
    font-size: 110%;
    font-weight: bold;
    color:white;
}

html[data-current-page-index="0"] .page-indicator {
    transform:translateY(0);
}
    </style>
  </head>
  <body>
  <div class="p-3 mb-2 " style="float: none; margin:100 auto; color: #000000; background-color:  #FEFFED;" >
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
      <div style="margin-top: 58px; text-align : center;"><h1>당신만의 장소를 공유하세요</h1><br></div>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    
 <!--guide map carousel start-->
 <div id="carouselExampleInterval" class="carousel slided" data-bs-ride="carousel">
    <div class="carousel-inner">
		<div class="carousel-item active text-center" style="color:#3384C6;" data-bs-interval="2000">
		<c:forEach items="${randomGuide}" var="randomGuide" begin="0" end="0" step="1">
				 <div class="col" onclick="location.href='guideMap/'+${randomGuide.mapSeq}">
			   	 	<p class="card-img-top" style="font-size:30px">${randomGuide.mapIcon}</p>
			        <div class="card-body">
			        <h5 class="card-title"><b>${randomGuide.mapName}</b></h5>
			        <p class="card-text">${randomGuide.placeCnt} 개의 장소</p>
	     			</div>
	  			 </div>
			</c:forEach>
		</div>
		<div class="carousel-item text-center" style="color:#3384C6;" data-bs-interval="2000">
		<c:forEach items="${randomGuide}" var="randomGuide" begin="1" end="1" step="1">
				 <div class="col" onclick="location.href='guideMap/'+${randomGuide.mapSeq}">
			   	 	<p class="card-img-top" style="font-size:30px">${randomGuide.mapIcon}</p>
			        <div class="card-body">
			        <h5 class="card-title"><b>${randomGuide.mapName}</b></h5>
			        <p class="card-text">${randomGuide.placeCnt} 개의 장소</p>
	     			</div>
	  			 </div>
			</c:forEach>
		</div>
		<div class="carousel-item text-center" style="color:#3384C6;" data-bs-interval="2000">
		<c:forEach items="${randomGuide}" var="randomGuide" begin="2" end="2" step="1">
				 <div class="col" onclick="location.href='guideMap/'+${randomGuide.mapSeq}">
			   	 	<p class="card-img-top" style="font-size:30px">${randomGuide.mapIcon}</p>
			        <div class="card-body">
			        <h5 class="card-title"><b>${randomGuide.mapName}</b></h5>
			        <p class="card-text">${randomGuide.placeCnt} 개의 장소</p>
	     			</div>
	  			 </div>
			</c:forEach>
		</div>
		<div class="carousel-item text-center" style="color:#3384C6;" data-bs-interval="2000">
		<c:forEach items="${randomGuide}" var="randomGuide" begin="3" end="3" step="1">
				 <div class="col" onclick="location.href='guideMap/'+${randomGuide.mapSeq}">
			   	 	<p class="card-img-top" style="font-size:30px">${randomGuide.mapIcon}</p>
			        <div class="card-body">
			        <h5 class="card-title"><b>${randomGuide.mapName}</b></h5>
			        <p class="card-text">${randomGuide.placeCnt} 개의 장소</p>
	     			</div>
	  			 </div>
			</c:forEach>
		</div>
		<div class="carousel-item text-center" style="color:#3384C6;" data-bs-interval="2000">
		<c:forEach items="${randomGuide}" var="randomGuide" begin="4" end="4" step="1">
				 <div class="col" onclick="location.href='guideMap/'+${randomGuide.mapSeq}">
			   	 	<p class="card-img-top" style="font-size:30px">${randomGuide.mapIcon}</p>
			        <div class="card-body">
			        <h5 class="card-title"><b>${randomGuide.mapName}</b></h5>
			        <p class="card-text">${randomGuide.placeCnt} 개의 장소</p>
	     			</div>
	  			 </div>
			</c:forEach>
		</div>
   </div>
   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
</div> 
<!--guide map carousel end-->
<!--guide map search start-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<div class="container">
    <br/>
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
								<form class="card card-sm" action="${pageContext.request.contextPath}/search" method="post">                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" name="search"type="search" placeholder="지도를 검색하세요.">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->
                    </div>
</div>
<div class="pages">
<div class="page page-1" id="page-1">
<!--card start 열혈가이더 넣을 예정-->
<%@include file="/index/hotuserMap.jsp"%>
</div>
<!--card end-->
<!--지도에서 장소찾기start-->
<div class="container"><br>
  <div class="row">
    <div class="col text-center">
      <button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #F3B922; width:70%; height: 60px;"  type="button" onclick="location.href='/mau/here?lat=37.566826&lng=126.9786567&retry=true'">지도에서 장소 찾기</button>
    </div>
  </div>
</div>
<!--지도에서 장소찾기 end-->
<!-- index 차트 start -->
<div class="page page-2" id="page-2">
<%@include file="/index/randomMap.jsp"%>
</div>
<div class="page page-3" id="page-3">
<%@include file="/index/newestMap.jsp"%>
</div>
<div class="page page-4" id="page-4">
<%@include file="/index/favoriteMap.jsp"%>
</div>
<div class="page page-5" id="page-5">
<%@include file="/index/favoritePlace.jsp"%>
</div>
<div class="page page-6" id="page-6">
<%@include file="/index/favoriteGuide.jsp"%>
</div>
<div class="page page-7" id="page-7">
<%@include file="/index/randomGuide.jsp"%>
</div>
</div>
<!-- index 차트 end -->
   </div>
    <form id="form2" name="form2" action="${pageContext.request.contextPath}/login" method="post" >
      <input type="hidden" name="userId" id="userId" value=""/>
      <input type="hidden" name="userNickName" id="userNickName" value=""/>
   </form>
  </body>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: 'http://localhost:8181/mau/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          /* alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']); */
          
          $("#userId").val(data['email']);
          $("#userNickName").val(data['nickname']);
          $("#form2").submit();
      }
  });  

  </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 인디게이터 -->
<div class="page-indicator">
    <ul>
        <li><a href="#page-1">&nbsp&nbsp&nbsp&nbsp열혈 회원&nbsp&nbsp&nbsp&nbsp</a></li>
        <li><a href="#page-2">개인 가이드 (추천)</a></li>
        <li><a href="#page-3">단체 가이드 (최신)</a></li>
        <li><a href="#page-4">개인 가이드 (인기)</a></li>
        <li><a href="#page-5">요즘 사랑받는 장소</a></li>
        <li><a href="#page-6">단체 가이드 (인기)</a></li>
        <li><a href="#page-7">단체 가이드 (추천)</a></li>
    </ul>
</div>
<!-- 인디게이터js -->
<script>
$('.page-indicator > ul > li > a').click(function(e) {
    var href = $(this).attr('href');
    
    var targetTop = $(href).offset().top;
    
    /*
    // 한번에 가도록 하는 방법
    $(window).scrollTop(targetTop);
    */
    
    $('html').stop().animate({scrollTop:targetTop}, 300);
    
    e.preventDefault();
});

function Page__updateIndicatorActive() {
    var scrollTop = $(window).scrollTop();
    
    // 역순으로 검색해야 편하다
    $($('.page').get().reverse()).each(function(index, node) {
        var $node = $(this);
        var offsetTop = parseInt($node.attr('data-offset-top'));
        
        if ( scrollTop >= offsetTop ) {
            // 기존 녀석에게 활성화 풀고
            $('.page-indicator > ul > li.active').removeClass('active');
            // 해당하는 녀석에게 활성화 넣고
            
            var currentPageIndex = $node.index();
            $('.page-indicator > ul > li').eq(currentPageIndex).addClass('active');
            
            $('html').attr('data-current-page-index', currentPageIndex);
            
            return false; // 더 이상 다른 페이지를 검사하지 않는다.
        }
    });
}

// 각 페이지의 offsetTop 속성을 업데이트
function Page__updateOffsetTop() {
    
    $('.page').each(function(index, node) {
        var $page = $(node);
        var offsetTop = $page.offset().top;
        
        $page.attr('data-offset-top', offsetTop);
    });
    
    // 계산이 바뀌었으니까, 다시 상태 업데이트
    Page__updateIndicatorActive();
}

function Page__init() {
    Page__updateOffsetTop();
}

// 초기화
Page__init();

// 화면이 리사이즈 할 때 마다, offsetTop을 다시계산
$(window).resize(Page__updateOffsetTop);

// 스크롤이 될 때 마다, 인디케이터의 상태를 갱신
$(window).scroll(Page__updateIndicatorActive);
</script>
</html>