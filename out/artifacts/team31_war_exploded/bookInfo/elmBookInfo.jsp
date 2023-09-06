<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    String path19 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>초등 교재의 소개</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path19%>/css/google.css">
    <link rel="stylesheet" href="<%=path19%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path19%>/css/login.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path19%>/css/common.css">
    <link rel="stylesheet" href="<%=path19%>/css/header.css">
    <link rel="stylesheet" href="<%=path19%>/css/footer.css">


    <style>
        /*breadcrumb*/
        .content_header {
            clear: both;
            width: 100%;
            height: 250px;
            background-image: url("../images/mypage_cover.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
            margin-top: 40px;
        }

        .page_tit {
            font-size:48px;
            text-align: center;
            padding-top:1em;
            color:#fff;
            padding-bottom: 2.4rem;
            margin-left: 450px;
        }

        .breadcrumb {
            clear:both;
            width:1200px;
            margin: 0 auto;
            text-align: right;
            color:#fff;
            padding-top: 28px;
            padding-bottom: 28px;
        }

        .breadcrumb a {
            color:#fff;
        }

        /*contents*/
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 1000px;
        }

        .contents{
            margin-top: 20px;
        }
        ul.list.row {
            width : 900px
        }
        .row{
            display: flex;
            flex-wrap: wrap;
            margin: auto;

        }
        div .card {
            margin: 25px auto;
        }

        .col-3 {
            width: 300px;
            height: 300px;
        }

        .card-text{
            height: 50px;
        }
        .card-body {
            height: 150px;
        }
        .btn {
            margin-top: 10px;
            background-color: #8CB964;
            border-color: #8CB964;

        }
        .card-img-top {
            height: 130px;
        }

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
                <h2 class="page_tit"> 초등 교재 소개 </h2>
            </div>
        </div>
        <div class="container">
            <div class="box_wrap">
                <ul class="list row">
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book01.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 국어</h5>
                                <p class="card-text">술술 읽기</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book02.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 국어</h5>
                                <p class="card-text">받아쓰기</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book03.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 국어</h5>
                                <p class="card-text">초등 한자</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book04.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 영어</h5>
                                <p class="card-text">기초 Phonics</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book01.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 영어</h5>
                                <p class="card-text">귀가 트이는 English listening</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book02.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 영어</h5>
                                <p class="card-text">영어 동화책 시리즈</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book03.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 수학</h5>
                                <p class="card-text">기초부터 차근차근 수학 익히기</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book04.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 수학</h5>
                                <p class="card-text">사칙연산 심화편</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path19%>/images/book01.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">초등 수학</h5>
                                <p class="card-text">구구단을 외자</p>
                                <a href="#" class="btn btn-primary">구매하기</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>