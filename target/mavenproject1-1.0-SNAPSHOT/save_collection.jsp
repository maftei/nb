<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.mavenproject1.classes.Course"%>
<%@page import="java.util.List"%>
<%@include file="indexB.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //de facut functie globala pemtru vctori
   
        Course vectorCursuri[] = new Course[100];
        int n;
        vectorCursuri = (Course[]) session.getAttribute("vector_cursuri");
        n = Integer.parseInt(String.valueOf(session.getAttribute("n")));
        
        if (n == 0)
        {
            out.println("Nu exista cursuri in sesiune!");
        }
        
        Course c1;
        for(int i = 0; i <= n-1; i++)
        {
            // out.println(v[i].getCoursename());
            c1 = vectorCursuri[i];
        
            Connection con;
            PreparedStatement pst, pstCheckDatabase;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

            pstCheckDatabase = con.prepareStatement("select * from courses where course_name = '" + c1.getCoursename() + "' ");
            rs = pstCheckDatabase.executeQuery();

            int nr = 0;
            while (rs.next()) {
                nr++;
            }

            if (nr > 0) 
            {
                out.println("The course " + c1.getCoursename() + " already exists into database!");
            } 
            else 
            {
                pst = con.prepareStatement("insert into courses (course_name,course_fee,course_description,duration)values(?,?,?,?)");
                pst.setString(1, c1.getCoursename());
                pst.setInt(2, c1.getCoursefee());
                pst.setString(3, c1.getCoursedescription());
                pst.setInt(4, c1.getCourseduration());

                pst.executeUpdate();

                out.println("The course " + c1.getCoursename() + " has been saved to database!");
            }
    }

    vectorCursuri = null;
    session.setAttribute("vector_colectii", vectorCursuri);
    
    n = 0;
    session.setAttribute("n", n);

%>

    </body>
</html>
