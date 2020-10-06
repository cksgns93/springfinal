<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<% 
	String myctx=request.getContextPath();
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpoMan</title>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
<%-- <link rel="stylesheet" href="css/jjh.css">
<link rel="stylesheet" href="css/MatchBoard.css">
<link rel="stylesheet" href="css/Match.css">
<link rel="stylesheet" type="text/css" href="<%=myctx%>/css/top.css"> --%></head>

<style>

        /*회원가입, 로그인*/   
        #top{        
            background-color: royalblue;
            width:100%;
            height: 40pt;
        }
        
        #topin{
            float: right;
            margin-top: 13px;
            margin-right: 11px;
        }

        .top{
            text-decoration: none;
            color: white;
        }

        /*메인메뉴*/
        nav{
            display: flex; /*한 줄*/
            width: 100%;
            justify-content: center; /*리스트가 중앙에 위치*/
            background-color: royalblue;
        }

        #main-menu, .sub-menu{ /*초기화*/
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        #main-menu > li{
            float:left;
            background-color: royalblue;
        }

        #main-menu > li > a{ 
            display: block;
            padding: 20px 60px;   /*안쪽 여백*/
            font-size : 12pt;
            text-align: center;
            text-decoration: none;
            letter-spacing: 0.05em;
            border-right : 1px solid white;
            color : white;
        }

        /*서브메뉴*/
        .sub-menu{
            position: absolute;
            background: #182952;
            /*숨기기*/
            opacity: 0;
            visibility: hidden;
        }
        
        .sub-menu > li{
            padding: 16px 35px;
            /* border-bottom : 1px solid white; */
        }

        .sub-menu > li > a{
            color: white;
            text-decoration: none;
        }

        /*부모 요소 마우스 오버시 자식 요소 나타남*/
        #main-menu > li:hover .sub-menu{
            opacity : 0.9;
            visibility: visible;
            z-index:300;
        }
        
        #main-menu > li:nth-child(1) > a{
            border-left: 1px solid white;
        }

        /*매칭메뉴에서 팀 나누기*/
        #division{
            border-top: 1px solid white;
            font-size: 13pt;
        }
        
        /*로고*/
        #title{ /*글*/
            font-style: italic;
            font-family: fantasy;
            font-size: 60pt;
            margin-top: 10pt;
        }
        /*span{
            font-size: 70pt;
        }*/

        #logo{  /*사진*/
            float: left;
            margin: 10pt 20pt;
        }
    </style>
</head>

<body>
	     <div id="top">
        <div id="topin">
        	<c:if test="${loginUser eq null}">
            <a class="top" href="<%=myctx%>/signin">로그인</a> | 
            </c:if>
            <c:if test="${loginUser ne null}">
        	<label class="top" >${loginUser.name}님 로그인 중...</label>
            <a class="top" href="<%=myctx%>/logout">로그아웃</a> | 
            </c:if> 
            <a class="top m-1" href="<%=myctx%>/signup">회원가입</a>  
        </div>
    </div>
    <div style="clear:both">
        	<a href="<%=myctx%>/index"><img id="logo" src='<%=myctx%>/images/logo.png'></a>
    </div>
    <!-- 메뉴바 -->
    
    <nav role="navigation">
    <ul id="main-menu">
        <li><a href="<%=myctx%>/matchBoard">매칭</a>
            <ul class="sub-menu">
                <li><a href="<%=myctx%>/matchBoard">매칭 게시판</a></li>
                <li><a href="<%=myctx%>/matchAdd">매칭 등록</a></li>
            </ul>
        </li>
        <li><a href="<%=myctx%>/matchBoard">팀</a>
            <ul class="sub-menu">
                <li><a href="<%=myctx%>/teamBoard">팀 게시판</a></li>
                <li><a href="<%=myctx%>/teamAdd">팀 만들기</a></li>
            </ul>
        </li>
        <li><a href="#">모임</a>
            <ul class="sub-menu">
                <li><a href="<%=myctx%>/club/list">모임 게시판</a></li>
                <li><a href="<%=myctx%>/club/add">모임 만들기</a></li>
            </ul>
        </li>

        <li><a href="#">마이페이지</a>
        <ul class="sub-menu">
            <li class="ml-4 mr-4">
            <a href="<%=myctx%>/mypage/mydata">
			&emsp;&emsp;나의 정보 &emsp;&emsp;</a></li>

            <li class="ml-4 mr-4">
            <a href="<%=myctx%>/mypage/mymatch">
			&emsp;&emsp;&nbsp;My 매칭 &nbsp;&emsp;&emsp;</a></li>
            
            <%--  <li class="ml-4 mr-4">
            <a href="<%=myctx%>/mypage/myteamselect">
			&emsp;&emsp;My 팀 &emsp;&emsp;</a></li> --%>
        </ul>
        </li>
    </ul>
    </nav>
<script>

</script>