<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top"/>
<%
	String myctx = request.getContextPath();
%>
<div class="col-md-12" style="background-color: skyblue">
	<h1 class="text-center">${tdata.tname}</h1>
</div>
<br><br><br><br><br><br><br>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-info text-center">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀프로필</div>
					<div class="panel-body">
						
							<img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
								class="img-circle img-responsive" style="margin-left:15px">
							<table class="table" style="margin-top: 20px">
								<tbody>
									<tr>
										<td>팀 &nbsp; &nbsp;명</td>
										<td colspan="3" align="center">${tdata.tname}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>대표자</td>
										<td colspan="3" align="center">${tdata.tking}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>팀등급</td>
										<td colspan="3" align="center">${tdata.rank}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>팀인원</td>
										<td colspan="3" align="center">${tdata.tnumber}</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
								 
							</table>
							<hr>
							<c:if test="${tdata.tking!= loginUser.name}">
							<button class="join" onclick="join()">가입하기</button>
							</c:if>
					</div>
					
				</div>
				<div class="panel panel-info">
            <div class="panel-heading text-center" style="font-size:20px;Color:black;font-weight: bold;" >팀인원</div>
            <table class="table table-bordered table-condensed table-hover table-striped">
              <tbody>
                <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th class="text-center">상대팀</th>
                  <th class="text-center">날짜</th>
                  <th class="text-center">수락|거절</th>
                </tr>
              </thead>
              <tbody>

            <c:forEach var="select" items="${selectidx}">
                <tr>
                  <td class="text-center">${select.tno}</td><%-- 
                  <td class="text-center">${select.}</td>
                  <td class="text-center">${select.}</td> --%>
                  <td class="text-center">수락|거절</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
          </div>
			</div>
			<div class="col-md-8 text-center">
				<div class="panel panel-info">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀설명</div>
					<div class="panel-body" style="height: 20%">가입된 팀이 없습니다.</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading"
						style="font-size: 20px; Color: black; font-weight: bold;">팀인원</div>
					<table
						class="table table-bordered table-condensed table-hover table-striped" style="height:200px">
						<thead>
							<tr>
								<th class="text-center">이름</th>
								<th class="text-center">지역</th>
							</tr>
						</thead>
			 			<c:forEach var="tp" items="${tp}">
							<tr>
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
<form id="f">
	<input type="hidden" name="tno" value="${teamData.tno}">
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
	
</script>

<c:import url="/foot"/>