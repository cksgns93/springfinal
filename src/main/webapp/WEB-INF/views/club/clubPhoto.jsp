<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../top.jsp" /> 

<!-- jquery 플러그인 (colorbox)----->
<script src="../js/jquery.colorbox.js"></script>
<link rel="stylesheet" href="../css/colorbox.css" />
<!-------------------->
<script>
	$(document).ready(function(){
		$('a[rel="lightbox"]').colorbox();
	});
</script>

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
	
	#clubmenu > a:nth-child(3){
		border-bottom: 4px solid royalblue;
	}
	
	#photo>a>img{
		width:80%;
	}
	
	#photo{
		color:gray;
	}

	#cname{
		color: #182952;
		font-weight: bold;
		margin-left: 40pt;
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
	  <li><a href="photoAdd.do?cno=${cno}">
	  	     <img src="../clubboardimage/logo2.png" width="30px"> 사진 등록</a></li>
	  <li><a href="photoMy.do?cno=${cno}">
	  		 <img src="../clubboardimage/logo2.png" width="30px"> 나의 사진첩</a></li>
  </ul>
</div>

<div id="t">
<div id="clubmenu">
    <a href="view.do?cno=${cno}">모임 정보</a>
    <a href="board.do?cno=${cno}">게시판</a>
    <a href="#">사진첩</a>
</div>
<div id="m">
	<c:if test="${clubView ne null and not empty clubView}">
		<div>
			<h3 id="cname">${clubView.cname}><span style="font-size:16pt">사진첩</span></h3>
		</div>
	</c:if>
		<div class="row" style="margin-top:40px; margin-left:50px">
	<c:if test="${cpList eq null or empty cpList}">
		<div style="height: 300pt">
		</div>
	</c:if>
	<c:if test="${cpList ne null and not empty cpList}">
		<c:forEach var="cp" items="${cpList}" varStatus="st">
			<%-- ${cp.name} ${cp.id} ${cp.cptitle} --%>
			
			<div id="photo" class="col-md-4">
			<a rel="lightbox" title="${cp.cptitle}" href="../clubimage/${cp.cpimage}">
				<img src="../clubphotoimage/${cp.cpimage}"><br>
			</a>
			
			<fmt:formatDate value="${cp.cpdate}" pattern="yyyy/MM/dd"/>
			<span style="float:right; margin-right:20%">작성자:${cp.name}</span>
			</div>
		<c:if test="${st.count mod 3 == 0}"> 
			</div> <!--  row를 끝내고 새로운 row를 시작하자. -->
			<div class="row" style="margin-top:70px; margin-left:50px;  margin-bottom:100pt">
		</c:if>
		</c:forEach>
	</c:if>
	</div>
</div>
</div>

<jsp:include page="../foot.jsp" /> 
    