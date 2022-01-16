<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% UserVO user = (UserVO)session.getAttribute("loginUser"); 
    List<MapVO> AllUsersGuiderMap = (List<MapVO>)request.getAttribute("AllUsersGuiderMap");
    List<MapVO> AllUsersGuideMap = (List<MapVO>)request.getAttribute("AllUsersGuideMap");
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/smypage">나의 가이드 관리</a>
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
      <div style="text-align: center; display: flex; justify-content: center;">
	      <div>
	      <h1>모든 가이더맵(공유O)</h1>
	      <%for(int i=0; i<AllUsersGuiderMap.size();i++){ %>
	      		<button class="btn btn-primary" style="border-color: #F3B922; border-radius:20px 0 0 20px; color: #3384C6;background-color: white; width: 70%; height:60px; margin-top: 10px;"  type="button" onclick="${pageContext.request.contextPath}/guiderMap/<%=AllUsersGuiderMap.get(i).getMapSeq()%>'"><%=AllUsersGuiderMap.get(i).getMapIcon()%> <%=AllUsersGuiderMap.get(i).getMapName()%></button>
				<button class="btn btn-primary" style="margin:0; border-color: #F3B922; border-radius:0 20px 20px 0; color: #3384C6;background-color: white; width: 15%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='mapUpdateForm/<%=AllUsersGuiderMap.get(i).getMapSeq()%>'">✏&nbsp</button><br>
	      <%} %>
	      
	      
	      </div>
	      <div style="margin-left: 150px;">
	      <h1>모든 가이드맵(공유O)</h1>
	      <%for(int i=0; i<AllUsersGuideMap.size();i++){ %>
	      		<button class="btn btn-primary" style="border-color: #F3B922; border-radius:20px 0 0 20px; color: #3384C6;background-color: white; width: 70%; height:60px; margin-top: 10px;"  type="button" onclick="${pageContext.request.contextPath}/guideMap/<%=AllUsersGuideMap.get(i).getMapSeq()%>'"><%=AllUsersGuideMap.get(i).getMapIcon()%> <%=AllUsersGuideMap.get(i).getMapName()%></button>
	      		<button class="btn btn-primary" style="margin:0; border-color: #F3B922; border-radius:0 20px 20px 0; color: #3384C6;background-color: white; width: 15%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='mapUpdateForm/<%=AllUsersGuideMap.get(i).getMapSeq()%>'">✏&nbsp</button><br>
	      <%} %>
	      </div>
      </div>

<!-- index 차트 end -->
   </div>
    <form id="form2" name="form2" action="${pageContext.request.contextPath}/login" method="post" >
      <input type="hidden" name="userId" id="userId" value=""/>
      <input type="hidden" name="userNickName" id="userNickName" value=""/>
   </form>
  </body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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