<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    String author = (String)session.getAttribute("id");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "INSERT INTO studentComment(bno, author, content) VALUES(?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    pstmt.setString(2, author);
    pstmt.setString(3, content);
    cnt = pstmt.executeUpdate();

    if(cnt > 0) {
        response.sendRedirect("/board/studentboard/getStudentBoard.jsp?bno="+bno);
    } else { %>
    <script>
        alert("문제가 발생했습니다. 잠시 후 시도해주세요");
        history.go(-1);
    </script>
<% } %>