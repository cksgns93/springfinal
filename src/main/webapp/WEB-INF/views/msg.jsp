<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	//String msg=(String)request.getAttribute("message");
	//String loc=(String)request.getAttribute("loc");
	~ 자바는 jsp에서 잘 안씀 왜냐하면? jsp는 보통 디자인 하시는분들이 하는데
	~ jsp에서 자바 식을 써서 디자인하시는분들에게 가면 잘못만져서 오류나면 리콜을
	~ 당하기때문이다~
	//request,session, application에 저장한 값들을 el 표현식으로 출력해 사용할 수 있다.
	//el 표현식 ${key} =>key에 해당하는 value값을 출력하란 의미
--%>

<script>
	alert('${message}');
	//insert서블릿에서 밑에있는 키값을 넣어줌
	location.href='${loc}';
	<%-- el 표현식이라고 함 --%>
</script>