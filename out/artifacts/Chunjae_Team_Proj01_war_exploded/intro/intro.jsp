<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path34 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path34%>/css/google.css">
    <link rel="stylesheet" href="<%=path34%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path34%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path34%>/css/common.css">
    <link rel="stylesheet" href="<%=path34%>/css/header.css">
    <link rel="stylesheet" href="<%=path34%>/css/intro.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            /* background-image: url("../../images/bg_visual_overview.jpg"); */
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

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

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { width:150px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:650px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:600px; height: 48px; line-height: 48px;
            padding:14px; font-size:18px; }
        .indata2 { width: 600px; padding: 14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path34%>/css/footer.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="sub_wrap">
        <section class="sub_sec" id="sub01">
            <div class="sub_con">
                <div class="sub_title_wrap">
                    <h2>
                        <b>CornEdu</b>
                    </h2>
                </div>
                <div class="sub01_pt_wrap">
                    <div class="sub01_pt pt_lt">
                        <div class="sub01_pt_txt_in">
                            <h3>
                                Give daily pleasure through EDU<br/> <strong>보다 나은 교육의
                                <span>첫걸음</span>
                                <br>
                                <br>

                            </strong>
                                <strong>그 길을 CornEDU와 함께 하겠습니다!</strong>
                            </h3>
                            <div class="sub01_dia">
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <section class="sub_sec" id="sub02">
        <div class="sub_con">
            <div class="sub02_title_wrap">
                <h2>CornEdu의 비전</h2>
            </div>
            <div class="sub02_pt_wrap">
                <div class="sub02_pt pt01">
                    <h3>VISON 01</h3>
                    <h4>혁신</h4>
                    <p>
                        혁신적이고 <span>새로운 방식의</span><br>교육 환경을 제공
                    </p>
                </div>
                <br>
                <br>
                <div class="sub02_pt pt02">
                    <h3>VISION 02</h3>
                    <h4>지속가능</h4>
                    <p>
                        앞으로의 미래세대를 <span>위해 </span>지속 가능한 교육을 목표
                    </p>
                </div>
                <br>
                <br>
                <div class="sub02_pt pt03">
                    <h3>VISION 03</h3>
                    <h4>글로벌</h4>
                    <p>
                        글로벌 인재로써 <span>성장 가능성을 넓히는 </span>글로벌 인재 양성
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section class="sub_sec" id="sub03">
        <div class="sub_con">
            <div class="sub_title_wrap">
                <h2>회사개요</h2>
            </div>
            <div class="sub03_pt_up">
                <div class="sub03_pt_lf">
                    <div class="sub03_img_box"></div>
                    <span>FUTRURE INNOVATED, INNOVATION <strong>REALIZED</strong></span>
                </div>
                <div class="sub03_pt_rt">
                    <div class="sub03_txt">
                        <h3>CornEdu는</h3>
                        <p>혁신적인 CornEdu만의 교육 경험과 지속 가능한 교육을 통해 학생들에게 삶의 풍요로움을 더하는 교육 서비스를 제공합니다.</p>
                    </div>
                </div>
                <!--.sub03_pt_rt-->
            </div>
            <div class="sub03_pt_low">
                <div class="sub03_pt_box">
                    <p class="sub03_pt">
                        <span class="pt_title">소재지</span> <span class="pt_txt">서울특별시 금천구 가산동 마리오아울렛 2관 사무동 11층</span>
                    </p>
                    <p class="sub03_pt">
                        <span class="pt_title">연락처</span> <span class="pt_txt">Tel.
								080-1234-5678/ Fax. 080-1234-5678</span>
                    </p>
                </div>
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