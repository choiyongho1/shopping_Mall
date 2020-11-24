<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<h3>카테고리별 판매 목록</h3>
<table border="1">
<tr>
	<td>카테고리명</td>
	<td>판매 액수</td>
	<td>판매 개수</td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = "SELECT CATEGORY.NAME, SUM(ORDER_PRICE) AS SUM_ORDER_PRICE, SUM(ORDER_COUNT) AS SUM_ORDER_COUNT FROM PRODUCT, PAYMENT_HISTORY, CATEGORY WHERE PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND PRODUCT.CATEGORY_ID = CATEGORY.ID GROUP BY CATEGORY.NAME";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getString("NAME") %></td>
            		<td> <%=rs.getInt("SUM_ORDER_PRICE") %></td>
            		<td> <%=rs.getInt("SUM_ORDER_COUNT") %></td>
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