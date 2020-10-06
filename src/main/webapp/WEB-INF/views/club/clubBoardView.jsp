<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../top.jsp" /> 

<%
	String myctx = request.getContextPath();
%>
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
		margin-bottom: 30pt;
	}
	
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
	
	#cname{
		color: #182952;
		font-weight: bold;
		margin-left: 34pt;
	}
	
	#cbmain{
		margin: 25pt 0 10pt 5%;
		width: 90%;
		border-bottom: 1px solid lightgray;
	}
	
	.n{
		background-color: #F6F6F6;
		border-right: 1px solid lightgray;
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
    <a href="board?cno=${cno}">게시판</a>
    <a href="photo?cno=${cno}">사진첩</a>
</div>

<div id="m">   
	<table id="cbmain" class="table">
		<tr>
			<td class="n">제목</td>
			<td>${cboard.cbtitle}</td>
			<td class="n">조회수</td>
			<td>${cboard.cbreadnum}</td>
		</tr>
		<tr>
			<td class="n">작성자</td>
			<td>${cboard.name}</td>
			<td class="n">작성시간</td>
			<td>
				<fmt:formatDate value="${cboard.cbupdate}" pattern="yyyy-MM-dd   HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">${cboard.cbcontent}</td>
		</tr>
	</table>
	<button class="btn btn-primary" 
		style="margin-right:5%; float:right; margin-bottom:10pt"
		onclick="location.href='board?cno=${cno}'">목록으로</button>
	
	<div style="clear:both"></div>
</div> 
</div>

<jsp:include page="../foot.jsp" /> 
