<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path2 = request.getContextPath();

    int par = Integer.parseInt(request.getParameter("par"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = (String) session.getAttribute("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "INSERT INTO qna(title, content, author, lev, par) VALUES(?, ?, ?, 1, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, par);
    cnt = pstmt.executeUpdate();

    if(cnt > 0) { %>
        <script>
            alert("답변이 입력되었습니다.");
            location.href="<%=path2%>/admin/qnaMgmt.jsp?page=1";
        </script>
<%  } %>