<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/top"/>

<html>  
<div class="col-md-12" style="background-color:skyblue">
	<h1 class="text-center">나의 매칭</h1>
</div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="row col-md-8">
 	<br>
           <jsp:include page="../mypage/calendar.jsp"/>
          </div>
          <div class="col-md-4">
            <h2 class="text-center">매칭신청</h2>
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>상대팀</th>
                  <th>날짜</th>
                  <th>수락|거절</th>
                </tr>
              </thead>
              <tbody>

            <c:forEach var="select" items="${selectidx}">
                <tr>
                  <td>${select.tno}</td><%-- 
                  <td>${select.}</td>
                  <td>${select.}</td> --%>
                  <td>수락|거절</td>
                </tr>
                </c:forEach>
                
              </tbody>
            </table>
            <ul class="pagination">
              <li>
                <a href="#">Prev</a>
              </li>
              <li>
                <a href="#">1</a>
              </li>
              <li>
                <a href="#">2</a>
              </li>
              <li>
                <a href="#">3</a>
              </li>
              <li>
                <a href="#">4</a>
              </li>
              <li>
                <a href="#">5</a>
              </li>
              <li>
                <a href="#">Next</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div>
              <h2 class="text-center">매칭목록</h2>
            </div>
            <div></div>
            <table class="table text-center table-secondary text-body table-bordered table-borderless table-hover table-sm table-striped">
              <thead>
                <tr>
                  <th class="info text-center">번호</th>
                  <th class="info text-center">대결상대</th>
                  <th class="info text-center">장소</th>
                  <th class="info text-center">날짜</th>
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
        <div class="row">
          <div class="col-md-12">
            <ul class="pagination">
              <li>
                <a href="#">Prev</a>
              </li>
              <li>
                <a href="#">1</a>
              </li>
              <li>
                <a href="#">2</a>
              </li>
              <li>
                <a href="#">3</a>
              </li>
              <li>
                <a href="#">4</a>
              </li>
              <li>
                <a href="#">5</a>
              </li>
              <li>
                <a href="#">Next</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
 
<c:import url="/foot"/>