<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <div style="margin-top: 58px; text-align : center; color: #000000;"><h1>
    <b>요즘 사랑받는 장소</b>
	</h1>
	<span style="font-size:20px; color:#939699;">즐겨찾기가 가장 많이 장소</span><br><br>
	</div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${favoritePlace}" var="favoritePlace" begin="0" end="8" step="1">
	    <div class="col" onclick="location.href='detailInfo/'+${favoritePlace.placeSeq}">
	    <div class="card bg-white p-3 mb-4 shadow text-center" style="color: #3384C6;">
	      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
	      <div class="card-body">
	        <h5 class="card-title"><b>${favoritePlace.placeName}</b></h5>
	        <p class="card-text">${favoritePlace.placeAddr}</p>
	        
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>