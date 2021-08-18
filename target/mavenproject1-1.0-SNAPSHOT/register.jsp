
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mavenproject1.classes.User"%> 


<%

    if (request.getParameter("submit") != null) {

        String phone = request.getParameter("sphone");
        String firstname = request.getParameter("sfirstname");
        String lastname = request.getParameter("slastname");
        String emailaddress = request.getParameter("semailaddress");
        String address = request.getParameter("saddress");
        String username = request.getParameter("susername");
        String password = request.getParameter("spassword");

        User u1 = new User(username,password, firstname, lastname, address, phone, emailaddress);
       

        User v[] = new User[500];
        int n = 0;
        
        if (session.getAttribute("n_user") != null)
        {
            System.out.println("Initializare");
            v = (User[]) session.getAttribute("vector_user");
            n = Integer.parseInt(String.valueOf(session.getAttribute("n_user")));
        }

        if (n == 0) 
        {
            out.println("Nu exista persoane  in sesiune!");
        }
//
        for (int i = 0; i <= n - 1; i++) 
        {
            out.println(v[i].get_username());
        }
//
        v[n] = u1;
        n++;

        session.setAttribute("vector_user", v);
        session.setAttribute("n_user", n);
%>
//<script>alert('Datele exista deja in baza!');</script>
<%
    }

%>




<%@include file="indexA.jsp" %>


<h1>User Registration System</h1>
</br>

<div class= "row">
    <div class ="col-sm-4">
        <form  method="POST" action ="#">
            
            <div allight ="left">
                <label class="form-label"> Username </label>    
                <input type="text" class="form-control" placeholder="Username" name="susername" id="susername" required>                        
            </div>
            
            <div allight ="left">
                <label class="form-label"> Password </label>    
                <input type="password" class="form-control" placeholder="Paasword" name="spassword" id="spassword" required>                        
            </div>
            <div allight ="left">
                <label class="form-label">First Name</label>    
                <input type="text" class="form-control" placeholder="Student Firts Name" name="sfirstname" id="sfirstname" required>                        
            </div>

            <div allight ="left">
                <label class="form-label"> Last Name</label>    
                <input type="text" class="form-control" placeholder="Student Last Name" name="slastname" id="slastname" required>                        
            </div>

            <div allight ="left">
                <label class="form-label">Phone number</label>    
                <input type="number" class="form-control" placeholder="Phone Number" name="sphone" id="sphone" required>                        
            </div>
            <div allight ="left">
                <label class="form-label"> Email</label>    
                <input type="text" class="form-control" placeholder=" Email" name="semailaddress" id="semailaddress" required>                        
            </div>
            
            <div allight ="left">
                <label class="form-label"> Address</label>    
                <input type="text" class="form-control" placeholder="Student Address" name="saddress" id="saddress" required>                        
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
