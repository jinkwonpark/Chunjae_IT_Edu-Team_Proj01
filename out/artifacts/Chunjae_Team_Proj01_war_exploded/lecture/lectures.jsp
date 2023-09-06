<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    String path38 = request.getContextPath();
    String target = request.getParameter("target");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT * FROM lecture WHERE target=? ORDER BY lectureName";           // 강의명 오름차순으로 출력
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, target);
    rs = pstmt.executeQuery();

    List<Lecture> lecList = new ArrayList<>();
    while(rs.next()) {
        Lecture lec = new Lecture();
        lec.setLno(rs.getInt("lno"));
        lec.setLectureName(rs.getString("lectureName"));
        lec.setTeacher(rs.getString("teacher"));
        lec.setFilePath(rs.getString("filePath"));
        lec.setContent(rs.getString("content"));
        lecList.add(lec);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=target%> 강의 소개</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path38%>/css/google.css">
    <link rel="stylesheet" href="<%=path38%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path38%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path38%>/css/common.css">
    <link rel="stylesheet" href="<%=path38%>/css/header.css">
    <link rel="stylesheet" href="<%=path38%>/css/footer.css">

    <style>
        /*breadcrumb*/
        .content_header {
            clear: both;
            height: 250px;
            margin-top: 40px;
            background-image: url("/images/mypage_cover.jpg");
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
            margin-top: 120px;
            margin-bottom: 120px;
        }

        .contents{
            margin-top: 20px;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
            margin-left: 150px;
        }
        div .card {
            margin: 25px auto;
        }

        .col-3 {
            width: 330px;
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
    <section class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <h2 class="page_tit"> <%=target %> 강의 소개 </h2>
            </div>
        </div>
        <section class="container" id="page1">
            <ul class="list row">
                <% for(Lecture lec : lecList) { %>
                <li class="col-3">
                    <div class="card">
                        <img src="<%=path38.concat(lec.getFilePath())%>" class="card-img-top" alt="강의소개">
                        <div class="card-body">
                            <h5 class="card-title"><%=lec.getLectureName()%></h5>
                            <p class="card-text"><%=lec.getContent()%></p>
                            <a href="<%=path38%>/lecture/lectureList.jsp?lno=<%=lec.getLno()%>&target=<%=target%>&page=1" class="btn btn-primary"><%=lec.getTeacher()%> 선생님 </a>
                        </div>
                    </div>
                </li>
                <% } %>
            </ul>
        </section>
    </section>
</div>
<footer class="ft" id="ft">
    <%@ include file="/layout/footer.jsp" %>
</footer>
</div>
</body>
</html>