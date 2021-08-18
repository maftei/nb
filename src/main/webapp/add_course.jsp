
<%@page import="java.util.ArrayList"%>
<%@page import="com.mavenproject1.classes.Course"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>



<%
    if (request.getParameter("submit") != null) {
        String coursename = request.getParameter("scoursename");
        String coursedescription = request.getParameter("scoursedescription");
        int coursefee = Integer.parseInt(request.getParameter("scoursefee"));
        int courseduration = Integer.parseInt(request.getParameter("scourseduration"));

        Course c1 = new Course(coursename, coursedescription, coursefee, courseduration);

        out.println("Nume curs: " + c1.getCoursename());

//        c1.setCoursefee(Integer.parseInt(request.getParameter("scoursefee")));
//        c1.setCoursedescription(request.getParameter("scoursedescription"));;
//        c1.setCourseduration(Integer.parseInt(request.getParameter("scourseduration")));;
        // adaugare obiect c1 in colectia de cursuri din sesiune
        Course v[] = new Course[100];
        int n;
        v = (Course[]) session.getAttribute("vector_cursuri");
        n = Integer.parseInt(String.valueOf(session.getAttribute("n")));

        if (n == 0) {
            out.println("Nu exista cursuri in sesiune!");
        }

        for (int i = 0; i <= n - 1; i++) {
            out.println(v[i].getCoursename());
        }

        v[n] = c1;
        n++;

        session.setAttribute("vector_cursuri", v);
        session.setAttribute("n", n);

//        
//        List<Course> courses_collection = new ArrayList<Course>();
//        courses_collection = (List<Course>) session.getAttribute("courses_collection");
//        
//        if (courses_collection == null)
//        {
//            out.println("Colectie goala!");
//        }
//        else
//        {
//            for (Course c2 : courses_collection) 
//            {
//
//                    out.println(c2.getCoursename());
//            }
//        }
//        
//        courses_collection.add(c1);
//        session.setAttribute("courses_collection", courses_collection);
//        Connection con;
//        PreparedStatement pst, pstCheckDatabase;
//        ResultSet rs;
//
//        Class.forName("com.mysql.jdbc.Driver");
//        con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");
//
//        pstCheckDatabase = con.prepareStatement("select * from courses where course_name = '" + c1.getCoursename() + "' ");
//        rs = pstCheckDatabase.executeQuery();
//
//        int nr = 0;
//        while (rs.next()) {
//            nr++;
//        }
//
//        if (nr > 0) {
//%>
//<script>alert('Datele exista deja in baza!');</script>
//<%
//} else {
//    pst = con.prepareStatement("insert into courses (course_name,course_fee,course_description,duration)values(?,?,?,?)");
//    pst.setString(1, c1.getCoursename());
//    pst.setInt(2, c1.getCoursefee());
//    pst.setString(3, c1.getCoursedescription());
//    pst.setInt(4, c1.getCourseduration());
//
//    pst.executeUpdate();
//%>
//<script>alert('Record added');</script>
//<%
//        }
    }
%>


<%@include file="indexB.jsp" %>


<div class= "row">
    <div class ="col-sm-4">
        <form  method="POST" action ="#">
            <div allight ="left">
                <label class="form-label">Course Name</label>    
                <input type="text" class="form-control" placeholder="Course Name" name="scoursename" id="scoursename" required>                        
            </div>

            <div allight ="left">
                <label class="form-label">Course Fee</label>    
                <input type="number" class="form-control" placeholder="Course Fee" name="scoursefee" id="scoursefee" required>                        
            </div>

            <div allight ="left">
                <label class="form-label">Course Description</label>    
                <input type="text" class="form-control" placeholder="Course Description" name="scoursedescription" id="scoursedescription" required>                        
            </div>
            <div allight ="left">
                <label class="form-label">Course Duration</label>    
                <input type="text" class="form-control" placeholder="Course Duration" name="scourseduration" id="scourseduration" required>                        
            </div>
            </br>
            <div allight ="right">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">    
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning"> 



            </div>        
        </form>
        <br />
        <form action="save_collection.jsp" method="post">
            <input type="submit" id="submit" value="save collection" name="save coolection" class="btn btn-info">  
        </form>
    </div>



</body>
</html>
