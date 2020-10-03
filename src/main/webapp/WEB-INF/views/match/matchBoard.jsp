<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/top"/>

<style>
.carousel-item img {
	width: 100%;
}
</style>

<c:set var="myctx" value="${pageContext.request.contextPath}"/>

<!-- carousel------------------------------------------------- -->
<div id="fullcarousel-example" data-interval="false"
	class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<div class="item active">
			<img src="images/soccer.PNG">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
		<div class="item">
			<img src="images/basketball.PNG">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
		<div class="item">
			<img src="images/baseball.PNG">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#fullcarousel-example"
		data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a> <a
		class="right carousel-control" href="#fullcarousel-example"
		data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
</div>

<!-- carousel---끝---------------------------------------------- -->

<!-- search---------------------------------------------------- -->
<form>
	<div class="container mt-3">
		<div class="row form-group" style="margin: 10pt">
			<div class="col-md-3">
				<select class="form-control" id="sel1">
					<option>::검색 유형::</option>
					<option>팀 명</option>
					<option>지역</option>
					<option>팀 실력</option>
				</select>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</div>
	</div>
</form>
<!-- search---------------------------------------------------- -->
<!-- table--------------------------------------------------------------------------- -->
<div id="mmlist" class="container"></div>
<!-- table--------------------------------------------------------------------------- -->

<!-- foot~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<c:import url="/foot"/>
<script>
	$(function() {
		getAllList();
	})
	var getAllList = function() {
		$.ajax({
			type : 'get',
			url : 'matchList',
			dataType : 'html',//text, html, xml, json ...
			cache : false,
			success : function(res) {
				$("#mmlist").html(res);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		})
	}
</script>