<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/setting/encoding.jsp"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 1L);

    String path32 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path32%>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path32%>/css/common.css">
    <link rel="stylesheet" href="<%=path32%>/css/header.css">
    <link rel="stylesheet" href="<%=path32%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path32%>/css/mgmt.css">
    <link rel="stylesheet" href="<%=path32%>/css/footer.css">

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
            min-height: 100vh;
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
            margin: 80px 30px 30px 10px;
        }
        .btn_group {clear:both;}
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }

    </style>

    <%
        int pageNo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
        // 총 페이지 수
        int totalPage = 0;
        // 마지막 페이지
        int endPage = pageNo+2 < 5 ? 5 : pageNo+2;
        // 전체 회원 수
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();

        // 페이징 처리 - 전체 페이지 수 구하기
        String sql = "SELECT COUNT(*) as 'count' FROM qna";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            count = rs.getInt("count");
            totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
            // 전체 페이지가 0일 경우 (=회원이 없는 경우)
            totalPage = (totalPage == 0) ? 1 : totalPage;
        }
        rs.close();
        pstmt.close();

        // 페이징 처리 - 현재 페이지에 출력될 페이지 리스트 구하기
        if(endPage > totalPage) {
            endPage = totalPage;
        }
        List<Integer> pageList = new ArrayList<>();
        for(int p=(endPage-4 > 0 ? endPage-4 : 1); p<=endPage; p++) {
            pageList.add(p);
        }

        // 현재 페이지에 출력할 회원 데이터만 가져오기
        sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 10*(pageNo-1));
        rs = pstmt.executeQuery();

        List<QnA> qnaList = new ArrayList<>();
        while(rs.next()){
            QnA qna = new QnA();
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAuthor(rs.getString("author"));
            qna.setResdate(rs.getString("resdate"));
            qna.setCnt(rs.getInt("cnt"));
            qna.setLev(rs.getInt("lev"));
            qna.setPar(rs.getInt("par"));
            qna.setName(rs.getString("name"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            qna.setResdate(sdf.format(d));
            qnaList.add(qna);
        }
        con.close(rs, pstmt, conn);
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
                <p><a href="<%=path32 %>/">Home</a> &gt; <span>고객지원</span> &gt; <span> QnA </span> </p>
                <h2 class="page_tit"> 고객지원 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> QnA </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="bno" style="padding-right: 200px"> 글번호 </div>
                            <div class="Title" style="padding-right: 120px"> 제목 </div>
                            <div style="width: 15%; padding-left: 150px"> 작성자 </div>
                            <div style="width: 5%; padding-left: 20px"> 조회수 </div>
                            <div style="width : 10%; padding-left:40px;"> 작성일 </div>
                        </div>
                        <% for(QnA qna: qnaList) { %>
                        <div>
                            <div class="bno"> <%=qna.getQno()%> </div>
                            <% if(sid!=null) {
                                if(qna.getLev()==0){%>
                            <div class="qTitle" style="text-align : left;"> <a href="<%=path32%>/cs/qna/getQna.jsp?qno=<%=qna.getQno() %>"><%=qna.getTitle() %></a> </div>
                            <% }else{ %>
                            <div class="qTitle" style="text-align : left;"> <a href="<%=path32%>/cs/qna/getQna.jsp?qno=<%=qna.getQno() %>">⌞<%=qna.getTitle() %></a> </div>
                            <%}} else {
                                if(qna.getLev()==0){%>
                            <div class="qTitle" style="text-align : left;"><%=qna.getTitle() %></div>
                            <% }else{ %>
                            <div class="qTitle" style="text-align : left;">⌞<%=qna.getTitle() %></div>
                            <%}} %>
                            <div style="width: 22%; padding-left:15px;"> <%=qna.getAuthor()%> </div>
                            <div class="cnt"> <%=qna.getCnt()%> </div>
                            <div style="padding-left: 80px;"> <%=qna.getResdate()%> </div>
                        </div>
                        <% } %>
                        <% if(count == 0) { %>
                        <div>
                            <p class="result"> 공지사항이 없습니다 :) </p>
                        </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path32%>/cs/qna/qnaList.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path32%>/cs/qna/qnaList.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path32%>/cs/qna/qnaList.jsp?page=<%=p%>" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path32%>/cs/qna/qnaList.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>" class="bt next"> &gt; </a>
                        <a href="<%=path32%>/cs/qna/qnaList.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
                    <div class="btn_group" style="margin:0; width:1000px; padding-top:25px; ">
                        <% if(sid!=null) { %>
                        <a href="<%=path32%>/cs/qna/addQuestion.jsp?lev=0&par=0" class="inbtn" style="float:right; ">질문하기</a>
                        <% } else { %>
                        <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>
                            로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                        <% } %>
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
