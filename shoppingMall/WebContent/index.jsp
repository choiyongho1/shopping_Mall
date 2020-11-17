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
<%
		String a = "나는 스트링입니다!";
	%>
	<a> A느 무슨 글자일까요?? 정답은: <%=a%> 
	</a>

	<% 
for (int i = 0; i < 5; i++) {
	for(int j=0; j < i; j++) {
		%><a>*</a><%
	}
	%><br><%
}
%>
	<%
	int q = 1;
	int w = 1;
	int sum;
	%><%=q%><%
	%><%=w%><%
	for (int i = 0; i < 100; i++) {
	sum = q + w;
	%><a><%=sum%></a><%
	q = w;
	w = sum;
	if (sum > 100) {
		break;
	}
	}
	%>

<table border="1">
<% 
	for (int i = 1; i <= 9; i++) {
		%><tr><%
		for (int j = 1; j <= 9; j++) {
			%>
			<td><%=i + "*" +  j + "=" + i * j %></td>
			<%
		}
		%></tr><%
	}
%>
</table>
 
<table border="1">
<% 
	for (int i = 1; i <= 5; i++) {
		%><tr><%
		for (int j = 0; j < i; j++) {
			%>
			<td>*</td>
			<%
		}
		for (int k = 5-i; k > 0; k--){
			%><td></td><%
		}
		%></tr><%
	}
%>
</table>

<table border="1">
<% 
	for (int i = 1; i < 5; i++) {
		%><tr><%
		for (int j = 4; j > 0; j--) {
			if(i<j) {
				%>
				<td></td>
				<%
			} else {
				%>
				<td>*</td>
				<%
			}
		}
		for (int k = 5-i; k > 0; k--){
			%><td></td><%
		}
		%></tr><%

	}
%>
</table>
</body>
</html>