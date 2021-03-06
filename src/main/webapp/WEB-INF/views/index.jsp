<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="noticeDao" class="notice.persistence.NoticeDAOMyBatis" scope="session"/> --%>

<c:import url="/top"/>

<c:set var="myctx" value="${pageContext.request.contextPath}"/>

<style>
.row {
	padding: 50px;
}

.body {
	height: auto;
}
</style>
<script>
$(function(){
	$('.table').stupidtable();
})
</script>

    <div id="fullcarousel-example" data-interval="false" class="carousel slide"
    data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active">
          <img src="${myctx}/images/main1.png">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
        <div class="item">
          <img src="${myctx}/images/main2.png">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
        <div class="item">
          <img src="${myctx}/images/main3.png">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
      <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
    </div><!-- carousel 끝 -->
    
    <div class="section">
        <div class="row">
          <div class="col-md-4 p-2">
            <h1 class="text-center">공지사항</h1>
            <table class="table">
              <thead>
                <tr>
                  <th>No
                    <br>
                  </th>
                  <th>제목</th>
                  <th>작성일</th>
                </tr>
              </thead>

              <tbody>
                
	                <tr>
	                  <td>1</td>
	                  <td><a href="noticeboard.do"><span class="badge">필독</span>매칭 글 올리기전에 확인하세요</a></td>
	                  <td>2020-10-06</td>
	                </tr>
                
                
              </tbody>
              
            </table>
          </div>
          <div class="col-md-4 p-2">
            <h1 class="text-center">매칭 게시판
              <br>
            </h1>
            <table class="table">
              <thead>
                <tr>
                  <th>no
                    <br>
                  </th>
                  <th>종목</th>
                  <th>제목</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>농구</td>
                  <td>길거리 농구 한판</td>
                  <td>20-08-14</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>축구</td>
                  <td>10/1일 서경 풋살장</td>
                  <td>20-08-14</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>야구</td>
                  <td>글러브만 들고오세요</td>
                  <td>20-08-14</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-md-4">
            <h1 class="text-center">모임 게시판</h1>
            <table class="table">
              <thead>
                <tr>
                  <th>no</th>
                  <th>종목</th>
                  <th>제목
                    <br>
                  </th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>당구</td>
                  <td>200이상만</td>
                  <td>2020-09-20</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>볼링</td>
                  <td>즐깁시다</td>
                  <td>2020-09-28</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>수영</td>
                  <td>산삼체육관</td>
                  <td>2020-10-01</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
    </div>
    
<!-- row -->

<script>
	
</script>

<c:import url="/foot"/>