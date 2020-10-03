<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx=request.getContextPath();
%>
<!DOCTYPE html>
  <table  class="table table-bordered">
    <thead>
      <tr>
        <th>글번호</th>
        <th>게시물 제목</th>
        <th>종목</th>
        <th>팀 이름</th>
        <th>팀 실력</th>
        <th>등록 시간</th>
      </tr>

    </thead>
    
   
   <c:forEach var="list" items="${mlist}">
      <tr>
        <td>${list.mno}</td>
        <td><a href="<%=myctx%>/match?mno=${list.mno}">${list.mname}</a><span class="badge badge-primary">가능</span></td>
        <td>${list.game}</td>
        <td>${list.away}</td>
        <td>${list.tlevel}</td>
        <td>${list.mdate}</td>
      </tr>
 	</c:forEach>
 </table>