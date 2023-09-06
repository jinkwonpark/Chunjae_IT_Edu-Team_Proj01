<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="/setting/encoding.jsp"%>
<%
    String path35 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 서비스 소개 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path35 %>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path35 %>/css/common.css">
    <link rel="stylesheet" href="<%=path35 %>/css/header.css">
    <link rel="stylesheet" href="<%=path35 %>/css/content_header.css">
    <link rel="stylesheet" href="<%=path35 %>/css/footer.css">

    <style>
        .contents { clear:both; min-height:100vh;}
        .contents::after {content:"";clear:both;display:block;width:100%;}

        .page {clear:both;width: 100%;min-height: 100vh;position:relative; margin: 0px auto; background-color: rgb(203, 226, 240);}
        .page::after {content:"";display:block;width: 100%;clear:both;}
        .page_wrap {clear: both;
            position: absolute;
            top: -50px;
            left: 50%;
            width: 1300px;
            padding-bottom: 300px;
            margin-left: -670px;}

        #page1 {height : 1240px; padding-top: 46px;}

        #service_tit {display: block;
            margin-left: 410px;
            margin-top: 85px;}
        #study1 {margin-left:100px; width:300px; padding-top:50px;}
        #study2 {margin-left:100px; width:300px; padding-top:50px;}
        #study3 {margin-left:100px; width:300px; padding-top:50px;}
        #service_stu {width:70px; height: 70px; position:absolute; top:309px; left:480px;}
        #service_par { width:70px; height: 70px; position:absolute; top:309px; left:730px;}

        #pic_cont3 { display: block; margin-left:400px; padding-top:100px; }
        #pic_a1 { text-decoration: none; color : #636262; background-color: burlywood; font-size:25px; border-radius: 80px;
            padding-left:100px; padding-right: 100px; font-weight: bold; padding-top:20px; padding-bottom: 20px;
            position: absolute; top:1000px; left:450px;}
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path35 %>">Home</a> &gt; <span> 서비스 소개 </span> </p>
                <h2 class="page_tit"> 서비스 소개 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="service_page1">
                    <img src="<%=path35 %>/images/sss.png" id="service_tit" />
                    <img src="<%=path35 %>/images/s1.png" />
                    <img src="<%=path35 %>/images/s2.png" />
                    <img src="<%=path35 %>/images/students.png" id="service_stu"/>
                    <img src="<%=path35 %>/images/parents.png" id="service_par"/>
                    <img src="<%=path35 %>/images/s3.png" />
                    <div>
                    <img src="<%=path35 %>/images/study.jpg" class="rounded float-start" id="study1">
                    <img src="<%=path35 %>/images/study.jpg" class="rounded float" id="study2">
                    <img src="<%=path35 %>/images/study.jpg" class="rounded float" id="study3"></div>
                </div>
                <div class="service_cont">
                    <img src="<%=path35 %>/images/compare.png" id="pic_cont3" />
                    <div><a href="<%=path35 %>/member/join.jsp" id="pic_a1"> 회원가입 →</a></div>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>