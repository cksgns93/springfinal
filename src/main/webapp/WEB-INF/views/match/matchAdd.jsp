<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/top"/>

<c:set var="myctx" value="${pageContext.request.contextPath }" />

<form class="form-horizontal" name="f" role="form" action="matchAddEnd">
<input type="hidden" name="idx" id="idx"value="${loginUser.idx }">
   <table>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="text-center">매칭 등록</h1>
               </div>
            </div>
            <div class="row  justify-content-center">
               <div class="col-md-12">
                  <div class="form-group">
                     <div class="col-sm-2">
                        <img src="images/BS.png" />
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-2">
                        <label for="text" class="control-label" >팀 번호</label>
                     </div>
                     <div class="col-sm-2">
                        <input type="number" class="form-control" name="tno" id="tno"
                           placeholder="TeamNumber" value="${tvo.tno}" readonly>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-2">
                        <label for="input" class="control-label">종목</label>
                     </div>
                     <div class="col-sm-4">
                        <input type="text" class="form-control" name="game" id="game"
                           placeholder="종목을 입력하여 주세요" value="${tvo.tsports}">
                     </div>
                  </div>
               
               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">게시물이름</label>
                  </div>
                  <div class="col-sm-3">
                     <input type="text" class="form-control" name="mname" id="mname"
                        placeholder="ContentName">
                  </div>
               </div>

               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">팀 이름</label>
                  </div>
                  <div class="col-sm-3">
                     <input type="text" class="form-control" name="away" id="away"
                        placeholder="TeamName" value="${tvo.tname}">
                  </div>
               </div>

               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">팀 실력</label>
                  </div>
                  <div class="col-sm-3">
                     <input type="text" class="form-control" name="tlevel" id="tlevel"
                        placeholder="Level">
                     <p class="text-danger">냉정한 본인 팀 실력을 적어주세요</p>
                  </div>
               </div>


               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">팀 소개</label>
                  </div>
                  <div class="col-sm-3">
                     <textarea rows="10" class="form-control" cols="30" name="mcontent">   
                     </textarea>            
                  </div>
               </div>
               
               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">구단 연락처</label>
                  </div>
                  <div class="col-sm-1">
                     <input type="text" class="form-control" name="ph1" id="ph1" placeholder="Ph1">
                  </div>
                  <div class="col-sm-1">
                     <input type="text" class="form-control" name="ph2" id="ph2" placeholder="Ph2">
                  </div>
                  <div class="col-sm-1">
                     <input type="text" class="form-control" name="ph3" id="ph3" placeholder="Ph3">
                  </div>
               </div>
               
               

               <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="control-label">경기장 이름</label>
                  </div>
                  <div class="col-sm-4">
                     <input type="text" class="form-control" name="addr" id="addr">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </table>
   
   <div class="section">
      <div class="container">
         <div class="row">
            <div class="col-md-6">
               <button type="button" onclick="mtcheck()">매치 등록!!</button>
            </div>
         </div>
      </div>
   </div>

</form>
<!-- ------------------------------------------------------------------ -->
<c:import url="/foot"/>
<script>
   function mtcheck(){
      if(!f.game.value){
         alert("종목을 입력하여 주세요");
         f.game.focus();
         return;
      }
      if(!f.mname.value){
         alert("게시물 제목을 입력하여 주세요");
         f.mname.focus();
         return;
      }
      if(!f.away.value){
         alert("팀명을 입력하여 주세요");
         f.away.focus();
         return;
      }
      if(!f.tlevel.value){
         alert("팀실력을 입력하여 주세요");
         f.tlevel.focus();
         return;
      }
      if(f.mcontent.value==0){
         alert("팀소개를 입력하여 주세요");
         f.mcontent.focus();
         return;
      }
      if(!f.ph1.value){
         alert("전화번호를 입력하여 주세요");
         f.ph1.focus();
         return;
      }
      if(!f.ph2.value){
         alert("전화번호를 입력하여 주세요");
         f.ph2.focus();
         return;
      }
      if(!f.ph3.value){
         alert("전화번호를 입력하여 주세요");
         f.ph3.focus();
         return;
      }
      if(!f.addr.value){
         alert("경기장 이름을 입력하여 주세요");
         f.addr.focus();
         return;
      }
      f.submit();
   }
</script>