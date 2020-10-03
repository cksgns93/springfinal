<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/top"/>

<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">회원가입</h1>
          </div>
        </div>
      </div>
</div>

<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            
            <form role="form" name="f" action="join" method="post">
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">ID</label>
                <input class="form-control" name="id" id="userid" placeholder="아이디 입력하세요"
                type="text">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">비밀번호</label>
                <input class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요"
                type="password">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">비밀번호 확인</label>
                <input class="form-control" name="pwdc" id="pwdcheck" placeholder="비밀번호를 한번 더 입력하세요"
                type="password">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">비밀번호 찾기/질문</label>
                <input class="form-control" name="question" id="question" type="text" placeholder="나는?">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">비밀번호 찾기/답변</label>
                <input class="form-control" name="answer" id="answer" type="text" placeholder="나">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">이름</label>
                <input class="form-control" name="name" id="name" placeholder="이름을 입력하세요"
                type="text">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">성별</label>
                <input class="form-control" name="gender" id="gender" type="text">
              </div>
              
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">생년월일</label>
                <input class="form-control" name="birth" id="birth" type="text" placeholder="생년월일  6자리를 입력하세요">
              </div>
                
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">휴대폰 번호</label>
                <input class="form-control" name="hp1" id="hp1" type="text">-
                <input class="form-control" name="hp2" id="hp2" type="text">-
                <input class="form-control" name="hp3" id="hp3" type="text">
              </div>
              
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">활동 지역</label>
                <input class="form-control" name="loc" id="loc" type="text">
              </div>
              <div class="form-group">
                <label class="control-label" for="mark">프로필 사진</label>
                <input class="form-control" name="mark" id="mark" type="file">
              </div>
              
              <button type="button" onclick="check()" class="btn btn-default">회원 가입</button>
            </form>
          </div>
        </div>
      </div>
    </div>

<script>
	function check(){
		if(!f.userid.value){
			alert("아이디를 입력하세요");
			f.userid.focus();
			return;
		}
		if(!f.pwd.value){
			alert("비밀번호를 입력하세요");
			f.pwd.focus();
			return;
		}
		if(!f.pwdc.value||f.pwdc.value!=f.pwd.value){
			alert("위 비밀번호와 일치 하지않습니다.\r\n다시 시도해 주시기 바랍니다.");
			f.pwd.focus();
			f.pwd.select();
			f.pwdc.value="";
			return;
		}
		if(!f.name.value){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if(!f.name.value){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if(!f.question.value){
			alert("질문 적으세요");
			f.question.focus();
			return;
		}
		if(!f.answer.value){
			alert("질문에 대한 답변 적으세요");
			f.answer.focus();
			return;
		}
		if(!(f.hp1.value)){
			alert("폰번호를 제대로 적으시요");
			f.hp1.focus();
			return;
		}
		if(!(f.hp2.value)){
			alert("폰번호를 제대로 적으시요");
			f.hp2.focus();
			return;
		}
		if(!(f.hp3.value)){
			alert("폰번호를 제대로 적으시요");
			f.hp3.focus();
			return;
		}
		if(!f.loc.value){
			alert("활동지역을 적으세오");
			f.loc.focus();
			return;
		}
		f.submit();
	}

</script>

<c:import url="/foot"/>