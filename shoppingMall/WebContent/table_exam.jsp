<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<%	
	int q = 0;
	int w = 1;
	for (int i = 1; i <= 33; i++) {
		%> <td><%=w %></td><%
		int sum = q + w;
		q = w;
		w = sum;
		if(i % 3 == 0) {
			%><tr></tr><%
		}
	}
	%>
</tr>
</table>
</body>
</html>