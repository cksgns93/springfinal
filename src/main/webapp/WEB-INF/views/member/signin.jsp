<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/top"/>

<!-- Cookie != null 일때 -->
	<c:if test="${not empty cookie.userid}">
		<c:set value="checked" var="checked"/>
	</c:if>
<!-- ================= -->

<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center" style="font-size:5em;font-familly:fantasy">
            <strong>로그인</strong>
          </div>
        </div>
      </div>
    </div>
	      <div class="section">
	        <div class="container">
	          <div class="row">
	            <div class="col-md-12">
	              <form name="f" action="login" method="POST" class="form-horizontal" role="form">
	              <div class="form-group">
	                  <div class="col-sm-2">
	                    <label for="inputEmail3" class="control-label">ID</label>
	                  </div>
	                  <div class="col-sm-10">
	                    <input type="text" name="id" class="form-control" id="id" placeholder="아이디를 입력하세요" 
	                    value="${cookie.userid.value}" width="50%">
	                  </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-sm-2">
	                    <label for="inputPassword3" class="control-label">Password</label>
	                  </div>
	                  <div class="col-sm-10">
	                    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요">
	                  </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-sm-offset-2 col-sm-7">
	                    <div class="checkbox">
	                      <label>
	                        <input type="checkbox" name="saveId" id="saveId" ${checked}>아이디 기억하기</label>
	                    </div>
	                  </div>
	                  <div class="col-sm-3">
	                    <a>ID/P.W 찾기</a>
	                  </div>
	                </div>
	                <br>
	                <div class="form-group">
	                  <div class="col-sm-offset-2 col-sm-10">
	                    <button class="btn btn-primary" type="button" onclick="check()" style="width:100%">로그인</button>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-sm-offset-2 col-sm-10">
	                    <button class="btn btn-warning" type="button" style="width:100%;color:black;">
	                      <img src="./images/kakaologo.png">
	                      <b>카카오톡으로 로그인</b>
	                    </button>
	                  </div>
	                </div>
	                <br>
	                <div class="form-group">
	                  <div class="col-sm-offset-4 col-sm-8">
	                    <label style="font-size:0.9em">회원이 아니신가요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <a style="color:red" href="${pageContext.request.contextPath}/signup">회원가입</a>
	                    </label>
	                  </div>
	                </div>
	              </form>
	            </div>
	          </div>
	        </div>
	      </div>
<script>
	function check(){
		/*if(!f.id.value){
			alert("아이디 입력 안하나?");
			f.userid.focus;
			return;
		}
		if(!f.pwd.value){
			alert("비밀번호는 조상님이 입력하나?");
			f.password.focus;
			return;
		}
		
		f.submit();*/
		
			var id = $('#id').val();
			var pwd = $('#pwd').val();
			var saveId = $('#saveId').is(':checked');
			alert(id+'/'+pwd+'/'+saveId)
			f.submit();
	
	}
	
</script>

<c:import url="/foot"/>