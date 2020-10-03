<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top"/>


<% 
   String myctx=request.getContextPath();
%>   
<div class="col-md-12" style="background-color:skyblue">
	<h1 class="text-center">나의 팀</h1>
</div>
   <div class="section">
      <div class="container">
         <div class="row">
            <div class="col-md-4">
               <div>
                  <h2 align="center">팀평가</h2>
               </div>
               <table style="font-size:15px;width:500%;border:1px solid ">
                  <tbody>
                     <tr>
                        <td style="font-size:20px">Mark</td>
                        <td style="font-size:15px;width:500%">Otto</td>
                     </tr>
                     <tr>
                        <td>Jacob</td>
                        <td>Thornton</td>
                     </tr>
                     <tr>
                        <td>Larry</td>
                        <td>the Bird</td>
                     </tr>
                  </tbody>
               </table>
               <ul class="pagination">
                  <li><a href="#">Prev</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">Next</a></li>
               </ul>
            </div>
            <div class="col-md-8">
               <div class="section">
                  <div class="container">
                     <div class="row">
                        <div class="col-md-2">
                        <c:forEach var="td" items="${tdata}">
                           <img
                              src="<%=myctx%>/images/${td.timage}"
                              class="img-circle img-responsive">
                        </div>
                        <div class="col-md-4">
                           <ul class="text-left" style="margin-top: 40px">
                              <li>팀이름 : ${td.tname}</li>
                              <li>팀종목 : ${td.tsports}</li>
                              <li>팀실력 : ${td.rank}</li>
                              <li>팀지역 : ${td.tplace}</li>
                              <li>팀인원 : ${td.tnumber}</li>
                        </c:forEach>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
               <h3>팀인원</h3>
               <table class="table">
                  <thead>
                     <tr>
                        <th>팀이름</th>
                        <th>거주지역</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="tp" items="${tp}">
                     <tr>
                        <td>${tp.name}</td>
                        <td>${tp.loc}</td>
                     </tr>
                  </c:forEach>
                  </tbody>
               </table>
               <br>
               <h3>경기기록</h3>
               <table class="table">
                  <thead>
                     <tr>
                        <th>#</th>
                        <th>상대팀</th>
                        <th>경기장소</th>
                        <th>경기 날짜</th>
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
   <div class="section">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <a class="btn btn-lg btn-primary disabled"><i
                  class="fa fa-star fa-fw"></i>수정</a> <a
                  class="btn btn-lg btn-primary disabled"><i
                  class="fa fa-star fa-fw"></i>삭제</a>
            </div>
         </div>
      </div>
   </div>
<c:import url="/foot"/>