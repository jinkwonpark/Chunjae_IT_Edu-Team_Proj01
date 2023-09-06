<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ include file="../setting/encoding.jsp"%>
<%
    String path7 = request.getContextPath();

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "UPDATE member SET name=?, email=?, tel=? WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, tel);
    pstmt.setString(4, id);
    cnt = pstmt.executeUpdate();

    con.close(pstmt, conn);

    if (cnt > 0) { %>
<script>
    alert("회원 정보를 수정했습니다.");
    location.href = "<%=path7%>/admin/modifyInfo.jsp";
</script>
<%  } else { %>
<script>
    alert("문제가 발생했습니다. 잠시 후 시도해주세요");
    history.go(-1);
</script>
<% } %>