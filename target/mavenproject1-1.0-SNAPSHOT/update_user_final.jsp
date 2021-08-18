<%-- 
    Document   : update_user_final
    Created on : Aug 23, 2020, 4:56:14 PM
    Author     : razvan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mavenproject1.classes.User"%> 
<%@page import="java.sql.*" %>
<%@page import="com.mavenproject1.classes.User"%> 


<%@include file="indexB.jsp" %>
<% if (request.getParameter("submit") != null) {

        String id  = request.getParameter("id");
        String phone = request.getParameter("sphone");
        String firstname = request.getParameter("sfirstname");
        String lastname = request.getParameter("slastname");
        String emailaddress = request.getParameter("semailaddress");
        String address = request.getParameter("saddress");
        String username = request.getParameter("susername");
        String password = request.getParameter("spassword");
        
        

        User u1 = new User(id, username, password, firstname, lastname, address, phone, emailaddress);

        String sir = "UPDATE user SET password='" + u1.get_password() + "'"
                + ",firstname='" + u1.get_firstname() + "', "
                + "lastname='" + u1.get_lastname() + "', "
                + "address='" + u1.get_address() + "', "
                + "phone='" + u1.getPhone() + "', "
                + "emailaddress ='" + u1.get_emailaddress() + "' "
                + "WHERE id=" + u1.get_id_user();
        
        //out.println(sir);
        Connection con;
        PreparedStatement pst, pstCheckDatabase;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

        pst = con.prepareStatement(sir);
        int  ok;
        ok = pst.executeUpdate();
        if (ok == 1)
        {
            out.println("The username " + u1.get_username() + " has been saved to database!");
        }
        else
        {
            out.println("Eroare!");
        }
            
    }
%>
