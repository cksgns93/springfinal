<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../top.jsp" /> 

<style>
 	/* div{ 
		border: 1px solid black; 
 	}  */
	
	#t{
		width: 65%;
		margin:0 auto;
		margin-top: 30pt;
		margin-bottom: 50pt;
		border: 1px solid lightgray;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	
	#cname{
		color: #182952;
		font-weight: bold;
		margin-left: 34pt;
	}
	
	table{
	    width: 90%;
		border: lightgray;
		margin: 20px 0 10pt 5%;
	}
	
	.ctitle>td{
		padding: 10pt;
		color: #182952; 
		font-weight: bold;
	}
	
	
	.ctitle>td:nth-child(1){
		background-color: #F6F6F6;
		text-align: center;
	}
	
</style>

<div id="t">
	
	<h3 id="cname">> <span style="font-size:16pt">모임 만들기</span></h3>	
	<div>
		<form name="f" action="addEnd" enctype="multipart/form-data" method="post">
			<table border="1">
				<tr class="ctitle">
					<td width="15%">모임 이름</td>
					<td><input type="text" name="cname" class="form-control" style="width: 50%"></td>
				</tr>
				<tr class="ctitle">
					<td>모임 종목</td>
					<td><select class="form-control" style="width: 50%" name="csports">
							<option value="sel">::종목 선택::</option>
							<option value="자전거">자전거</option>
							<option value="배드민턴">배드민턴</option>
							<option value="테니스/스쿼시">테니스/스쿼시</option>
							<option value="헬스/크로스핏">헬스/크로스핏</option>
							<option value="골프">골프</option>
							<option value="클라이밍">클라이밍</option>
							<option value="축구/풋살">축구/풋살</option>
							<option value="러닝/마라톤">러닝/마라톤</option>
					</select></td>
				</tr>
				<tr class="ctitle">
					<td>모임 장소</td>
					<td><input type="text" name="cplace" class="form-control" style="width: 70%"></td>
				</tr>
				<tr class="ctitle">
					<td>모임 번호</td>
					<td>
						<div class="col-md-2">
						<input type="text" name="chp1" class="form-control"></div>
						<div class="col-md-1"><span style="font-size:15pt">-</span></div>
						<div class="col-md-2">
						<input type="text" name="chp2" class="form-control"></div>
						<div class="col-md-1"><span style="font-size:15pt">-</span></div>
						<div class="col-md-2">
						<input type="text" name="chp3" class="form-control"></div>
					</td>
				</tr>
				<tr class="ctitle">
					<td>모임 사진</td>
					<td>
								  <!-- cimage와 이름 다르게 설정 -->
					<input type="file" name="mcimage" id="cimage" placeholder="Attach File" class="form-control"
					style="margin-top:10px; width: 70%"></td>
				</tr>
				<tr class="ctitle">
					<td>모임 소개</td>
					<td><textarea class="form-control" id="cinfo" name="cinfo"
					style="height:300pt;font-size:15pt"></textarea></td>
				</tr>
			</table>
			<div style="margin-left:38%; margin-bottom:10pt">
				<button type="button" class="btn btn-primary"
				  onclick="check()">모임 만들기</button>&nbsp;
				<button type="reset" class="btn btn-primary">새로 작성하기</button>
			</div>
		</form>
	</div>
</div>

<script>
	//모임장소는 선택사항
	function check(){
		if(!f.cname.value){
			alert('모임 이름을 입력하세요.');
			f.cname.focus();
			return;
		}
		if(!f.chp1.value){
			alert('전화번호를 입력하세요.');
			f.chp1.focus();
			return;
		}
		if(!f.chp2.value){
			alert('전화번호를 입력하세요.');
			f.chp2.focus();
			return;
		}
		if(!f.chp3.value){
			alert('전화번호를 입력하세요.');
			f.chp3.focus();
			return;
		}
		if(!f.cimage.value){
			alert('모임사진을 선택해주세요.');
			f.cimage.focus();
			return;
		}
		if(!f.cinfo.value){
			alert('모임 정보를 입력하세요.');
			f.cinfo.focus();
			return;
		}
		
		f.submit();
	}
	
</script>

<jsp:include page="../foot.jsp" /> 