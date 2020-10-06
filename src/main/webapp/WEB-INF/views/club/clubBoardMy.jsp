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
	}
	#cbmenu>ul>li:nth-child(2){
		border-bottom-right-radius: 10px; 
		border-left: 10pt solid royalblue;
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
  <li><a href="#">
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
			<h3 id="cname">${clubView.cname}><span style="font-size:16pt">나의 게시글</span></h3>
		</div>
	</c:if>
	
	<table class="table" style="margin-top:25pt; width:90%; margin-left:5%">
		<tr style="background:#F6F6F6">
			<!-- <th width="10%">번호 </th> -->
			<th width="35%">제목</th>
			<th width="20%">작성자</th>
			<th width="20%">작성일</th>
			<th width="10%">조회</th>
			<th width="15%"></th>
		</tr>
	<c:if test="${cbList eq null or empty cbList}">
		<tr>
			<td colspan="4" style="text-align:center">내가 작성한 게시글이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${cbList ne null and not empty cbList}">
		<c:forEach var="cb" items="${cbList}">
		<tr>
			<td>
				<a href="boardView?cbno=${cb.cbno}&cno=${cno}"
					style="color:black;"><h5>${cb.cbtitle}</h5></a>
				<%-- <c:if test="${cb.cbimage ne null}">
					<img src="../clubboardimage/${cb.cbimage}" style="width:100px; height:100px">
					</a>
				</c:if> --%>
			</td>
			<td><h5>${cb.name}</h5></td>
			<td>
				<h5><fmt:formatDate value="${cb.cbupdate}" pattern="yyyy-MM-dd"/></h5>
			</td>
			<td><h5>${cb.cbreadnum}</h5></td>
			<td><h5><a href="boardEdit?cbno=${cb.cbno}&cno=${cno}">수정</a> | 
				<a href="#" onclick="goDel('${cb.cbno}', '${cno}')">삭제</a></h5></td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	
	<!-- 삭제 폼 --------------------->
	<form name="f" action="boardDel" action="post">
		<input type="hidden" name="cbno">
		<input type="hidden" name="cno">
	</form>
	<!----------------------------->
</div><!-- m -->
</div><!-- t -->
<script>
	function goDel(cbno, cno){
		var yn=confirm("글을 정말 삭제하시겠습니까?");
		
		if(yn){
			f.cbno.value=cbno;
			f.cno.value=cno;
			f.submit();
		}
	}
</script>
<jsp:include page="../foot.jsp" /> 