<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<c:set var="myctx" value="pageContext.request.contextPath"/>

<style>
 	/* div{ 
		border: 1px solid black; 
 	}  */
	
	#t{
		width: 65%;
		margin:0 auto;
		margin-top: 30pt;
	}
	
	#m{
		border: 1px solid lightgray;
	}
	
	/*   메뉴     ///////////////// */
	#clubmenu{
		width: 100%;
		margin: 0 auto; 
		font-size : 12pt;
		text-align: center;
		font-weight: bold;
		display : flex;
	}
	
	#clubmenu > a{
		width: 33.33%;
		border: 1px solid lightgray;
		padding: 10pt;
		text-decoration: none;
	}

	#clubmenu > a:nth-child(1){
		border-top-left-radius: 10px 
	}
	
	#clubmenu > a:nth-child(3){
		border-top-right-radius: 10px 
	}	

	#clubmenu > a:nth-child(2){
		border-bottom: 4px solid royalblue;
	}
	/*////////////////////////////*/
	
	#cname{
		color: #182952;
		font-weight: bold;
		margin-left: 34pt;
	}
	
	/*   메뉴     ///////////////// */
	#cbmenu{
		width:15%;
	}
	#cbmenu>ul{
		list-style:none;
		padding-left:0px; /*들여쓰기 없애기*/
	}
	#cbmenu>ul>li{
		border: 1px solid lightgray;
		padding: 10pt;
	}
	#cbmenu>ul>li:nth-child(1){
		border-top-right-radius: 10px 
	}
	#cbmenu>ul>li:nth-child(2){
		border-bottom-right-radius: 10px 
	}
	#cbmenu>ul>li>a{
		text-decoration:none;
		color: black;
		font-size: 12pt;
		font-weight: 900;
	}
	/*////////////////////////////*/
</style>

<div id="cbmenu" style="float:left; margin-top:30pt">
  <ul>
  <li><a href="boardAdd?cno=${cno}">
  	     <img src="../clubboardimage/logo2.png" width="30px"> 게시글 등록</a></li>
  <li><a href="boardMy?cno=${cno}">
  		 <img src="../clubboardimage/logo2.png" width="30px"> 나의 게시글</a></li>
  </ul>
</div>

<div id="t">
<div id="clubmenu">
    <a href="view?cno=${cno}">모임 정보</a>
    <a href="#">게시판</a>
    <a href="photo?cno=${cno}">사진첩</a>
</div>
<div id="m">
	<c:if test="${clubView ne null and not empty clubView}">
		<div>
			<h3 id="cname">${clubView.cname}><span style="font-size:16pt">게시판</span></h3>
		</div>
	</c:if>

	<table class="table" style="margin-top:25pt; width:90%; margin-left:5%">
		<tr style="background:#F6F6F6">
			<!-- <th width="10%">번호 </th> -->
			<th width="40%">제목</th>
			<th width="20%">작성자</th>
			<th width="20%">작성일</th>
			<th width="10%">조회</th>
		</tr>
	<c:if test="${cbList eq null or empty cbList}">
		<tr>
			<td colspan="4" style="text-align:center">게시글이 없습니다.</td>
		</tr>
	</c:if>
	
	
	<c:if test="${cbList ne null and not empty cbList}">
		<c:forEach var="cb" items="${cbList}">
		<tr>
			
			<td>
				<a href="boardView?cbno=${cb.cbno}&cno=${cno}"
					style="color:black;"><h5>${cb.cbtitle}</h5></a>
			</td>
			<td><h5>${cb.name}</h5></td>
			<td>
				<h5><fmt:formatDate value="${cb.cbupdate}" pattern="yyyy-MM-dd"/></h5>
			</td>
			<td><h5>${cb.cbreadnum}</h5></td>
		</tr>
		</c:forEach>
	</c:if>

	
	<!-- 페이징 처리 ---------------------->
	<tr>
		<td colspan="4" class="text-center">
		<ul class="pagination justfify-content-center">
		<c:if test="${prevBlock>0}"> <!-- 이전 5개 -->
			<li class="page-item">
				<a class="page-link" href="board?cpage=${prevBlock}&cno=${cno}">이전 ${pagingBlock}개</a>
			</li>
		</c:if>
			
		<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}" step="1">
			<c:if test="${i<=pageCount}">
			<li class="page-item <c:if test="${cpage==i}">active</c:if>" >
				<a class="page-link" href="board?cpage=${i}&cno=${cno}">${i}</a>
			</li>	
			</c:if>		
		</c:forEach>
			
		<c:if test="${nextBlock<=pageCount}"> <!-- 이후 5개 -->
			<li class="page-item">
			</li>
		</c:if>
		</ul>
		
		<div style="float: right">
		총게시글수: <span class="text-primary">${totalCount}</span>
		<br>
		<span class="text-danger">${cpage}</span>
		/<span>${pageCount}</span>
		</div>			
	</td>	
	
		
	</tr>
	<!--------------------------------------->
	</table>
	</div>
</div>
<c:import url="/foot"/>