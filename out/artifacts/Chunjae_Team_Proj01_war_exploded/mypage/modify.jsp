<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path45 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(con != null){
        System.out.println("DB 연결 성공");
    }

    Member m = new Member();
    String pw="";
    try{
        String sql = "select * from member where id=?";
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

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            m.setResdate(sdf.format(d));
            pw=m.getPw();
        }else{
            response.sendRedirect("/member/login.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally{
        conn.close(rs, pstmt, con);
    }

    String pw2 = pw.substring(0,2);
    for(int i=0; i<pw.length()-2;i++){
        pw2 += "*";
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path45 %>/css/google.css">
    <link rel="stylesheet" href="<%=path45 %>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path45 %>/css/common.css">
    <link rel="stylesheet" href="<%=path45 %>/css/header.css">
    <link rel="stylesheet" href="<%=path45%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path45%>/css/mgmt.css">
    <style>
        .contents { clear:both; min-height:100vh; }
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .page { clear:both; width: 100%; min-height: 90vh; position:relative; top: 50px; }
        .page::after { content:""; display:block; width: 100%; clear:both; }
        .page_wrap { clear:both; width: 1000px; height: auto; margin:0 auto; }

        .content_tit { font-weight: bold; font-size: 25px; margin: 50px 30px 30px 10px; }

        .tb1 { margin: 30px auto; width: 80%;}

        .tb1 tr td {height: 55px;line-height: 55px;text-align: center;}

        .tb1 tr td:first-child {width: 20%;}

        .tb1 tr td input {width: 95%;height: 85%;font-size: 13pt;padding-left: 10px;}

        .tb1 tr td:last-child {text-align: right;}

        .tb1 tr td .submit_btn {width: 200px;height: 100%;border-radius: 30px;margin-top: 20px;
            background-color: #8CB964;border: #8CB964;color: #fff;font-weight: bold;}
    </style>

    <link rel="stylesheet" href="<%=path45 %>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <a href="<%=path45 %>/mypage/mypage.jsp">마이페이지</a> &gt; <span> 개인정보 변경 </span> </p>
                <h2 class="page_tit"> 개인정보 변경 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="content_tit"> 개인 정보 변경 </h2>
                <hr>
                <form action="<%=path45 %>/mypage/modifypro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <td><label for="id"> 아이디 </label> </td>
                            <td><input type="text" name="id" id="id" class="indata" value="<%=m.getId() %>" readonly required/></td>
                        </tr>
                        <tr>
                            <td><label for="name"> 이름 </label></td>
                            <td><input type="text" value="<%=m.getName() %>" name="name" id="name" class="indata" disabled></td>
                        </tr>
                        <tr>
                            <td><label for="email"> 이메일 </label></td>
                            <td><input type="email" value="<%=m.getEmail() %>" name="email" id="email" class="indata" required></td>
                        </tr>
                        <tr>
                            <td><label for="tel"> 전화번호 </label></td>
                            <td><input type="tel" value="<%=m.getTel() %>" name="tel" id="tel" class="indata" required></td>
                        </tr>
                        <tr>
                            <td><label for="regdate"> 가입일 </label></td>
                            <td><input type="text" id="regdate" name="regdate" value="<%=m.getResdate()%>" readonly></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="개인정보수정" class="submit_btn">
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
</div>
</body>
</html>