<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
