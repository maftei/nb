<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.mavenproject1.classes.User"%>
<%@page import="java.util.List"%>
<%@include file="indexA.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //de facut functie globala pemtru vctori
   
        User vectorUser[] = new User[100];
        int n =0;
        
         if (session.getAttribute("n_user") != null)
         {
             
        vectorUser = (User[]) session.getAttribute("vector_user");
        n = Integer.parseInt(String.valueOf(session.getAttribute("n_user")));
        
         }
        
        if (n == 0)
        {
            out.println("Nu exista persoane in sesiune!");
        }
        
        User u1;
        for(int i = 0; i <= n-1; i++)
        {
            // out.println(v[i].getCoursename());
            u1 = vectorUser[i];
        
            Connection con;
            PreparedStatement pst, pstCheckDatabase;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

            pstCheckDatabase = con.prepareStatement("select * from user where username = '" + u1.get_username() + "' ");
            rs = pstCheckDatabase.executeQuery();

            int nr = 0;
            while (rs.next()) {
                nr++;
            }

            if (nr > 0) 
            {
                out.println("The user " + u1.get_username() + " already exists into database!");
            } 
            else 
            {
                pst = con.prepareStatement("insert into user (username,password, firstname, lastname, address, phone, emailaddress)values(?,?,?,?,?,?,?)");
                
                        
                pst.setString(1, u1.get_username());
                pst.setString(2, u1.get_password());
                pst.setString(3, u1.get_firstname());
                pst.setString(4, u1.get_lastname());
                pst.setString(5, u1.get_address());
                pst.setString(6, u1.getPhone());
                pst.setString(7, u1.get_emailaddress());
                pst.setString(8, u1.get_id_user());

                pst.executeUpdate();
                out.println("The username " + u1.get_username() + " has been saved to database!");
                out.println("Press Login and enter your credentials");
            }
    }

    vectorUser = null;
    session.setAttribute("vector_user", vectorUser);
    
    n = 0;
    session.setAttribute("n_user", n);

%>

    </body>
</html>
