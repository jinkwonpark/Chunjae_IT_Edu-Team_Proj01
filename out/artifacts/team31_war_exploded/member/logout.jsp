<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path71 = request.getContextPath();
    session.invalidate();
    response.sendRedirect(path71);
%>