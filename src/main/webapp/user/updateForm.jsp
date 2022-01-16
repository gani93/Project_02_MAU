<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    	UserVO user = (UserVO)session.getAttribute("loginUser");
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
              </ul>
            </div>
      </c:otherwise>
   </c:choose>
          </div>
        </div>
      </nav>
      <form action="${pageContext.request.contextPath}/update" method="post" name="frm" style="text-align: center;">
	      <div class="mb-3" align="center">
	      <h1>회원 정보 수정</h1><br>
	      
	  <label for="formGroupExampleInput" class="form-label"><b>아이디</b></label>
	  <input value="${userInfo.userId}" style="width: 300px; border-radius: 50px; text-align:center;" type="text" class="form-control" name="userId"id="formGroupExampleInput" readonly="readonly">
	</div><br>
	🔔 카카오 간편 로그인 된 아이디(메일주소)입니다.<br>
	😷 수정이 불가합니다.<br><br><br>
	
<%-- 	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput2" class="form-label"><b>회원번호</b></label>
	  <input value="${userInfo.userSeqId}"  style="width: 300px; border-radius: 50px; text-align:center;" type="text" class="form-control" name="userSeqId" id="formGroupExampleInput2" readonly="readonly">
	</div><br> --%>
	
    <div class="mb-3" align="center">
	  <label for="formGroupExampleInput3" class="form-label"><b>닉네임</b></label>
	  <input value="${userInfo.userNickName}"  style="width: 300px; border-radius: 50px; text-align:center;" type="text" class="form-control" name="userNickName" id="formGroupExampleInput3" readonly="readonly">
	</div><br>
	🔔 카카오 간편 로그인 된 닉네임(이름)입니다.<br>
	😷 수정이 불가합니다.<br><br><br>
	
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput4" class="form-label"><b>메유콘</b></label>
	  <input  style="width: 300px; border-radius: 50px; text-align:center;" type="text" class="form-control" name="userIcon" size="40" id="formGroupExampleInput4" placeholder="입력칸에 우클릭으로 이모지를 선택하세요" value="${userInfo.userIcon}"required>
	</div><br>
	
	🔔 메유콘은 MAU만의 아이콘이름입니다.<br>
	<br><br><br>
 	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput5" class="form-label"><b>내 소개 (선택)</b></label>
	  <input style="width: 70%; border-radius: 50px; text-align:center;" type="text" class="form-control" name="userInform" id="formGroupExampleInput5" placeholder="자기 소개를 입력해주세요." value="${userInfo.userInform}">
	</div><br><br>
 
	<%-- <%if(user.getAdminNum()==0){ %>
			<input type="hidden" name = "mapType" value=0>
			<%}else{ %>
			<input type="hidden" name = "mapType" value=1>
			<%} %>--%>
			<input type="hidden" name="userSeqId" value="<%=user.getUserSeqId() %>"> 
			<input type="reset" value="취소" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/index'">&nbsp;&nbsp;
			<input type="submit" value="변경" class="btn btn-outline-danger"><br><br><br><br>
			<br><br><br>
			<br><br><br>
			<br><br><br>
			<br><br><br>
</form>
      <div>
      
  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</div>

	
  </body>
</html>