<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<MapVO> map = (List<MapVO>)request.getAttribute("searchMap");
%>
<% response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1")) 
	response.setHeader("Cache-Control", "no-cache");%>
<!DOCTYPE html>
<html>
  <head>
  <style>
  .topchart button{
			  background:#fff;
			  color:#8C8C8C;
			  border:none;
			  position:relative;
			  height:40px;
			  font-size:1.2em;
			  font-weight:bold;
			  padding:0 5px;
			  cursor:pointer;
			  transition:800ms ease all;
			  outline:none;
			}
			.topchart button:hover{
			  background:#000000;
			  color:#fff;
			}
			.topchart button:before,button:after{
			  content:'';
			  position:absolute;
			  top:0;
			  right:0;
			  height:2px;
			  width:0;
			  background: #fff;
			  transition:400ms ease all;
			}
			.topchart button:after{
			  right:inherit;
			  top:inherit;
			  left:0;
			  bottom:0;
			}
			.topchart button:hover:before,button:hover:after{
			  width:100%;
			  transition:800ms ease all;
			}
  </style>
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
                    <a class="nav-link" href="mypage">나의 가이드 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/updateform?userSeqId=${sessionScope.loginUser.userSeqId}">내 정보 변경</a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                  </li>
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
<br>
<div class="topchart">
		<c:choose>
		<c:when test="${empty searchList}">
			<span style="font-size:30px; font-weight:bold;">검색결과가 없습니다</span>
			<span style="font-size:25px; font-weight:bold; color:#4C4C4C;"></span>
			&nbsp;&nbsp;&nbsp;<br>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/전체/${sessionScope.search}'">전체</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/음식점/${sessionScope.search}'">음식점</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/편의점/${sessionScope.search}'">편의점</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/학교/${sessionScope.search}'">학교</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/까페/${sessionScope.search}'">까페</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/대형마트/${sessionScope.search}'">대형마트</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/보육시설/${sessionScope.search}'">보육시설</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/학원/${sessionScope.search}'">학원</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/주차장/${sessionScope.search}'">주차장</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/주유소/${sessionScope.search}'">주유소</button><br>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/지하철역/${sessionScope.search}'">지하철역</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/은행/${sessionScope.search}'">은행</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/문화시설/${sessionScope.search}'">문화시설</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/중개업소/${sessionScope.search}'">중개업소</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/공공기관/${sessionScope.search}'">공공기관</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/관광명소/${sessionScope.search}'">관광명소</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/숙박/${sessionScope.search}'">숙박</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/병원/${sessionScope.search}'">병원</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/약국/${sessionScope.search}'">약국</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/동네/${sessionScope.search}'">동네</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/기타/${sessionScope.search}'">기타</button>
		</c:when>
		<c:otherwise>
			<span style="font-size:30px; font-weight:bold;">"${sessionScope.search}"검색 결과</span>
			<span style="font-size:25px; font-weight:bold; color:#4C4C4C;">(${sessionScope.kategory})</span>
			<c:forEach items="${searchMap}" var="searchMap" begin="0" end="0" step="1">
			&nbsp;&nbsp;&nbsp;<br>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/전체/${searchMap.search}'">전체</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/음식점/${searchMap.search}'">음식점</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/편의점/${searchMap.search}'">편의점</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/학교/${searchMap.search}'">학교</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/까페/${searchMap.search}'">까페</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/대형마트/${searchMap.search}'">대형마트</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/보육시설/${searchMap.search}'">보육시설</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/학원/${searchMap.search}'">학원</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/주차장/${searchMap.search}'">주차장</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/주유소/${searchMap.search}'">주유소</button><br>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/지하철역/${searchMap.search}'">지하철역</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/은행/${searchMap.search}'">은행</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/문화시설/${searchMap.search}'">문화시설</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/중개업소/${searchMap.search}'">중개업소</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/공공기관/${searchMap.search}'">공공기관</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/관광명소/${searchMap.search}'">관광명소</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/숙박/${searchMap.search}'">숙박</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/병원/${searchMap.search}'">병원</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/약국/${searchMap.search}'">약국</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/동네/${searchMap.search}'">동네</button>
			<button onclick="location.href='${pageContext.request.contextPath}/searchCategory/기타/${searchMap.search}'">기타</button>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

<!--guide map search start-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<div class="container">
    <br/>
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <form class="card card-sm" action="${pageContext.request.contextPath}/search" method="post">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="search" name="search" placeholder="지도를 검색하세요.">
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

       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <div style="margin-top: 58px; text-align : center;" style="color: #000000;">
    <h2><b style="color: #000000;">함께 만드는 지도</b></h2><br></div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${searchGuide2}" var="searchGuide">
	    <div class="col" onclick="location.href='${pageContext.request.contextPath}/guideMap/'+${searchGuide.mapSeq}">
	     <div class="card bg-white p-3 mb-4 shadow text-center">
	    	<p class="card-img-top" style="font-size:30px">${searchGuide.mapIcon}</p>
	      <div class="card-body">
	        <h5 class="card-title"><b>${searchGuide.mapName}</b></h5>
 			<p class="card-text">${searchGuide.placeCnt} 개의 장소</p>
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>
	
	<div style="margin-top: 58px; text-align : center;" style="color: #000000;">
	<h2><b style="color: #000000;">개인이 만드는 지도</b></h2><br></div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${searchGuider2}" var="searchGuider">
	    <div class="col" onclick="location.href='${pageContext.request.contextPath}/guiderMap/'+${searchGuider.mapSeq}">
	     <div class="card bg-white p-3 mb-4 shadow text-center">
	    	<p class="card-img-top" style="font-size:30px">${searchGuider.mapIcon}</p>
	      <div class="card-body">
	        <h5 class="card-title"><b>${searchGuider.mapName}</b></h5>
 			<p class="card-text">${searchGuider.placeCnt} 개의 장소</p>
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>
	
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



</html>