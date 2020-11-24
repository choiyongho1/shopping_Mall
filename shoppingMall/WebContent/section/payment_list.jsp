<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<h3>판매 목록</h3>
<table border="1">
<tr>
	<td>주문 ID</td>
	<td>주문일</td>
	<td>주문 상태</td>
	<td>주문 개수</td>
	<td>주문 가격</td>
	<td>상품명</td>
	<td>유저명</td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = "SELECT PAYMENT_HISTORY.ID AS PAYMENT_HISTORY_ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT.name AS PRODUCT_NAME, MEMBER.name AS MEMBER_NAME FROM PRODUCT, PAYMENT_HISTORY, MEMBER WHERE PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.id AND  PAYMENT_HISTORY.MEMBER_ID = MEMBER.id ";
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getInt("PAYMENT_HISTORY_ID") %></td>
            		<td> <%=rs.getString("ORDER_DATE") %></td>
            		<td> <%=rs.getString("ORDER_STATUS") %></td>
            		<td> <%=rs.getInt("ORDER_COUNT") %></td>
            		<td> <%=rs.getInt("ORDER_PRICE") %></td>
            		<td> <%=rs.getString("PRODUCT_NAME") %></td>
            		<td> <%=rs.getString("MEMBER_NAME") %></td>
            	</tr>
            <%
        }
        
        con.close();
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
%>
</table>