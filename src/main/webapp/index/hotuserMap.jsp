<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
    <hr class="divider-title">
    <div class="row center-block">
    <div style="margin-top: 30px; text-align : center; color: #000000;"><h1>
    <b>열혈 회원</b>
	</h1>
	<span style="font-size:20px; color:#939699;">가장 많은 활동을 한 멤버들</span><br><br>
	</div>
<c:forEach items="${getHotUser}" var="getHotUser" begin="0" end="5" step="1">
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center" style="color:#3384C6;">
            <div class="project" onclick="location.href='guiding/guider/'+${getHotUser.userSeqId}">
                <figure class="img-responsive">
                    <a style="font-size: 50px">${getHotUser.userIcon}</a><br>
                    <span class="actions">
                        <span class="project-details"><b>${getHotUser.userNickName} 님</b><br>${getHotUser.placeCnt} 곳의 장소</span>
                    </span>
                </figure>
            </div>
        </div>
</c:forEach>
    </div>
</div>
