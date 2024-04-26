<%@page import ="com.DB.DBConnection" %>
<%@page import ="java.sql.Connection" %>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
     <%@ include file="All/header.jsp" %>
    <%@ include file="All/nav.jsp" %>
    <%@ include file="All/footer.jsp" %>
</head>
<body>
<%Connection connection= DBConnection.getConn();

out.print(connection);
%>
    <h1>Hello</h1>
</body>
</html>
