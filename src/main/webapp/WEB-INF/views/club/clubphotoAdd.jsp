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
	
	#photo > img{
		width:80%;
	}
	
	#photo{
		color:gray;
	}

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
		border-top-right-radius: 10px;
		border-left: 10pt solid royalblue;
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
  <li><a href="#">
  	     <img src="../clubboardimage/logo2.png" width="30px"> 사진 등록</a></li>
  <li><a href="photoMy?cno=${cno}">
  		 <img src="../clubboardimage/logo2.png" width="30px"> 나의 사진첩</a></li>
  </ul>
</div>

<div id="t">
<div id="clubmenu">
    <a href="view?cno=${cno}">모임 정보</a>
    <a href="board?cno=${cno}">게시판</a>
    <a href="photo?cno=${cno}">사진첩</a>
</div>

<div id="m">
	<c:if test="${clubView ne null and not empty clubView}">
		<div>
			<h3 id="cname">${clubView.cname}><span style="font-size:16pt">사진 등록</span></h3>
		</div>
	</c:if>
		<div style="width:90%; margin:20pt 0 40pt 5%">
			<form action="photoAddEnd" method="post" name="f" enctype="multipart/form-data">
				<input type="text" name="cptitle" id="cptitle" placeholder="사진 제목" class="form-control">
				<input type="file" name="mfilename" id="filename" placeholder="Attach File" class="form-control"
					style="margin-top:10px">
				<!-- hidden --------------->
				<input type="hidden" value="${cno}" id="cno" name="cno">
				<!-------------------------->
				<div style="margin-left:42%; margin-top:10pt">
					<button type="button" class="btn btn-primary"
					  onclick="check()">등록하기</button>
				</div>
			</form>
		</div>		
</div>
</div>
<script>
	function check(){
	
		if(!f.cptitle.value){
			alert('제목을 입력하세요.');
			f.cptitle.focus();
			return;
		}
		if(!f.filename.value){
			alert('사진을 선택하세요.');
			f.filename.focus();
			return;
	}
	
	f.submit();
}
	
</script>
<jsp:include page="../foot.jsp" /> 
    