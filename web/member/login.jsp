<%@ page import="javax.xml.xpath.XPathEvaluationResult" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path43 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path43%>/css/google.css">
    <link rel="stylesheet" href="<%=path43%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path43%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="./jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="<%=path43%>/css/lib/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="<%=path43%>/css/common.css">
    <link rel="stylesheet" href="<%=path43%>/css/header.css">
    <link rel="stylesheet" href="<%=path43%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path43%>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 로그인 </span> </p>
                <h2 class="page_tit"> 로그인 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="login-wrapper">
                <h2 style="font-size: 20px">로그인 하시겠습니까?</h2>
                <br>
                <br>
                <form method="post" action="<%=path43%>/member/loginpro.jsp" id="login-form">
                    <input type="text" name="id" placeholder="아이디" autofocus required>
                    <div class="container">
                        <input type="password" id="pw" name="pw" placeholder="비밀번호" class="active" required>
                        <input type="button" id="showpw" class="showpw" value="비밀번호 확인하기">
                    </div>
                    <input type="submit" value="Login">
                </form>
                <script>
                    $(function(){
                        $('#showpw').on('click',function (){
                            $('#pw').toggleClass('active');
                            if ($('#pw').hasClass('active')){
                                $('#pw').prop('type','text');
                            } else {
                                $('#pw').prop('type','password');
                            }
                        });
                    });
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>