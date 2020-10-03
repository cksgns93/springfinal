<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
  <table  class="table table-bordered">
    <thead>
      <tr>
        <th>글번호</th>
        <th>팀명</th>
        <th>종목</th>
        <th>실력</th>
        <th>대표자 이름</th>
      </tr>

    </thead>
    
   <c:forEach var="list" items="${tlist}">
      <tr>
        <td>${list.tno}</td>
        <td><a href="#">${list.tname}</a></td>
        <td>${list.tsports}</td>
        <td>${list.rank}</td>
        <td>${list.tking}</td>
      </tr>
    </c:forEach> 
 </table>