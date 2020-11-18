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
</body>
</html>