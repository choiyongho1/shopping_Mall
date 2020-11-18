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

try
{

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    Statement select_stmt=con.createStatement();
    Statement update_stmt=con.createStatement();
  
    for(int i = 0; i < 100; i++){
    
    int a = (int)(Math.random()*100);
    int b = (int)(Math.random()*100);
    int c = (int)(Math.random()*100);
    int d = (int)(Math.random()*100);
        String query = " INSERT INTO MORUGATSUYO(id, COL1, COL2, COL3, COL4) VALUES(" +i+","+ a + "," + b + "," + c + "," + d + ") ";
        System.out.println(query);
		
		stmt.executeQuery(query);
	
    }
    String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO WHERE AVG_COL IS NULL";
    ResultSet rs=select_stmt.executeQuery(select_query);
    while(rs.next()) {

		int a= rs.getInt("ID");
		int b = rs.getInt("COL1");
		int c = rs.getInt("COL2");
		int d = rs.getInt("COL3");
		int e = rs.getInt("COL4");
		String update_query = "UPDATE MORUGATSUYO SET AVG_COL= %d WHERE ID = %d";
		update_stmt.executeQuery(String.format(update_query, (b + c + d + e)/4, a ));
	}


    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%> 
<%-- 문제 4 --%>
 <table border = "1">
	<tr>
		<td>구매자명</td>
		<td>구매금액</td>
	</tr>
<%
try
{

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    Statement select_stmt=con.createStatement();
    String select_query = "SELECT NAME, ORDER_PRICE FROM MEMBER, PAYMENT_HISTORY WHERE PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID";
    
    ResultSet rs=stmt.executeQuery(select_query);
    while(rs.next()) {
        %><tr><%


        %><td><%=rs.getString("NAME")%></td><%
        %><td><%=rs.getInt("ORDER_PRICE")%></td><%

        %></tr><%
    }
}
catch(Exception e)
{ 
    System.out.println(e);
}
%> 
</table>
<table border = "1">
<%
try
{

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    Statement select_stmt=con.createStatement();
    String select_query = "SELECT PAYMENT_HISTORY.ID AS PAYMENT_HISTORY_ID , MEMBER.NAME AS MEMBER_NAME, PRODUCT.NAME AS PRODUCT_NAME, ORDER_COUNT, ORDER_PRICE FROM PAYMENT_HISTORY, MEMBER, PRODUCT WHERE PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID";
    
    ResultSet rs=select_stmt.executeQuery(select_query);
    

    while(rs.next()){
        
        String a = rs.getString("MEMBER_NAME");
        String b = rs.getString("PRODUCT_NAME");
        int c = rs.getInt("ORDER_COUNT");
        int d = rs.getInt("ORDER_PRICE");
        int z = rs.getInt("PAYMENT_HISTORY_ID");
            String query = " INSERT INTO PURCHASE_LOG(ID, LOG) VALUES("+ z + ",'"+a+"님이 "+b+"상품 "+c+"개를"+d + "원에 구매하셨습니다. ')";
            stmt.executeQuery(query);
        }

    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>
</body>
</html>