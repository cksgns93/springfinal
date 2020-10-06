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
		border-bottom: 4px solid royalblue;
		border-top-left-radius: 10px 
	}
	
	#clubmenu > a:nth-child(3){
		border-top-right-radius: 10px 
	}
	
	#clubimg{
		width:75%;
		margin: 50pt auto;
	}
	
	#clubimg > img{
		width:100%;
	}
	
	#cname{
		font-weight: bold;
	}
	
	.join{
		margin-top: 15pt;
		width: 100%;
		height: 35pt;
		background: royalblue;
		color: white;
		border: 1px solid white;
		border-radius : 5px;
		font-size: 15pt;
	}
	
	.joinPeople{
		padding: 10px;
		border-bottom: 2px solid lightgray;
	}
	
	.joinPeople>span{
		font-size: 11pt;
	}
	.joinPeople>img{
		float: left;
	}
	
	#number{
		fonst-size: 9pt;
		border-top: 2px solid lightgray;
		border-bottom: 2px solid lightgray;
		padding: 10px;
	}
	
</style>

<div id="t">

<div id="clubmenu">
    <a href="#">모임 정보</a>
    <a href="board?cno=${clubView.cno}">게시판</a>
    <a href="photo?cno=${clubView.cno}">사진첩</a>
</div>

<div id="m">
<div id="clubimg">
	<img src="../clubimage/${clubView.cimage}" >
	
	<h2 id="cname">${clubView.cname}</h2>
	<h3>${clubView.cinfo}</h3>
	
	<!-- 가입된 사람은 =>가입하기, 가입안된 사람은 =>가입취소하기 -->
	<c:if test="${joincheck eq 'noJoin'}">
		<button class="join" onclick="join()">가입하기</button></c:if>
	<c:if test="${joincheck  eq 'join'}">
		<button class="join" onclick="joinDel()">가입취소하기</button></c:if>
	<c:if test="${joincheck eq 'king'}"></c:if>

	<br><br>
	
	<!-- 가입된 사람들 리스트 -->
	<div id="number">모임 멤버 ${clubView.cnumber}명</div>

	<c:if test="${mList eq null or empty mList}">
		<div>
			<h3>모임멤버가 없습니다.</h3>
		</div>
	</c:if>
		
	<c:if test="${mList ne null and not empty mList}">
		<c:forEach var="ml" items="${mList}" varStatus="st">
			<c:if test="${st.count mod 2 == 0}">
			<div class="joinPeople">
			</c:if>
			
			<c:if test="${st.count mod 2 == 1}">
			<div class="joinPeople"  style="background:#F6F6F6">
			</c:if>
			
			<img src="../images/${ml.mark}" style="width:80px; heigth:80px;">
			<div style="float:left">
				<h5>&emsp;${ml.id}</h5>
				<h5>&emsp;${ml.name}</h5>
			</div>
			
			<c:if test="${st.first}">
				<div style="float:right">
					&nbsp;&nbsp;
					<img style="width:25pt" src="../images/king.png">
					<p style="color:blue; font-weight:bold; font-size:12pt">모임장&emsp;</p>
				</div>
			</c:if>
			
			<c:if test="${joincheck eq 'king' && !st.first}">
				<div style="float:right">
					<br>
					<button type="button" class="btn btn-primary" 
					onclick="location.href='drop?idx=${ml.idx}&cno=${clubView.cno}'">모임 탈퇴시키기</button>
				</div>
			</c:if>
			
			
			<div style="clear:both"></div>
			</div>
						
		</c:forEach>
	</c:if>
</div>
</div>
</div>
<!--  가입하기, 가입 취소하기 처리 폼 -->
<form id="f">
	<input type="hidden" name="cno" value="${clubView.cno}">
<%-- 	<input type="text" name="cno" value="${joincheck}"> --%>
</form>
<!-- -------------------- -->
<script>
	function join(){
		var yn=confirm("가입하시겠습니까?");
		
		if(yn){
			$('#f').prop('action','join');
			f.submit();
		}
	}
	
	function joinDel(){
		var yn=confirm("가입을 취소하시겠습니까?");
		
		if(yn){
			$('#f').prop('action','joinDel');
			f.submit();
		}
	}
</script>
<jsp:include page="../foot.jsp" /> 
