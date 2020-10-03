<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top"/>
<%
	String myctx = request.getContextPath();
%>
<div class="section">
	<div class="container">
		<div class="row" style="background-color: yellow">
		<c:forEach var="td" items="${tdata}">
			<h1 class="text-center">${td.tname}</h1>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-info text-center">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀프로필</div>
					<div class="panel-body">
						
							<img src="<%=myctx%>/images/${td.timage}"
								class="img-circle img-responsive" style="margin-left: 15">
							<table class="table" style="margin-top: 20px">
								<tbody>
									<tr>
										<td>팀 &nbsp; &nbsp;명</td>
										<td colspan="3" align="center">${td.tname}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>대표자</td>
										<td colspan="3" align="center">${td.tking}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>팀등급</td>
										<td colspan="3" align="center">${td.rank}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>팀인원</td>
										<td colspan="3" align="center">${td.tnumber}</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
								</c:forEach>
							</table>
							<hr>
							<a class="btn btn-primary" style="width: 100%">가입</a>
					</div>
				</div>
			</div>
			<div class="col-md-8 text-center">
				<div class="panel panel-info">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀설명</div>
					<div class="panel-body" style="height: 20%">들어 올꺼야 말꺼야 빨리 선택해</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀인원</div>
					<table
						class="table table-bordered table-condensed table-hover table-striped" style="height:200px">
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">이름</th>
								<th class="text-center">지역</th>
							</tr>
						</thead>
						<c:forEach var="tp" items="${tp}">
							<tr>
								<td>1</td>
								<td>${tp.name}</td>
								<td>${tp.loc}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/top"/>