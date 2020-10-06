<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../top.jsp" />

<style>
.carousel-item img {
	width: 100%;
}

</style>
<%
	String myctx=request.getContextPath();
	//컨텍스트명을 동작으로 알아내자.
	//세션에 저장된 loginUser가 있는지 꺼내보자.
%>

<c:set var="myctx" value="${pageContext.request.contextPath}"/>
<!-- carousel------------------------------------------------- -->
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
    </div>
<!-- carousel---끝---------------------------------------------- -->

<!-- search---------------------------------------------------- -->
<div class="container mt-3" style="margin-top:10pt">
	<form>
		<div class="input-group mt-3 mb-3">
			<div class="input-group-prepend">
				<button type="button"
					class="btn btn-outline-secondary dropdown-toggle"
					data-toggle="dropdown">::카테고리::</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">팀 명</a> <a
						class="dropdown-item" href="#">팀 실력</a>
						 <a class="dropdown-item"href="#">등록 시간</a>
				</div>
			</div>
			<input type="text" class="form-control" placeholder="Search">
			
			<input type="hidden" id="cpage" name="cpage" value="${cpage}">
		</div>
	</form>
</div>
<!-- search---------------------------------------------------- -->
<!-- table--------------------------------------------------------------------------- -->
<div id="mmlist" class="container">      

</div>
<!-- table--------------------------------------------------------------------------- -->

<!-- foot~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<jsp:include page="../foot.jsp" />
<script>
	$(function(){
		getAllList();
	})
	
	var getAllList= function(){
      $.ajax({
         type:'get',
         url:'teamList?cpage='+${cpage},
         dataType:'html',//text, html, xml, json ...
         cache: false,
         success:function(res){
            $("#mmlist").html(res);
         },
         error:function(err){
            alert('error: '+err.status);
         }
      });
   }
</script>