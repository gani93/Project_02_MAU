<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <form action="createGuideMap" method="post" style="text-align: center;">
	      <div class="mb-3" align="center">
	      <h1>가이드지도 만들기</h1><br>
	      
	  <label for="formGroupExampleInput" class="form-label"><b>가이드 주제</b></label>
	  <input style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="mapName"id="formGroupExampleInput" placeholder="가이드지도의 이름을 지어주세요!" required>
	</div><br>
	<div class="help">
					<dl>
						<dt>
							<span class="emoji">🙆</span>
							<span>구체적인 특징이나 상황이 들어간 테마명을 주제로 추천합니다.</span>
							
						</dt>
						<dd>- 예: 2~3명이 술 마시며 이야기하기 좋은 곳</dd>
						<dd>- 예: 하루종일 있어도 눈치 보이지 않는 카페</dd>
						<dt>
							<span class="emoji">🙅</span>
							<span>다음의 경우 테마가 임의 삭제될 수 있습니다.</span>
							
						</dt>
						<dd>- 너무 간단한 이름 (예: 맛집, 이쁜카페)</dd>
						<dd>- 다른 사람들이 이해하기 어려운 이름</dd>
						<dd>- 가이드의 특징이 생기기 어려운 이름<br>
						(예: 술이술술 넘어가는 이자카야)</dd>
						<dt>
							<span class="emoji">💁</span>
							<span>다음의 경우 테마가 임의 수정될 수 있습니다.</span>
							
						</dt>
						<dd>- 중복 된 테마</dd>
						<dd>- 오탈자 혹은 불필요한 특수 문자가 있는 테마</dd>
					</dl>
				<br>
				</div>
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput2" class="form-label"><b>메유콘</b></label>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name ="mapIcon"id="formGroupExampleInput2" placeholder="입력칸에 우클릭으로 그림 이모티콘을 선택하세요" required>
	</div><br>
	
	<div class="mb-3" align="center">   
	<label class="form-label"><b>카테고리</b></label><br>
	    <input type="radio" name="kateGory" value="음식점">음식점
	    <input type="radio" name="kateGory" value="까페">까페
		<input type="radio" name="kateGory" value="편의점">편의점
		<input type="radio" name="kateGory" value="대형마트">대형마트
		<input type="radio" name="kateGory" value="보육시설">보육시설
		<input type="radio" name="kateGory" value="학교">학교
		<input type="radio" name="kateGory" value="학원">학원
		<input type="radio" name="kateGory" value="주차장">주차장
		<input type="radio" name="kateGory" value="주유소">주유소
		<input type="radio" name="kateGory" value="지하철역">지하철역<br>
		<input type="radio" name="kateGory" value="은행">은행
		<input type="radio" name="kateGory" value="문화시설">문화시설
		<input type="radio" name="kateGory" value="중개업소">중개업소
		<input type="radio" name="kateGory" value="공공기관">공공기관
		<input type="radio" name="kateGory" value="관광명소">관광명소
		<input type="radio" name="kateGory" value="숙박">숙박
		<input type="radio" name="kateGory" value="병원">병원
		<input type="radio" name="kateGory" value="약국">약국
		<input type="radio" name="kateGory" value="동네" checked>동네
		<input type="radio" name="kateGory" value="기타">기타
	</div><br>
	
    <div class="mb-3" align="center">
	  <label for="formGroupExampleInput3" class="form-label"><b>키워드(선택)</b></label>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="keyWord" id="formGroupExampleInput3" placeholder="검색용 키워드를 입력해주세요!">
	</div><br>
	<div class="help">
				<dl>
					<dt>
						<span class="emoji">🧚</span>
						<span>테마명에는 포함하지 못한 검색용 키워드를 추가할 수 있습니다.</span>
					</dt>
					<dd>- 키워드는 콤마(,)로 구분해주세요.</dd>
				</dl>
			</div><br>
			
	* 가이드 지도는 모두에게 공개됩니다.<br>
	* 가이드 지도는 관리자만 삭제 가능합니다.<br><br><br>
	<%-- <%if(user.getAdminNum()==0){ %>
			<input type="hidden" name = "mapType" value=0>
			<%}else{ %>
			<input type="hidden" name = "mapType" value=1>
			<%} %>--%>
			<input type="hidden" name="userSeqId" value="<%=user.getUserSeqId() %>"> 
			<input type="submit" value="등록" class="btn btn-outline-danger"><br><br><br><br>
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