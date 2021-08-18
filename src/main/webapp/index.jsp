<%@page import="com.mavenproject1.classes.User"%>
<%@page import="com.mavenproject1.classes.Course"%>
<%@page import="java.util.List"%>

<%@include file="indexA.jsp" %>
        <% 
            if (session.getAttribute("stegulet") == null)
            {
                session.setAttribute("stegulet", "1");
                
                User vectorUsers[] = new User[500];
                int dimensiuneVectorUser = 0;
                session.setAttribute("vector_user", vectorUsers);
                session.setAttribute("n_user", dimensiuneVectorUser);
                
                
                Course vectorCursuri[] = new Course[100];
                int dimensiuneVectorCursuri = 0;
                session.setAttribute("vector_cursuri", vectorCursuri);
                session.setAttribute("n_cursuri", dimensiuneVectorCursuri);
                
                
                
                
                // creare colectie de obiecte de tip curs
//                List<Course> courses_collection = null;
//                session.setAttribute("courses_collection", courses_collection);
            }
            
        %>

<!DOCTYPE html> 
<html> 
    <head> 
        <title>Relative file path</title> 
    </head> 
    <body background=""> 
<!--        <h2>File present in a folder which is located at<br> 
        the root of the current subdirectories</h2> 
        <img src="/../src/main/resources/joel-filipe-jU9VAZDGMzs-unsplash.jpg" alt="My Image" style="width:400px"> 
                <img src="img/joel-filipe-jU9VAZDGMzs-unsplash.jpg" alt="My Image"  style="width:400px"/> -->

    </body> 
</html>                     







