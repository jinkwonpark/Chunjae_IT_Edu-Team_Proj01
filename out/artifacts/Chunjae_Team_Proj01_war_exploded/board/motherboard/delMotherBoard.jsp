<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="com.chunjae_pro01.util.DBC" %>
<%@ page import="com.chunjae_pro01.util.MariaDBCon" %>
<%

    String target = request.getParameter("target");

    /* 2. 인코딩 설정 및 보내온 데이터 받아오기 */
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection con = null;
    PreparedStatement pstmt = null;

    /* 3. DB 연결 */
    DBC conn = new MariaDBCon();
    con = conn.connect();

    /* 4. SQL을 실행하여 처리된 건수 반환받기 */
    String sql = "delete from motherboard where bno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, bno);
    int cnt = pstmt.executeUpdate();

    /* 5. 처리된 건수가 0보다 크면(성공처리가 되었으면) 목록 페이지로 이동하고,
    아니면(실패처리가 되었으면), 해당 글 상세보기로 이동한다. */
    if(cnt > 0){
        if(target.equals("admin")) {
            response.sendRedirect("/admin/motherboardMgmt.jsp?page=1");
        } else {
            response.sendRedirect("/board/motherboard/MotherBoardList.jsp?page=1");
        }
    } else {
        out.println("<script> history.go(-1); </script>");
    }

    conn.close(pstmt, con);
%>