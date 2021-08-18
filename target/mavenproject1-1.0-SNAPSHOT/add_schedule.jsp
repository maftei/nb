
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if (request.getParameter("submit") != null) {
        String choosen_course_id = request.getParameter("cbo_curs");
        String course_data = request.getParameter("datepicker");
        
        String zi = course_data.substring(3, 5);
        String luna = course_data.substring(0, 2);
        String an = course_data.substring(6, 10);
        
        
        out.println(course_data);
        out.println(an);
        
        course_data = an + "-" + luna + "-" + zi;
        out.println(course_data);
        

        Connection con;
        PreparedStatement pst, pstCheckDatabase;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

        pstCheckDatabase = con.prepareStatement("SELECT * FROM schedule WHERE id_course= '" + choosen_course_id + "' AND start_date='" + course_data + "'");
        rs = pstCheckDatabase.executeQuery();

        int nr = 0;
        while (rs.next()) {
            nr++;
        }

        if (nr > 0) {
%>
<script>alert('Datele exista deja in baza!');</script>
<%
} else {
    pst = con.prepareStatement("INSERT INTO schedule (id_course, start_date) VALUES (?,?)");
    pst.setString(1, choosen_course_id);
    pst.setString(2, course_data);

    pst.executeUpdate();
%>
<script>alert('Record added');</script>
<%
        }
    }

%>


<%@include file="indexB.jsp" %>

<script>
    $(function () {
        $("#datepicker").datepicker();
    });
</script>

<div class= "row">
    <div class ="col-sm-4">
        <form  method="POST" action ="#">
            <div allight ="left">
                <label class="form-label">Course Name</label> 
                <br />
                <%    Connection con;
                    PreparedStatement pst, pstCheckDatabase;
                    ResultSet rs;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

                    pstCheckDatabase = con.prepareStatement("SELECT * FROM courses ORDER BY course_name");
                    rs = pstCheckDatabase.executeQuery();

                    int nr = 0;
                    String id_curs = "0";
                    String course_name = "";
                    out.println("<select name='cbo_curs' class='form-control' required>");
                    out.println("<option value='0'>[ Peek course ]</option>");
                    while (rs.next()) 
                    {
                        id_curs = rs.getString("id");
                        course_name = rs.getString("course_name");
                        out.println("<option value='" + id_curs + "'>" + course_name + "</option>");
                        nr++;
                    }
                    out.println("</select>");
                    con.close();
                %>
                <br />
                <p><strong>Date</strong>: <input type="text" id="datepicker" name="datepicker" required></p>
                <br />
            </div>
            <div allight ="right">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">    
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning"> 
            </div>        


        </form>
    </div>

</body>
</html>
