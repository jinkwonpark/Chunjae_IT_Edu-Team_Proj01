<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String path31 = request.getContextPath();
%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. 조회수 처리
    int count=0;
    String sql = "UPDATE qna SET cnt=cnt+1 WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    count = pstmt.executeUpdate();
    pstmt.close();

    //5. sql 실행 및 실행결과 받기
    sql = "SELECT * FROM qna WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    //6. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    QnA qna = new QnA();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 및 답변 글 상세보기</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path31 %>/css/google.css">
    <link rel="stylesheet" href="<%=path31 %>/css/fonts.css">
    <link rel="stylesheet" href="<%=path31 %>/css/header.css">
    <link rel="stylesheet" href="<%=path31 %>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%= path31 %>/css/common.css">
    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            position: relative;
            clear: both;
            width: 100%;
            min-height: 50vh;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 48px;
            text-align: center;
            padding-top: 1em;
            color: #fff;
            padding-bottom: 2.4rem;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            padding-top: 28px;
            padding-bottom: 28px;
        }

        .breadcrumb a {
            color: #fff;
        }

        .view_detail {
            width: 800px;
            margin: 50px auto;
        }

        .view_detail tr {
            width: 100%;
        }

        .view_detail tr td {
            width: 100%;
        }

        .view_detail .btn {
            float: right;
            width: 50px;
            height: 50px;
            text-align: right;
            line-height: 50px;
            border: none;
            background-color: #fff;
        }

        .view_detail .btn1 {
            float: right;
            width: 60px;
            height: 50px;
            text-align: right;
            line-height: 50px;
            border: none;
            background-color: #fff;
        }

        .view_detail .title {
            padding: 20px;
            font-size: 18pt;
            font-weight: bold;
            line-height: 30px;
        }

        .view_detail .author {
            width: 50%;
            padding: 0px 20px 10px 20px;
            text-align: right;
        }

        .view_detail .resdate {
            width: 50%;
            padding: 0px 20px 10px 20px;
        }

        .view_detail .content {
            clear: both;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            line-height: 20px;
        }

    </style>

    <link rel="stylesheet" href="<%=path31 %>/css/footer.css">
    <style>

    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="content_header">
        <div class="breadcrumb">
            <p><a href="<%=path31 %>/">Home</a> &gt; <a href="<%=path31 %>/cs/qna/qnaList.jsp">QnA</a> &gt; <span> 질문 및 답변 </span> </p>
            <h2 class="page_tit"> QnA </h2>
        </div>
    </div>
    <section class="page" id="page1">
        <div class="page_wrap">
            <!-- 5. Board 객체의 내용을 출력 -->
            <table class="view_detail color">
                <tbody>
                <% if(qna.getLev()==0) { %>
                <% if(sid!=null) { %>
                <% } %>
                <% if(sid.equals("admin") || sid.equals(qna.getAuthor())) { %>
                <tr>
                    <td colspan="3">
                        <a href="<%=path31 %>/cs/qna/delQna.jsp?lev=0&qno=<%=qna.getQno() %>" class="btn">삭제</a>
                        <a href="<%=path31 %>/cs/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="btn">수정</a>
                        <a href="<%=path31 %>/cs/qna/addQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="btn1">답변하기</a>
                    </td>
                </tr>
                <% } %>
                <% } else { %>
                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))){ %>
                <tr>
                    <td colspan="3">
                        <a href="<%=path31 %>/cs/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=1" class="btn">삭제</a>
                        <a href="<%=path31 %>/cs/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="btn">수정</a>
                    </td>
                </tr>
                    <% } %>
                <% } %>
                <tr>
                    <td class="title" colspan="3">
                        <%=qna.getTitle() %>
                    </td>
                </tr>
                <tr>
                    <td class="resdate">
                        작성일 | <%=qna.getResdate()%>
                    </td>
                    <td style="width:10%; text-align: right;">
                        조회수 | <%=qna.getCnt() %>
                    </td>
                    <td style="min-width:10%; max-width: 15%; text-align: right;">
                        작성자 | <%=qna.getAuthor()%>
                    </td>
                </tr>
                <tr>
                    <td class="content" colspan="2">
                        <%=qna.getContent() %>
                    </td>
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