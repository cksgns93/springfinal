<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../top.jsp" />

<style>
	.carousel-item img {
		width: 100%;
	}
	#category{
		margin-top: 50pt;
		margin-left: 13pt; /* 
		border: 2px solid #3b60e9;*/
		padding: 5pt 20pt 20pt 20pt;
		width: 70%;
		border-radius: 10px;	
	}
	
	.mybtn{
		background-color: #3b60e9;
		border: 2px solid white;
		padding:10px;
		font-size: 14pt;
		font-weight: bold;
		color: white;
		border-radius: 5px;
		margin-left: 10pt;
		width: 100pt;
	}
	
	#cname{
		color: blue;
		margin-left: 16px;
		font-weight: bold;
	}
</style>
<%
	String myctx = request.getContextPath();
//컨텍스트명을 동작으로 알아내자.
//세션에 저장된 loginUser가 있는지 꺼내보자.
%>
   <div id="fullcarousel-example" data-interval="false" class="carousel slide"
    data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active">
          <img src="images/main1.png">
          <div class="carousel-caption">
            <h2>매칭 게시판</h2>
            <p></p>
          </div>
        </div>
        <div class="item">
          <img src="images/main2.png">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
        <div class="item">
          <img src="images/main3.png">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
      <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
    </div><!-- carousel 끝 -->

<!-- search---------------------------------------------------- -->
<form name="f" id="f">
	<div class="container">
		<div id="category">
			<h4 id="cname">종목 선택</h4>
			<button type="button" class="mybtn" value="축구/풋살">축구/풋살</button>
			<button type="button" class="mybtn" value="농구">농구</button>
			<button type="button" class="mybtn" value="야구">야구</button>
			<button type="button" class="mybtn" value="족구">족구</button>
		</div>
		<div class="row form-group" style="margin:30pt">
			<div class="col-md-3">
				<select class="form-control" class="form-control" name="findType">
					<option value=0>::검색 유형::</option>
					<option value=1>팀	명</option>
					<option value=2>지	역</option>
					<option value=3>팀   실력</option>
					<!-- <option value=4>종	목</option> -->
				</select>
			</div>
			<div class="col-md-6">
				<div class="input-group">
				<input type="text" class="form-control" name="findKeyword"  
				 placeholder="Search">
				 <div class="input-group-btn">
					<button type="button"
						onclick="goFind()"class="btn btn-primary">검색
					</button>
				</div>
				</div>
			</div>
			
			<!-- 페이징 -->
			<input type="hidden" id="cpage" name="cpage" value="${cpage}">
			<input type="hidden" id="selSports" name="selSports">
		</div>
	</div>
</form>
<!-- search---------------------------------------------------- -->

<!-- table--------------------------------------------------------------------------- -->
<div id="mmlist" class="container"></div>
<!-- table--------------------------------------------------------------------------- -->


<!-- foot~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<jsp:include page="../foot.jsp" />
<script>
	$(function() {
		getAllList();
	})
	
	var getAllList = function() {
		$.ajax({
			type : 'get',
			url : 'matchList?cpage='+${cpage},
			dataType : 'html',//text, html, xml, json ...
			cache : false,
			success : function(res) {
				$("#mmlist").html(res);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		});
	}
	
	var goFind = function(i) {
		//alert(paramData);
		if( $('#selSports').val()==""){
			alert('종목을 먼저 선택해주세요.');
			return;
		}
		
		if(typeof i == "undefined"){
			//cpage가 없을 때 (처음)
		}else{
			$('#cpage').val(i);
		}
		
		var paramData=$('#f').serialize();
		
		$.ajax({
			type : 'post',
			url : 'matchFind',
			data: paramData,
			dataType : 'html',//text, html, xml, json ...
			cache : false,
			success : function(res) {
				$("#mmlist").html(res);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		});
	}
	
	
	$('.mybtn').click(function(){
        //alert($(this).attr('value')); 
        //클릭된 버튼 디자인 변경
        $(this).css('backgroundColor','white');
        $(this).css('color','#3b60e9');
        $(this).css('border','2px solid #3b60e9');
        
        //클릭된 버튼 이외의 버튼 디자인 원래대로 
        $('.mybtn').not($(this)).css('backgroundColor', '');
        $('.mybtn').not($(this)).css('color', '');
        $('.mybtn').not($(this)).css('border', '');
        
        //선택한 버튼 값 저장
        var selSports = $(this).val(); 
        $('#selSports').prop('value', selSports); //hidden
        
        goFindCate();
    })
	
    var goFindCate = function(i) {
		
		if(typeof i == "undefined"){
			//cpage가 없을 때 (처음)
		}else{
			$('#cpage').val(i);
		}
		
        var paramData=$('#f').serialize();
        
		$.ajax({
			type : 'post',
			url : 'matchFindCate',
			data: paramData,
			dataType : 'html',//text, html, xml, json ...
			cache : false,
			success : function(res) {
				$("#mmlist").html(res);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		});
	}
</script>