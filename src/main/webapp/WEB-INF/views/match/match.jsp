<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:import url="/top"/>
  <body>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
            class="center-block img-circle img-responsive">
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center text-primary">${vo.away}</h1>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p class="text-center">HOME</p>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputEmail3" class="control-label">종목</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" value="${vo.game}" placeholder="sport" readonly>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">게시물이름</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" value="${vo.mname}" class="form-control" id="inputPassword3" placeholder="contentName" readonly>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">팀 실력</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="${vo.tlevel}" id="inputPassword3" placeholder="Level" readonly>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">팀 소개</label>
                </div>
                <div class="col-sm-10">
                  <textarea class="form-control" id="inputPassword3" rows="10" placeholder="content" readonly>${vo.mcontent}</textarea>
                </div>
              </div>
              
              <div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">구단 연락처</label>
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" value="${vo.hp1}" name="ph1" id="ph1" placeholder="Ph1">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" value="${vo.hp2}" name="ph2" id="ph2" placeholder="Ph2">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" value="${vo.hp3}" name="ph3" id="ph3" placeholder="Ph3">
						</div>
					</div>
              
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">경기장 이름</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="${vo.addr}" id="inputPassword3" placeholder="placeName" readonly>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <br>
            <br>
            <form action="mtstart" method="post">
            	<!-- 글쓴 사람의 매치글번호 -->
            	<input type="hidden" id="bidx" name="bidx" value="${vo.mno}"> 
            	<!-- 매치 신청하는 사람의 회원번호 -->
            	<input type="hidden" id="amno" name="amno" value="${loginUser.idx}">
            	<button class="btn btn-lg btn-primary" >매치 신청</button>
            </form>
          </div>
        </div>
      </div>
    </div>
<c:import url="/foot"/>
