<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
  <table  class="table table-bordered" style="margin-top:30pt">
    <thead>
      <tr>
        <th>팀번호</th>
        <th>팀명</th>
        <th>종목</th>
        <th>지역</th>
        <th>팀 실력</th>
        <!-- <th>등록 시간</th> -->
      </tr>

    </thead>
    
   <c:forEach var="list" items="${tlist}">
      <tr>
        <td>${list.tno}</td>
        <td><a href="teampage?tno=${list.tno}">${list.tname}</a>
        <!-- <span class="badge badge-primary">가능</span> -->
       	</td>
        <td>${list.tsports}</td>
        <td>${list.tplace}</td>
        <td>${list.rank}</td>
        <!-- <td>a</td> -->
      </tr>
 	</c:forEach> 
 </table>
 
<!-- 페이징 처리  ----------------------->
	<div class="col-md-offset-4" id="paging" style="padding-left:35pt; margin-top:40pt">
	<ul class="pagination justfify-content-center">
		<c:if test="${prevBlock==0}"> 
			<script>
				$('#paging').css('paddingLeft', '100pt');
			</script>
		</c:if>
		<c:if test="${prevBlock>0}"> <!-- 이전 5개 -->
			<li class="page-item">
				<a class="page-link" href="teamBoard?cpage=${prevBlock}">이전 ${pagingBlock}개</a>
			</li>
		</c:if>
			
		<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}" step="1">
			<c:if test="${i<=pageCount}">
			<li class="page-item <c:if test="${cpage==i}">active</c:if>" >
				<a class="page-link" href="teamBoard?cpage=${i}">${i}</a>
											<%-- table의 id를 bbs로 줌--%>
			</li>	
			</c:if>		
		</c:forEach>
			
		<c:if test="${nextBlock<=pageCount}"> <!-- 이후 5개 -->
			<li class="page-item">
				<a class="page-link" href="teamBoard?cpage=${nextBlock}">이후 ${pagingBlock}개</a>
			</li>
		</c:if>	
	</ul>
	</div>
<!--------------------------------------->