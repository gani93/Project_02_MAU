<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="java.util.List"%>

<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%UserVO user = (UserVO)request.getAttribute("user");
    List<MapVO> myFavorite = (List<MapVO>)request.getAttribute("myFavorite");
    List<MapVO> guide = (List<MapVO>)request.getAttribute("guideMap");
    List<MapVO> guider = (List<MapVO>)request.getAttribute("guiderMap");
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
      <div style="margin-top: 50px" align="center">
      		<h2><b>나의 가이드 관리</b></h2>
      </div><br><br>
     
     <div class="row row-cols-2">
	  <div class="col-12 col-md-6" align="center">
	    <h4><b>나의 지도</b></h4>
          	<button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #3384C6; width: 70%; height:120px; margin-top: 20px;"  type="button" onclick="location.href='guiding/guider/<%=user.getUserSeqId() %>'"><%=user.getUserIcon() %> <%=user.getUserNickName() %>님의 지도 (내 장소)<br><%if(user.getUserInform() !=null){ %><%=user.getUserInform()%><%} %></button>
          	<button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #3384C6; width: 70%; height:120px; margin-top: 20px;"  type="button" onclick="location.href='myfavorite'"><%=user.getUserIcon() %> <%=user.getUserNickName() %>님이 좋아하는 장소<br>${sessionScope.plcnt}개의 장소</button><br><br>
          	<button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #3384C6; width: 70%; height:80px; margin-top: 10px;"  type="button" onclick="location.href='#'"><%=user.getUserIcon() %> <%=user.getUserNickName() %>님이 좋아하는 지도<br>${sessionScope.fvcnt}개의 지도</button>
         <%for(int i = 0; i<myFavorite.size();i++){ %>
         <button class="btn btn-primary" style="border-color: #F3B922; border-radius:20px; color: #3384C6;background-color: white; width: 60%; height:60px; margin-top: 10px;"  type="button" <%if(myFavorite.get(i).getMapType()==0){%> onclick="location.href='guiderMap/<%=myFavorite.get(i).getMapSeq()%>'"<%}else{%> onclick="location.href='guideMap/<%=myFavorite.get(i).getMapSeq()%>'"<%} %>><%=myFavorite.get(i).getMapIcon()%> <%=myFavorite.get(i).getMapName()%></button>
      <%} %>
		<br><br><br><br>	
	  </div>
	  	<div class="col-12 col-md-6" align="center">
	    	<h4><b>내가 만든 개인 가이드 지도</b></h4><h6>개인 가이드 지도는 한명의 회원이 지도를 만들어 장소를 공유할 수 있습니다.</h6>
        <%for(int i = 0; i<guider.size();i++){ %>
			<button class="btn btn-primary" style="border-color: #F3B922; border-radius:20px 0 0 20px; color: #3384C6;background-color: white; width: 70%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='guiderMap/<%=guider.get(i).getMapSeq() %>'"><%=guider.get(i).getMapIcon()%> <%=guider.get(i).getMapName()%></button>
			<button class="btn btn-primary" style="margin:0; border-color: #F3B922; border-radius:0 20px 20px 0; color: #3384C6;background-color: white; width: 15%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='mapUpdateForm/<%=guider.get(i).getMapSeq() %>'">✏&nbsp</button>
<%} %><br><br>
		    <h4><b>나의 함께 만드는 가이드 지도</b></h4><h6>단체 가이드 지도는 다 함께 테마별로 지도를 만들어 장소를 공유할 수 있습니다.</h6>
		<%for(int i = 0; i<guide.size();i++){ %>
			<button class="btn btn-primary" style="border-color: #F3B922; border-radius:20px; color: #3384C6;background-color: white; width: 70%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='guideMap/<%=guide.get(i).getMapSeq() %>'"><%=guide.get(i).getMapIcon()%> <%=guide.get(i).getMapName()%></button>
			<%if(guide.get(i).getShareYn()==0){ %>
			<button class="btn btn-primary" style="margin:0; border-color: #F3B922; border-radius:0 20px 20px 0; color: #3384C6;background-color: white; width: 15%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='mapUpdateForm/<%=guider.get(i).getMapSeq() %>'">✏&nbsp</button>
		<%}} %>
		<p style="color:black;width: 80%;">
			<br><b>나만의 개인 가이드 지도를 만들어 장소를 등록하고, 공유해보세요</b><br>
			-하나의 지도에 장소를 마음껏 등록할 수 있습니다.<br>
			-등록된 장소들은 지도 설정 값에 따라 MAU웹사이트에 공유될 수 있습니다.
		</p>
      	<button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #F3B922; width: 70%; height: 60px;"  type="button" onclick="location.href='createGuiderMapForm'">나만의 개인 가이드 지도 만들기</button><br>
      	<p style="color:black;width: 80%;">
			<br><b>함께 만드는 가이드지도는 누구나 만들 수 있습니다.</b><br>
		</p>
      	<button class="btn btn-primary" style="border-style: none; border-radius:20px; color: white;background-color: #F3B922; width: 70%; height: 60px;"  type="button" onclick="location.href='createGuideMapForm'">함께 만드는 가이드 지도 만들기</button><br><br><br><br>
	  	</div>
	</div>
      
</div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>