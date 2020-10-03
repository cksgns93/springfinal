<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/top" />

<c:set var="myctx" value="pageContext.request.contextPath" />

<form class="form-horizontal" role="form" action="teamAddEnd">
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">팀 등록</h1>
			</div>
		</div>
		<div class="row  justify-content-center">
			<div class="col-md-12">
					<div class="form-group">
						<div class="col-sm-2">
							<img src="images/BS.png" class="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="tname" class="control-label">팀 명</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="tname" id="tname"
								placeholder="팀명">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="tsports" class="control-label">종목</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="tsports" id="tsports"
								placeholder="종목">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2">
							<label for="level" class="control-label">팀 실력</label>
						</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="rank" id="level"
								placeholder="Level">
							<p class="text-danger">냉정한 본인 팀 실력을 적어주세요</p>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2">
							<label for="tplace" class="control-label">팀 선호지역</label>
						</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="tplace" id="tplace"
								placeholder="tplace">
							<p class="text-danger">선호 지역을 고르시오</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label class="control-label">전화번호</label>
						</div>
						<div class="row">
							<div class="col-md-2">
								<input type="text" class="form-control" name="thp1" id="thp1">
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" name="thp2" id="thp2">
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" name="thp3" id="thp3">
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<button>팀 등록!!</button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<!-- ------------------------------------------------------------------ -->
<c:import url="foot" />