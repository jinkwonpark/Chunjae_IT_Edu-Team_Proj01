<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> CORN EDU </title>
  <%@ include file="/setting/head.jsp"%>
  <style>
    <!-- link 이동 목록 -->
    .page { clear:both; width: 100vw; height: 100vh; position:relative; }
    .page::after { content:""; display:block; width: 100%; clear:both; }

    .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
    .page_tit { font-size: 48px; text-align: center; padding-top:2em; }
    .page_con { font-size: 20px; text-align: center; margin-top: 50px; color: #3a3a3a }
  </style>
</head>

<body>
  <div class="wrap">
    <div class="hd" id="hd">
      <%@ include file="/layout/header.jsp" %>
    </div>
    <!-- 컨텐츠 상단 부분 content.jsp-->
    <%@ include file="/content/content.jsp"%>

    <!-- 메뉴 링크 부분 link.jsp -->
    <%@ include file="/content/link.jsp"%>

    <!--추천 강의 목록 lecture.jsp -->
    <%@include file="/content/lecture.jsp" %>

    <!--공지사항, 이벤트 게시판 board.jsp-->
    <%@ include file="/content/board.jsp" %>

    <div class="ft" id="ft">
      <%@ include file="/layout/footer.jsp"%>
    </div>
</body>
</html>
