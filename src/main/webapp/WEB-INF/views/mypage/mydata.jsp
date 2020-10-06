<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<%
	String myctx = request.getContextPath();
%>
<div class="col-md-12" style="background-color: skyblue">
	<h1 class="text-center">마이페이지</h1>
</div>
<font style="vertical-align: inherit;"></font>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3" style="margin-left: 270px; width: 280px">
								<c:if test="${loginUser.mark==null}">
									<img src="<%=myctx%>/images/avater2.png"
										class="img-responsive img-thumbnail" width="239px"
										style="margin-left: 0px; border: 1px solid orange; border-radius: 70%">
								</c:if>
								<c:if test="${loginUser.mark!=null}">
									<img src="<%=myctx%>/images/${loginUser.mark}"
										class="img-circle img-responsive"
										style="border: 2px solid orange;">
								</c:if>
							</div>
							<div class="col-md-6" style="margin-top: 30px; font-size: 23px">
								<dl>
									<dt>${loginUser.name}</dt>
									<dd>
										<ul>
											<li>생년월일 : ${loginUser.birth}</li>
											<li>성별 : ${loginUser.gender}</li>
											<c:if test="${loginUser.state==1}">
												<li>회원상태 : 활동중</li>
											</c:if>
											<c:if test="${loginUser.state==0}">
												<li>회원상태 : 정지</li>
											</c:if>
										</ul>
										<a href="<%=myctx%>/mypage/privacy" class="btn btn-primary"
											style="font-size: 20px; width: 36%; margin-left: 20px">개인정보수정</a>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<h2 class="text-center">클럽</h2>
		<div class="row">
			<div class="col-md-6 text-center">
				<h3 class="text-center">현재 가입 클럽</h3>
				<table class="table table-bordered table-hover table-striped"
					class="cpaing">
					<thead>
						<tr>

							<th class="info text-center">모임명</th>
							<th class="info text-center">종목</th>
							<th class="info text-center">모임장</th>
							<th class="info text-center">지역</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${myclub eq null or empty myclub}">
							<tr>
								<td colspan="4">가입된 모임이 없습니다 *모임 가입하기*</td>
							</tr>
						</c:if>

						<c:forEach var="club" items="${myclub}">
							<tr>
								<td>${club.cname}</td>
								<td>${club.csports}</td>
								<td>${club.cking}</td>
								<td>${club.cplace}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan=4>${navi}</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="col-md-6 text-center">
				<h3 class="text-center">클럽 기록</h3>
				<table
					class="table text-center table-bordered table-borderless table-hover table-sm table-striped"
					id="paging2">
					<thead>
						<tr>
							<th align="center" class="info text-center">모임명</th>
							<th class="info text-center">모임장</th>
							<th class="info text-center">종목</th>
							<th align="center" class="info text-center">지역</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${myHclub eq null or empty myHclub}">
							<tr>
								<td style="align: center" colspan="5">모임 기록이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${myHclub ne null and not empty myHclub }">

							<c:forEach var="club2" items="${myHclub}">
								<tr>
									<td>${club2.cname}</td>
									<td>${club2.cking}</td>
									<td>${club2.csports}</td>
									<td>${club2.cplace}</td>

								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan=4>${navi2}</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<h2 class="text-center">팀목록</h2>
			<div class="col-md-12 text-center">
						<form >
				<table class="table table-bordered table-hover table-striped"
					id="tpaging">
					<thead>
						<tr>
							<th class="info text-center">팀명</th>
							<th class="info text-center">종목</th>
							<th class="info text-center">팀장</th>
							<th class="info text-center">지역</th>
							<th class="info text-center">탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${teamList eq null or empty teamList}">
							<tr>
								<td colspan=5>가입한 팀이 없습니다. *팀 가입하러 가기*</td>
							</tr>
						</c:if>
						<c:if test="${teamList ne null and not empty teamList }">
							<c:forEach var="team" items="${teamList}">
								<tr>
									<td><a href="<%=myctx%>/mypage/teampage">${team.tname}</a></td>
									<td>${team.tsports}</td>
									<td>${team.tking}</td>
									<td>${team.tplace}</td>
									<c:if test="${team.tking=='날강두'}">
									<td><input type="button" value="삭제" onclick="del(${team.tno})"></td>
									</c:if>
									<c:if test="${team.tking!='날강두'}">
									<td><input type="button" value="탈퇴" onclick="del2(${team.tno})"></td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan=5>${navi3}</td>
						</tr>
					</tbody>
				</table>
				
						</form>

			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<h2 class="text-center">매칭</h2>
			<div class="col-md-12 text-center">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th class="info text-center">번호</th>
							<th class="info text-center">First Name</th>
							<th class="info text-center">Last Name</th>
							<th class="info text-center">Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
<script>
	function del(tno,idx) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?tno='+tno;
		}
	}
	function del2(tno,idx) {
		var chk = confirm("정말 탈퇴하시겠습니까?");
		if (chk) {
			location.href='secession?tno='+tno;
		}
	}	
</script>



<c:import url="/foot" />