<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top"/>
<% 
   String myctx=request.getContextPath();
%>
<div class="col-md-12" style="background-color:skyblue">
	<h1 class="text-center">나의 매칭</h1>
</div>
<br><br><br>
<c:if test="${mtno eq null or empty mtno }">
<div class="item">
          <img src="images/moim.PNG" style="width:100%;height:500px">
          <div class="carousel-caption">
            <h1 align="center" style="font-size:90px;color:blue">가입된 팀이 없습니다.</h1>
            <a href="<%=myctx%>/teamBoard.do" ><h2 align="center">팀 가입하러 가기</h2></a>
          </div>
        </div>
</c:if>
<c:if test="${mtno ne null and not empty mtno }">
<c:forEach var="team" items="${mtno}">
<div class="section">
<a href="<%=myctx%>/myteam.do?tno=${team.tno}">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            
               <div class="container">
                  <div class="row section-primary text-center" style="margin-right:15px;border:3px solid skyblue">
                     <div class="col-md-1 text-center">
                        <h2 class="text-center" style="margin-top:65px">1</h2>
                     </div>
                     <div class="col-md-2">
                        <img
                           src="<%=myctx%>/images/${team.timage}"
                           class="img-circle img-responsive">
                     </div>
                     <div class="col-md-3 text-left">
                        <h3 class="text-center" style="font-size:30px">팀명</h3>
                        <p class="text-center" style="margin-top:30px; font-size:20px">${team.tname}</p>
                     </div>
                     <div class="col-md-3">
                        <h3 class="text-center" style="font-size:30px">종목</h3>
                        <p class="text-center" style="margin-top:30px; font-size:20px">${team.tsports}</p>
                     </div>
                     <div class="col-md-3">
                        <h3 class="text-center" style="font-size:30px">팀인원</h3>
                        <p class="text-center" style="margin-top:30px; font-size:20px">${team.tnumber}</p>
                     </div>
                  </div>
               </div>
            
         </div>
      </div>
   </div>
   </a>
</div>
</c:forEach>
</c:if>
<c:import url="/foot"/>