<%@page import="com.spring.mau.user.UserVO"%>
<%@page import="com.spring.mau.map.MapVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    MapVO mapInfo = (MapVO)request.getAttribute("mapInfo");
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
  <%if(user.getAdminNum()==1){ %>
		<form action="${pageContext.request.contextPath}/AdminMapUpdate/<%=mapInfo.getMapSeq() %>" method="post"style="text-align: center;">
		<%}else{ %>
		<form action="${pageContext.request.contextPath}/mapUpdate/<%=mapInfo.getMapSeq() %>" method="post"style="text-align: center;">
		<%} %>
	      <div class="mb-3" align="center">
	      <h1>나만의 가이더지도 수정 삭제</h1><br>
	      
	  <label for="formGroupExampleInput" class="form-label"><b>가이더 주제</b></label>
	  <input style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="mapName"id="formGroupExampleInput" placeholder="가이더지도의 이름을 지어주세요!" required value="<%=mapInfo.getMapName()%>">
	</div><br>
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput2" class="form-label"><b>메유콘</b></label>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name ="mapIcon"id="formGroupExampleInput2" placeholder="입력칸에 우클릭으로 그림 이모티콘을 선택하세요" required value="<%=mapInfo.getMapIcon()%>">
	</div><br>

	<div class="mb-3" align="center">   
	<label class="form-label"><b>카테고리</b></label><br>
	    <input type="radio" name="kateGory" value="음식점" <% if("음식점".equals(mapInfo.getKateGory())){%>checked<%}%>>음식점</input>
	    <input type="radio" name="kateGory" value="까페" <% if("까페".equals(mapInfo.getKateGory())){%>checked<%}%>>까페</input>
		<input type="radio" name="kateGory" value="편의점" <% if("편의점".equals(mapInfo.getKateGory())){%>checked<%}%>>편의점</input>
		<input type="radio" name="kateGory" value="대형마트" <% if("대형마트".equals(mapInfo.getKateGory())){%>checked<%}%>>대형마트</input>
		<input type="radio" name="kateGory" value="보육시설" <% if("보육시설".equals(mapInfo.getKateGory())){%>checked<%}%>>보육시설</input>
		<input type="radio" name="kateGory" value="학교" <% if("학교".equals(mapInfo.getKateGory())){%>checked<%}%>>학교</input>
		<input type="radio" name="kateGory" value="학원" <% if("학원".equals(mapInfo.getKateGory())){%>checked<%}%>>학원</input>
		<input type="radio" name="kateGory" value="주차장" <% if("주차장".equals(mapInfo.getKateGory())){%>checked<%}%>>주차장</input>
		<input type="radio" name="kateGory" value="주유소" <% if("주유소".equals(mapInfo.getKateGory())){%>checked<%}%>>주유소</input>
		<input type="radio" name="kateGory" value="지하철역" <% if("지하철역".equals(mapInfo.getKateGory())){%>checked<%}%>>지하철역</input><br>
		<input type="radio" name="kateGory" value="은행" <% if("은행".equals(mapInfo.getKateGory())){%>checked<%}%>>은행</input>
		<input type="radio" name="kateGory" value="문화시설" <% if("문화시설".equals(mapInfo.getKateGory())){%>checked<%}%>>문화시설</input>
		<input type="radio" name="kateGory" value="중개업소" <% if("중개업소".equals(mapInfo.getKateGory())){%>checked<%}%>>중개업소</input>
		<input type="radio" name="kateGory" value="공공기관" <% if("공공기관".equals(mapInfo.getKateGory())){%>checked<%}%>>공공기관</input>
		<input type="radio" name="kateGory" value="관광명소" <% if("관광명소".equals(mapInfo.getKateGory())){%>checked<%}%>>관광명소</input>
		<input type="radio" name="kateGory" value="숙박" <% if("숙박".equals(mapInfo.getKateGory())){%>checked<%}%>>숙박</input>
		<input type="radio" name="kateGory" value="병원" <% if("병원".equals(mapInfo.getKateGory())){%>checked<%}%>>병원</input>
		<input type="radio" name="kateGory" value="약국" <% if("약국".equals(mapInfo.getKateGory())){%>checked<%}%>>약국</input>
		<input type="radio" name="kateGory" value="동네" <% if("동네".equals(mapInfo.getKateGory())){%>checked<%}%>>동네</input>
		<input type="radio" name="kateGory" value="기타" <% if("기타".equals(mapInfo.getKateGory())){%>checked<%}%>>기타</input>
	</div><br>
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput3" class="form-label"><b>키워드(선택)</b></label>
	  <%if(mapInfo.getKeyWord()== null){ %>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="keyWord" id="formGroupExampleInput3" placeholder="검색용 키워드를 입력해주세요!" value="">
			<%}else{ %>
			<input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="keyWord" id="formGroupExampleInput3" placeholder="검색용 키워드를 입력해주세요!" value="<%=mapInfo.getKeyWord()%>">	
			<%} %>
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
			
	* 공유된 지도는 메인 페이지에 소개될 수 있습니다.<br>
    * 공유 여부와 관계없이 지도는 웹에 공개됩니다.<br>
    * 공유를 하지 않으면 MAU 웹사이트에는 나타나지 않지만, URL로 누구나 접근이 가능합니다.<br><br><br>
	<div class="mb-3" align="center">
	<%if(mapInfo.getShareYn()==0){ %>
	        <input type="radio" name="shareYn"  value="1">네 공유하겠습니다.<br>
			<input type="radio" name="shareYn" checked="checked" value="0">아니요 공유 안하겠습니다<br>
			<%}else{ %>
			<input type="radio" name="shareYn" checked="checked" value="1">네 공유하겠습니다.<br>
			<input type="radio" name="shareYn" value="0">아니요 공유 안하겠습니다<br>
			<%} %> 
	</div><br>
	<%if(user.getAdminNum()==0){ %>
			<input type="hidden" name = "mapType" value=0>
			<%}else{ %>
			<input type="hidden" name = "mapType" value=1>
			<%} %>
			<input type="hidden" name="userSeqId" value="<%=user.getUserSeqId() %>">
			<button class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/mapDelete/<%=mapInfo.getMapSeq()%>'">삭제</button>&nbsp;&nbsp;&nbsp;
			<input type="submit" value="수정" class="btn btn-outline-danger"><br><br><br><br>
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