<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../top.jsp" /> 

<%
	String myctx = request.getContextPath();
%>
    <!-- css파일 -->
<%--     <link rel="stylesheet" type="text/css" href="<%=myctx%>/css/clubList.css"> --%>
	<style>
	/* div{
		border : 1px solid black;
	} */
	
	#box{
		padding: 10px;
		border-radius : 5px;
		border : 2px solid lightgray;
		color: #182952;
	}
	
	.text{
		color: blue;
		font-weight : bold;
	}
	
	.text2{
		font-size: 17px;
	}
	
	#sf{
		margin-left: 60pt;
		margin-top: 30pt;
	}
	</style>

	<!-- 검색 ------------------------------------->
	<form name="sf" id="sf" action="find">	
        <div>
            <div class="col-sm-2">			
                <select id="select" class="form-control" name="findType">
                    <option value="0">::검색 유형::</option>
                    <option value="1">모임이름</option>
                    <option value="2">종목</option>
                </select>
            </div>
            <div id="select1">
                <div class="col-sm-5">
                    <input type="text" name="findKeyword" 
                    placeholder="검색어를 입력하세요." class="form-control">
                </div>
                <div class="col-sm-1">
                    <button class="btn">검색</button>
                </div>
            </div>
            <div id="select2">
                <button class="btn" value="자전거">자전거</button>
                <button class="btn" value="배드민턴">배드민턴</button>
                <button class="btn" value="테니스/스쿼시">테니스/스쿼시</button>
                <button class="btn" value="헬스/크로스핏">헬스/크로스핏</button>
                <button class="btn" value="골프">골프</button>
                <button class="btn" value="클라이밍">클라이밍</button>
                <button class="btn" value="축구/풋살">축구/풋살</button>
                <button class="btn" value="러닝/마라톤">러닝/마라톤</button>
              	<input type="hidden" id="sportsType" name="sportsType">
            </div>
        </div>
    </form>
	<!--------------------------------------->
	<form name="hf" id="hf" action="find.do">	
		<input type="hidden" name="findTypeh" value=${findType}>
		<input type="hidden" name="findKeywordh" value=${findKeyword}>
		<input type="hidden" name="sportsTypeh" value=${sportsTypeh}>
		<input type="hidden" id="cpage" name="cpage">
	</form>
	
	
	<div class="text-left" style="padding:30pt">	
		<c:if test='${findType eq 1}'> <!-- 모임이름으로 검색 -->
			<h3 style="margin-left:80px" class="text">[${findKeyword}] 검색</h3>
		</c:if>
		<c:if test='${findType eq 2}'> <!-- 종목별로 검색 -->
			<h3 style="margin-left:80px" class="text">[${sportsTypeh}] 검색</h3>
		</c:if>

	<div class="row" style="margin-top:30px; margin-left:50px">
		<c:if test="${clubList eq null or empty clubList}">
			<div class="col-sm-3">
				<h3>모임이 없어요.</h3>
			</div>
		</c:if>
		<c:if test="${clubList ne null and not empty clubList}">
		<c:forEach var="cl" items="${clubList}" varStatus="st" >
			<div class="col-sm-3">
			<div style="width:230px" id="box">
			<a href="view.do?cno=${cl.cno}"><img src="../clubimage/${cl.cimage}" class="img-rounded"
						 style="height:210px; width:210px"></a>
			<br>
			<h3>${cl.cname}<h3>
			<h5 class="text2">${cl.csports}<h5>
			<h5 class="text2">${cl.cnumber}명<h5>
		
			<c:if test="${cl.cplace ne null}">
			<h5><img src="../images/place.png" style="height:20px; width:20px">
				${cl.cplace}<h5>
			</c:if>
			</div>
			</div>
			<!-- 변경 부분 ----->
			<c:choose>
				<c:when test="${st.last}"></c:when>
				
				<c:otherwise>
				<c:if test="${st.count mod 4 == 0}"> 
					</div> <!--  row를 끝내고 새로운 row를 시작하자. -->
					<div class="row" style="margin-top:70px; margin-left:50px">
				</c:if>
				</c:otherwise>
			</c:choose>
			<!-------------->
		</c:forEach>
		</c:if>
	</div><!-- row end -->
	
	<!-- 페이징 처리  ----------------------->
	<div class="col-md-offset-4" id="paging" style="padding-left:35pt; margin-top:40pt">
	<ul class="pagination justfify-content-center">
		<c:if test="${prevBlock==0}"> 
			<script>
				$('#paging').css('paddingLeft', '100pt');
			</script>
		</c:if>
		<c:if test="${prevBlock>0}"> <!-- 이전 5개 -->
			<li class="page-item">
				<a class="page-link" onclick="goPage('${prevBlock}')"">이전 ${pagingBlock}개</a>
			</li>
		</c:if>
			
		<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}" step="1">
			<c:if test="${i<=pageCount}">
			<li class="page-item <c:if test="${cpage==i}">active</c:if>" >
				<a class="page-link" onclick="goPage('${i}')">${i}</a>
											<%-- table의 id를 bbs로 줌--%>
			</li>	
			</c:if>		
		</c:forEach>
			
		<c:if test="${nextBlock<=pageCount}"> <!-- 이후 5개 -->
			<li class="page-item">
				<a class="page-link" onclick="goPage('${nextBlock}')">이후 ${pagingBlock}개</a>
			</li>
		</c:if>	
	</ul>
	</div>
	 <!--------------------------------------->
	 
</div>
<script type="text/javascript">
	var goPage=function(i){
		$('#cpage').prop('value', i); 
		$('#hf').submit();
	}

$(function(){
	
    $('#select2').hide();

    $('.btn').click(function(){
        //alert($(this).attr('value'));  
       	var sports = $(this).val();  //위에 말고 이렇게 해야 값이 들어감 
        $('#sportsType').prop('value', sports); //hidden
    })

    $('#select').change(function(){
        var type= $('#select option:selected').val();
        
        if(type=='2'){
            $('#select1').hide();
            $('#select2').show();
        }else if(type=='1'){
            $('#select1').show();
            $('#select2').hide();
        }else if(type=='0'){
        	$('#select1').show();
            $('#select2').hide();	
        }
    });
})
</script>
<jsp:include page="../foot.jsp" /> 