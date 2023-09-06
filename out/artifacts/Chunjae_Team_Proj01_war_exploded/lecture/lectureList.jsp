<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ include file="/setting/encoding.jsp"%>
<%
    String path37 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 강의 목록 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path37%>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path37%>/css/common.css">
    <link rel="stylesheet" href="<%=path37%>/css/header.css">
    <link rel="stylesheet" href="<%=path37%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path37%>/css/lectureList.css">
    <link rel="stylesheet" href="<%=path37%>/css/footer.css">

    <%
        int lno = request.getParameter("lno") != null ? Integer.parseInt(request.getParameter("lno")) : 0;
        String target = request.getParameter("target");

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

        // 강의 정보 불러오기
        String sql = "SELECT * FROM lecture WHERE lno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, lno);
        rs = pstmt.executeQuery();
        Lecture lecture = new Lecture();
        if(rs.next()) {
            lecture.setLectureName(rs.getString("lectureName"));
            lecture.setTeacher(rs.getString("teacher"));
            lecture.setContent(rs.getString("content"));
            lecture.setFilePath(rs.getString("filePath"));
        }
        rs.close();
        pstmt.close();

        // 페이징 처리 - 전체 페이지 수 구하기
        sql = "SELECT COUNT(*) as 'count' FROM lectureInfo WHERE lno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, lno);
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
        sql = "SELECT vno, vTitle, duration FROM lectureInfo WHERE lno=? ORDER BY vno LIMIT ?, 10";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, lno);
        pstmt.setInt(2, 10*(pageNo-1));
        rs = pstmt.executeQuery();

        List<LectureInfo> lecList = new ArrayList<>();
        while(rs.next()) {
            LectureInfo info = new LectureInfo();
            info.setVno(rs.getInt("vno"));
            info.setvTitle(rs.getString("vTitle"));
            info.setDuration(rs.getString("duration"));
            lecList.add(info);
        }
        con.close(rs, pstmt, conn);
    %>

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

            .lecture_wrap {
                clear: both;
                width: 1000px;
                margin: 0 auto;
                border: 2px solid #ddd;
                border-radius: 20px;
            }

            .lecture_wrap .img_wrap {
                width: 250px;
                background-image: url("<%=path37.concat(lecture.getFilePath())%>");
                background-repeat: no-repeat;
                background-position: center center;
                background-size: cover;
            }

            .page_wrap {
                clear:both;
                width: 1000px;
                height: auto;
                margin:0 auto;
            }
            .page_wrap .content_tit {
                font-weight: bold;
                font-size: 25px;
                margin: 80px 30px 30px 10px;
            }
        </style>
        <script>
            function openLecture(vno) {
                location.href = "<%=path37%>/lecture/viewLecture.jsp?vno="+vno;
            }
        </script>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path37 %>">Home</a> &gt; <a href="<%=path37 %>/lecture/lectures.jsp?target=<%=target%>"> <%=target %> 강의 소개 </a> &gt; <span> 강의 상세정보 </span> </p>
                <h2 class="page_tit"> 강의 소개 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="lecture_wrap">
                <table class="tb1">
                    <tr>
                        <td rowspan="4" class="img_wrap"></td>
                        <td class="lecture_name"><%=lecture.getLectureName()%></td>
                    </tr>
                    <tr>
                        <td class="teacher">🧑 <%=lecture.getTeacher()%> 선생님</td>
                    </tr>
                    <tr>
                        <td class="content"> <%=lecture.getContent()%> </td>
                    </tr>
                    <tr>
                        <td><a href="#page2" class="btn"> 강의 듣기 </a></td>
                    </tr>
                </table>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <p class="content_tit"> 강의 상세정보 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="title"> 커리큘럼 </div>
                        </div>
                        <%
                            for(LectureInfo lec : lecList) { %>
                                <div class="openLecture" onclick="openLecture(<%=lec.getVno()%>)">
                                    <div class="vTitle"><%=lec.getvTitle()%></div>
                                    <div class="duration"><%=lec.getDuration()%></div>
                                </div>
                        <%  }
                            System.out.println(count);
                            if(count == 0) { %>
                                <div>
                                    <div class="result"> 아직 오픈되지 않은 강의입니다. </div>
                                </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path37%>/lecture/lectureList.jsp?lno=<%=lno%>&target=<%=target%>&page=1#page2" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path37%>/lecture/lectureList.jsp?lno=<%=lno%>&target=<%=target%>&page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>#page2" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path37%>/lecture/lectureList.jsp?lno=<%=lno%>&target=<%=target%>&page=<%=p%>#page2" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path37%>/lecture/lectureList.jsp?lno=<%=lno%>&target=<%=target%>&page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>#page2" class="bt next"> &gt; </a>
                        <a href="<%=path37%>/lecture/lectureList.jsp?lno=<%=lno%>&target=<%=target%>&page=<%=totalPage%>#page2" class="bt last"> &gt;&gt; </a>
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
