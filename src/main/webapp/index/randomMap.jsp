<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <div style="margin-top: 58px; text-align : center; color: #000000;"><h1>
    <b>개인 가이드 (추천)</b>
	</h1>
	<span style="font-size:20px; color:#939699;">무작위로 추천해 주는 개인이 만드는 지도</span><br><br>
	</div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${randomMap}" var="randomMap" begin="0" end="8" step="1">
	    <div class="col" onclick="location.href='guiderMap/'+${randomMap.mapSeq}">
	     <div class="card bg-white p-3 mb-4 shadow text-center" style="color:#3384C6;">
	    	<p class="card-img-top" style="font-size:30px">${randomMap.mapIcon}</p>
	      <div class="card-body">
	        <h5 class="card-title"><b>${randomMap.mapName}</b></h5>
	        <p class="card-text">${randomMap.placeCnt} 개의 장소</p>
	        
	      </div>
	    </div>
	  </div>
		
	</c:forEach>
	</div>
	
<!-- <div style="margin-top: 58px; text-align : center;"><h1>
    <img src="https://visualpharm.com/assets/198/Location-595b40b85ba036ed117da637.svg" class="card-img-top" width="50px"  height="50px" alt="...">가이드지도
</h1><br></div>
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" width="50px"  height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title center">녹차 맛집</h5>
        <p class="card-text">녹차는 맛있다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">녹차 맛집</h5>
        <p class="card-text">녹차는 맛있다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">녹차 맛집</h5>
        <p class="card-text">녹차는 맛있다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">소주 맛집</h5>
        <p class="card-text">취했다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">소주 맛집</h5>
        <p class="card-text">취했다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">소주 맛집</h5>
        <p class="card-text">취했다</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">만두 맛집</h5>
        <p class="card-text">중국전통</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">만두 맛집</h5>
        <p class="card-text">중국전통</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-info h-100 text-center">
      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
      <div class="card-body">
        <h5 class="card-title">만두 맛집</h5>
        <p class="card-text">중국전통</p>
      </div>
    </div>
  </div>
</div> -->
<!--card2 end-->