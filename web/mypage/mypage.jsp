<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path73 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");
    int per = (Integer) session.getAttribute("per");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    Member m = new Member();
    String sql = "select * from member where id=? ";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    if(rs.next()){
        m.setId(rs.getString("id"));
        m.setPw(rs.getString("pw"));
        m.setName(rs.getString("name"));
        m.setEmail(rs.getString("email"));
        m.setTel(rs.getString("tel"));
        m.setResdate(rs.getString("resdate"));
        m.setPoint(rs.getInt("point"));
        m.setPer(rs.getInt("per"));
    }else{
        response.sendRedirect(path73+"/member/login.jsp");
    }
    conn.close(rs, pstmt, con);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path73%>/css/google.css">
    <link rel="stylesheet" href="<%=path73%>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path73%>/css/common.css">
    <link rel="stylesheet" href="<%=path73%>/css/header.css">
    <style>
        .contents {
            clear:both;
            min-height:100vh;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .content_header {
            clear: both;
            height: 250px;
            background-image: url("../images/mypage_cover.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
        }

        .page_tit {
            font-size:48px;
            text-align: center;
            padding-top:1em;
            color:#fff;
            padding-bottom: 2.4rem;
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

        .page {
            clear:both;
            width: 100%;
            min-height: 90vh;
            position:relative;
            top: 50px;
        }
        .page::after {
            content:"";
            display:block;
            width: 100%;
            clear:both;
        }
        .page_wrap {
            clear:both;
            width: 1000px;
            height: auto;
            margin:0 auto;
        }

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 50px 30px 30px 10px;
        }

        .item_wrap {
            width: 100%;
        }

        .item_wrap .item {
            display: block;
            float: left;
            margin: 15px;
            padding: 15px;
            box-sizing: border-box;
            width: 300px;
            height: 270px;
            border: 1px solid #333;
            text-decoration: none;
            text-align: center;
            color: #333;
            font-size: 20px;
            transition: 0.3s;
        }

        .item_wrap .item:hover {
            box-shadow: 5px 5px 0px #ddd;
        }

        .item_wrap .item img {
            width: 100%;
            height: auto;
            margin-bottom: 30px;
        }
    </style>

    <link rel="stylesheet" href="<%=path73%>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 마이페이지 </span> </p>
                <h2 class="page_tit"> 마이페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 안녕하세요, <%=m.getName() %>님! </p>
                <hr>
                <div class="item_wrap">
                    <a href="<%=path73%>/mypage/modify.jsp" class="item"><img src="<%=path73%>/images/mypage_info.jpg" alt="개인정보 변경 이미지"><br> 개인정보 변경 </a>
                    <a href="<%=path73%>/mypage/myBoardListQna.jsp?page=1" class="item"><img src="<%=path73%>/images/mypage_write.jpg" alt="내가쓴 글 이미지"><br> 내가 쓴 글 </a>
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