<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <div style="margin-top: 58px; text-align : center; color: #000000;"><h1>
    <b>단체 가이드 (최신)</b>
	</h1>
	<span style="font-size:20px; color:#939699;">가장 최근에 등록된 함께 만드는 지도</span><br><br>
	</div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${newestMap}" var="newestMap" begin="0" end="8" step="1">
	    <div class="col" onclick="location.href='guideMap/'+${newestMap.mapSeq}">
	     <div class="card bg-white p-3 mb-4 shadow text-center" style="color:#3384C6;">
	    	<p class="card-img-top" style="font-size:30px">${newestMap.mapIcon}</p>
	      <div class="card-body">
	        <h5 class="card-title"><b>${newestMap.mapName}</b></h5>
	        <p class="card-text">${newestMap.placeCnt} 개의 장소</p>
	        
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>