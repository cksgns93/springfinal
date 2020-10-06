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
		margin-bottom: 50pt;
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
	<c:if test="${clubView ne null and not empty clubView}">
		<div>
			<h3 id="cname">${clubView.cname}><span style="font-size:16pt">게시글 등록</span></h3>
		</div>
	</c:if>
		<div style="width:90%; margin:20pt 0 40pt 5%">
			<form action="boardAddEnd" method="post" name="f">
				<input type="text" class="form-control" id="cbtitle" name="cbtitle"
				  placeholder="제목" style="height:30pt;font-size:15pt">
			<br>
			<textarea class="form-control" id="cbcontent" name="cbcontent"
				placeholder="글 작성하기" style="height:300pt;font-size:15pt"></textarea>
			<!-- hidden --------------->
			<input type="hidden" value="${cno}" id="cno" name="cno">
			<!-------------------------->
			<div style="margin-left:38%; margin-top:10pt">
				<button type="button" class="btn btn-primary"
				  onclick="check()">등록하기</button>&nbsp;
				<button type="reset" class="btn btn-primary">다시쓰기</button>
			</div>
			</form>
		</div>	
</div><!-- m -->
</div><!-- t -->
<script>	
	function check(){
		if(!f.cbtitle.value){
			alert('제목을 입력하세요.');
			f.cbtitle.focus();
			return;
		}
		if(!f.cbcontent.value){
			alert('게시글 내용을 입력하세요.');
			f.cbcontent.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
<jsp:include page="../foot.jsp" /> 