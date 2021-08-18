
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mavenproject1.classes.User"%> 


<%

    String id = request.getParameter("id");
    Connection con;
    PreparedStatement pst, pstCheckDatabase;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

    pstCheckDatabase = con.prepareStatement("SELECT * FROM user WHERE id=" +id);
    rs = pstCheckDatabase.executeQuery();
    
    
    rs.next();
    User u1 = new User(rs.getString("id"), 
            rs.getString("username"), 
            rs.getString("password"),
            rs.getString("firstname"), 
            rs.getString("lastname"), 
            rs.getString("address"), 
            rs.getString("phone"), 
            rs.getString("emailaddress") );
    
    
%>
//<script>alert('Datele exista deja in baza!');</script>





<%@include file="indexA.jsp" %>


<h1>Update User</h1>
</br>

<div class= "row">
    <div class ="col-sm-4">
        <form  method="POST" action ="update_user_final.jsp">
            <input type="hidden" name="id" value="<% out.print(u1.get_id_user()); %>" >

            <div allight ="left">
                <label class="form-label"> Username </label>    
                <% out.print(u1.get_username()); %>                        
            </div>

            <div allight ="left">
                <label class="form-label"> Password </label>    
                <input type="password" class="form-control" placeholder="Paasword" name="spassword" id="spassword"  value="<% out.print(u1.get_password()); %>" required>                        
            </div>
            <div allight ="left">
                <label class="form-label">First Name</label>    
                <input type="text" class="form-control" placeholder="Student Firts Name" name="sfirstname" id="sfirstname" value="<% out.print(u1.get_firstname()); %>" required>                        
            </div>

            <div allight ="left">
                <label class="form-label"> Last Name</label>    
                <input type="text" class="form-control" placeholder="Student Last Name" name="slastname" id="slastname" value="<% out.print(u1.get_lastname()); %>"required>                        
            </div>

            <div allight ="left">
                <label class="form-label">Phone number</label>    
                <input type="number" class="form-control" placeholder="Phone Number" name="sphone" id="sphone" value="<% out.print(u1.getPhone()); %>"required>                        
            </div>
            <div allight ="left">
                <label class="form-label"> Email</label>    
                <input type="text" class="form-control" placeholder=" Email" name="semailaddress" id="semailaddress" value="<% out.print(u1.get_emailaddress()); %>"required>                        
            </div>

            <div allight ="left">
                <label class="form-label"> Address</label>    
                <input type="text" class="form-control" placeholder="Student Address" name="saddress" id="saddress" value="<% out.print(u1.get_address()); %>" required>                        
            </div>

            </br>
            <div allight ="right">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">    
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning"> 
            </div>        

        </form>
        <br />
        <form action="save_collection_user.jsp" method="post">
            <input type="submit" id="submit" value="save collection user" name="save coolection user" class="btn btn-info">  
        </form>
    </div>


</body>
</html>
