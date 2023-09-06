<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../setting/encoding.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path6 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 개인 정보 변경 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path6%>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path6%>/css/common.css">
    <link rel="stylesheet" href="<%=path6%>/css/header.css">
    <link rel="stylesheet" href="<%=path6%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path6%>/css/mgmt.css">
    <link rel="stylesheet" href="<%=path6%>/css/footer.css">
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

        .page {
            clear:both;
            width: 100%;
            min-height: 90vh;
            position:relative;
            top: 50px;
            margin: 0px auto;
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

        .tb1 {
            margin: 30px auto;
            width: 80%;
        }

        .tb1 tr td {
            height: 55px;
            line-height: 55px;
            text-align: center;
        }

        .tb1 tr td:first-child {
            width: 20%;
        }

        .tb1 tr td input {
            width: 95%;
            height: 85%;
            font-size: 13pt;
            padding-left: 10px;
        }

        .tb1 tr td:last-child {
            text-align: right;
        }

        .tb1 tr td .submit_btn {
            width: 200px;
            height: 100%;
            border-radius: 30px;
            margin-top: 20px;
            background-color: #8CB964;
            border: #8CB964;
            color: #fff;
            font-weight: bold;
        }
    </style>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT id, pw, name, email, tel, resdate FROM member WHERE id='admin'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    con.close(rs, pstmt, conn);

    Member member = new Member();
    if(rs.next()) {
        member.setId(rs.getString("id"));
        member.setPw(rs.getString("pw"));
        member.setName(rs.getString("name"));
        member.setEmail(rs.getString("email"));
        member.setTel(rs.getString("tel"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        member.setResdate(sdf.format(d));
    }
%>
</head>
<body>
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="/layout/header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="content_header">
                <div class="breadcrumb">
                    <p><a href="<%=path6 %>">Home</a> &gt; <a href="<%=path6 %>/admin/adminPage.jsp">관리자 페이지</a> &gt; <span> 개인 정보 변경 </span> </p>
                    <h2 class="page_tit"> 관리자 페이지 </h2>
                </div>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="content_tit"> 개인 정보 변경 </h2>
                    <hr>
                    <form action="<%=path6%>/admin/modifyInfopro.jsp" method="post">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <td><label for="id"> 아이디 </label> </td>
                                <td><input type="text" id="id" name="id" value="<%=member.getId()%>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="name"> 이름 </label></td>
                                <td><input type="text" id="name" name="name" value="<%=member.getName()%>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="email"> 이메일 </label></td>
                                <td><input type="text" id="email" name="email" value="<%=member.getEmail()%>" required></td>
                            </tr>
                            <tr>
                                <td><label for="tel"> 전화번호 </label></td>
                                <td><input type="tel" id="tel" name="tel" value="<%=member.getTel()%>"></td>
                            </tr>
                            <tr>
                                <td><label for="regdate"> 가입일 </label></td>
                                <td><input type="text" id="regdate" name="regdate" value="<%=member.getResdate()%>" readonly></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="정보 수정" class="submit_btn">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="/layout/footer.jsp" %>
        </footer>
        <script>
            <% if(sid == null || !sid.equals("admin")) { %>
            alert("관리자만 접근 가능한 페이지입니다.");
            history.go(-1);
            <% } %>
        </script>
    </div>
</body>
</html>
