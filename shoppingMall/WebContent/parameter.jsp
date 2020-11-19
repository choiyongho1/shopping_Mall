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


<%--  <table border = "1">
<tr>
	<td>ID</td>
	<td>카테고리ID</td>
	<td>이름</td>
	<td>가격</td>
	<td>재고</td>
	<td>설명</td>
	<td>원산지</td>
</tr>
<%
String phone_number = request.getParameter("test"); // != null ? request.getParameter("test") : "";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT ID, PASSWORD, NAME, EMAIL, PHONE, ADDRESS, AGE FROM MEMBER";
	
	if (phone_number != null) {
		query += " WHERE PHONE like '%" + phone_number + "'";
	}
	
	%> <%=query%> <%
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getInt("ID")%></td><%
			%><td><%=rs.getString("PASSWORD")%></td><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getString("EMAIL")%></td><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("ADDRESS")%></td><%
			%><td><%=rs.getInt("AGE")%></td><%
		%><tr><%
	}
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="search_condition">
<input type="button" onclick="click_search()">

<script>
	function click_search() {
		const search_condition = document.getElementById("search_condition").value;
		
		redirect_with_get_params(search_condition);
	}
	
	function redirect_with_get_params(param) {
		window.location.href = 'parameter.jsp?test=' + param;
	}
</script>
<table border = "1">
<tr>
	<td>ID</td>
	<td>번호</td>
	<td>이름</td>
	<td>가격</td>
	<td>재고</td>
</tr>
<%
String phone_number = request.getParameter("test"); // != null ? request.getParameter("test") : "";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT PAYMENT_HISTORY.PRODUCT_ID AS PAYMENT_HISTORY_PRODUCT_ID , PHONE, NAME, ORDER_PRICE, ORDER_COUNT FROM MEMBER, PAYMENT_HISTORY WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID";
	if (phone_number != null) {
		query += " AND PHONE like '%" + phone_number + "'";
	}
	
	ResultSet rs=stmt.executeQuery(query); 

	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getInt("PAYMENT_HISTORY_PRODUCT_ID")%></td><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getInt("ORDER_PRICE")%></td><%
			%><td><%=rs.getInt("ORDER_COUNT")%></td><%
		%><tr><%
	}
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="search_condition">
<input type="button" onclick="click_search()">

<script>
	function click_search() {
		const search_condition = document.getElementById("search_condition").value;
		
		redirect_with_get_params(search_condition);
	}
	
	function redirect_with_get_params(param) {
		window.location.href = 'parameter.jsp?test=' + param;
	}
</script>

<%
String phone_number = request.getParameter("test"); // != null ? request.getParameter("test") : "";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT PAYMENT_HISTORY.PRODUCT_ID AS PAYMENT_HISTORY_PRODUCT_ID , PHONE, NAME, ORDER_PRICE, ORDER_COUNT FROM MEMBER, PAYMENT_HISTORY WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID";
	if (phone_number != null) {
		query += " AND PHONE like '%" + phone_number + "'";
	}
	
	ResultSet rs=stmt.executeQuery(query); 

	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getInt("PAYMENT_HISTORY_PRODUCT_ID")%></td><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getInt("ORDER_PRICE")%></td><%
			%><td><%=rs.getInt("ORDER_COUNT")%></td><%
		%><tr><%
	}
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table> --%>

<%-- <table border = "1">
<tr>
	<td>이메일</td>
    <td>유저 이름</td>
    <td>유저 핸드폰 번호</td>
    <td>구매 금액</td>
    <td>구매 상품ID</td>
    <td>구매 개수</td>
</tr>
<%
String phone_number = request.getParameter("phone_number");// != null ? request.getParameter("test") : "";
String email = request.getParameter("email");

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = "SELECT EMAIL, member.NAME as name, member.PHONE as phone, order_price, product_id, order_count FROM MEMBER, payment_history WHERE MEMBER.ID = MEMBER_ID";
    if (phone_number != null) {
        query += " AND phone like '%" + phone_number + "'";
    }
    if (email != null) {
        query += " AND email like '%" + email + "%'";
    }

    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("EMAIL")%></td><%
            %><td><%=rs.getString("phone")%></td><%
            %><td><%=rs.getString("name")%></td><%
            %><td><%=rs.getInt("order_price")%></td><%
            %><td><%=rs.getString("product_id")%></td><%
            %><td><%=rs.getString("order_count")%></td><%
        %><tr><%
    }

    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="phone_number">
<p>이메일을 입력하세요</p>
<input type="text" id="email">
<input type="button" onclick="click_search()" value="search">
<script>
    function click_search() {
        const email = document.getElementById("email").value;
        const phone_number = document.getElementById("phone_number").value;

        redirect_with_get_params(phone_number,email);
    }

    function redirect_with_get_params(phone_number,email) {
        window.location.href = 'parameter.jsp?phone_number=' + phone_number + '&email='+ email;
    }
</script> --%>

<table border = "1">
<tr>
	<td>이름</td>
    <td>가격</td>
    <td>개수</td>
    <td>설명</td>
    <td>원산지</td>
</tr>
<%
String price_less = request.getParameter("price_less");
String price_more = request.getParameter("price_more");
String origin_less = request.getParameter("origin_less");
String origin_more = request.getParameter("origin_more");

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = "SELECT NAME, PRICE, STOCK, DESCRIPTION, ORIGIN FROM PRODUCT";
    if (price_more != null) {
        query += " WHERE PRICE >= " + price_more;
    }
    if (price_less != null) {
        query += " AND PRICE <= " + price_less;
    }
    if (origin_more != null) {
        query += " AND STOCK >= " + origin_more;
    } else {
    	origin_more = "";
    }
    if (origin_less != null) {
        query += " AND STOCK <= " + origin_less;
    }
System.out.println(query);
    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("NAME")%></td><%
            %><td><%=rs.getInt("PRICE")%></td><%
            %><td><%=rs.getInt("STOCK")%></td><%
            %><td><%=rs.getString("DESCRIPTION")%></td><%
            %><td><%=rs.getString("ORIGIN")%></td><%
        %><tr><%
    }

    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>

<p>얼마 이상</p>
<input type="number" id="price_more">
<p>얼마 이하</p>
<input type="number" id="price_less">
<p>몇개 이상</p>
<input type="number" id="origin_more">
<p>몇개 이하</p>
<input type="number" id="origin_less">
<input type="button" onclick="click_search()" value="search">
<script>
    function click_search() {
        const price_more = document.getElementById("price_more").value;
        const price_less = document.getElementById("price_less").value;
        const origin_more = document.getElementById("origin_more").value;
        const origin_less = document.getElementById("origin_less").value;
        

        redirect_with_get_params(price_more, price_less, origin_more, origin_less);
    }

    function redirect_with_get_params(price_more, price_less, origin_more, origin_less) {
        window.location.href = 'parameter.jsp?price_more=' + price_more + '&price_less='+ price_less + '&origin_more='+ origin_more + '&origin_less='+ origin_less;
    }
</script>
</body>
</html>