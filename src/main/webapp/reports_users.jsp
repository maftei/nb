<%-- 
    Document   : reports_users
    Created on : Aug 5, 2020, 5:46:26 PM
    Author     : razvan
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Users</h2>

<table>
  <tr>
    <th>Username</th>
    <th>Password</th>
    <th>First Name</th>
    <th>Update</th>
  </tr>
  
  <%
      
            Connection con;
            PreparedStatement pst, pstCheckDatabase;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

            pstCheckDatabase = con.prepareStatement("SELECT * FROM user ");
            rs = pstCheckDatabase.executeQuery();

           int nr = 0;
           while (rs.next()) 
            {
               out.print("<tr>");
               
               out.print("<td>");
               out.println(rs.getString("username"));
               out.print("</td>");
               
               out.print("<td>");
               out.println(rs.getString("password"));
               out.print("</td>");
               
               out.print("<td>");
               out.println(rs.getString("firstname"));
               out.print("</td>");
               
               out.print("<td>");
               out.println("<a href='update_user.jsp?id=" +rs.getString("id") +"'>Modificare</a>");
               out.print("</td>");
               
               out.print ("</tr>");
                nr++;
            }
            

            if (nr == 0) 
            {
                out.println("There are no users into database!");
            } 
        %>
  %>
</table>

</body>
</html>








<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
//            Connection con;
//            PreparedStatement pst, pstCheckDatabase;
//            ResultSet rs;
//
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");
//
//            pstCheckDatabase = con.prepareStatement("SELECT * FROM user ");
//            rs = pstCheckDatabase.executeQuery();
//
//            int nr = 0;
           //out.println("<table border='1'>");            
//           while (rs.next()) 
//            {
////                out.print("<tr>");
////                out.print("<td>");
////                out.println(rs.getString("username"));
////                out.print("<td>");
////                out.print ("</tr>");
//                nr++;
//            }
//            out.println("</table>");
//            
//
//            if (nr == 0) 
//            {
//                out.println("There are no users into database!");
//            } 
//        %>
    </body>
</html>-->
