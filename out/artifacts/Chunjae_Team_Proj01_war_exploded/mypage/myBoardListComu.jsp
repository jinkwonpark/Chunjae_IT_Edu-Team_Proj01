<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path8 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가쓴글-comunity</title>

    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path8 %>/css/google.css">
    <link rel="stylesheet" href="<%=path8 %>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path8 %>/css/common.css">
    <link rel="stylesheet" href="<%=path8 %>/css/hd.css">
    <style>
        .contents { clear:both; height:100vh;}
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .content_tit {text-align: center;}

        .content_header { clear: both; height: 250px; background-image: url("/images/mypage_cover.jpg");
            background-repeat: no-repeat; background-position:center -300px;
            background-size: cover; }
        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .box_myboard {display: block;  width:1000px; height: 80px; margin-left: 350px; margin-top: 50px;
            margin-bottom: 25px;}
        .btn_myboard { display: block; float: left; border-radius:100px; min-width: 200px;
            padding-left: 24px; padding-right: 24px; margin-right: 50px; text-align: center;
            line-height: 50px; background-color: deepskyblue;color: #fff;font-size: 25px; text-decoration: none;}

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:yellowgreen; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; text-decoration: none;}
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path8 %>/css/footer.css">

</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 마이페이지 </span> &gt; <span> 내가 쓴 글 </span> </p>
                <h2 class="page_tit"> 내가 쓴 글 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="box_myboard">
                    <a href="myBoardListQna.jsp" class="btn_myboard">QnA</a>
                    <a href="myBoardListComu.jsp" class="btn_myboard">커뮤니티</a>
                </div>
                <hr>
                <br><br><h2 class="content_tit"> 내가 쓴글 </h2>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">번호</th>
                    <th class="item2">제목</th>
                    <th class="item3">글쓴이</th>
                    <th class="item4">작성일</th>
                    <th class="item5">조회</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="item1">1</td>
                        <td class="item1">제목1</td>
                        <td class="item1">글쓴이1</td>
                        <td class="item1">작성일</td>
                        <td class="item1">조회수</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>