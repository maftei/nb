
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="indexA.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="com.mavenproject1.classes.User"%> 

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="register-form.css">
    </head>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-font-smoothing: antialiased;
            -moz-font-smoothing: antialiased;
            -o-font-smoothing: antialiased;
            font-smoothing: antialiased;
            text-rendering: optimizeLegibility;
        }

        body {
            font-family: "Roboto", Helvetica, Arial, sans-serif;
            font-weight: 100;
            font-size: 12px;
            line-height: 30px;
            color: #777;
            background: #87CEEB;
        }

        .container {
            max-width: 400px;
            width: 100%;
            margin: 0 auto;
            position: relative;
        }

        #contact input[type="text"],
        #contact input[type="email"],
        #contact input[type="tel"],
        #contact input[type="url"],
        #contact textarea,
        #contact button[type="submit"] {
            font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
        }

        #contact {
            background: #F9F9F9;
            padding: 25px;
            margin: 150px 0;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        #contact h3 {
            display: block;
            font-size: 30px;
            font-weight: 300;
            margin-bottom: 10px;
        }

        #contact h4 {
            margin: 5px 0 15px;
            display: block;
            font-size: 13px;
            font-weight: 400;
        }

        fieldset {
            border: medium none !important;
            margin: 0 0 10px;
            min-width: 100%;
            padding: 0;
            width: 100%;
        }

        #contact input[type="text"],
        #contact input[type="email"],
        #contact input[type="tel"],
        #contact input[type="url"],
        #contact textarea {
            width: 100%;
            border: 1px solid #ccc;
            background: #FFF;
            margin: 0 0 5px;
            padding: 10px;
        }

        #contact input[type="text"]:hover,
        #contact input[type="email"]:hover,
        #contact input[type="tel"]:hover,
        #contact input[type="url"]:hover,
        #contact textarea:hover {
            -webkit-transition: border-color 0.3s ease-in-out;
            -moz-transition: border-color 0.3s ease-in-out;
            transition: border-color 0.3s ease-in-out;
            border: 1px solid #aaa;
        }

        #contact textarea {
            height: 100px;
            max-width: 100%;
            resize: none;
        }

        #contact button[type="submit"] {
            cursor: pointer;
            width: 100%;
            border: none;
            background: #0000CD;
            color: #FFF;
            margin: 0 0 5px;
            padding: 10px;
            font-size: 15px;
        }

        #contact button[type="submit"]:hover {
            background: #87CEEB;
            -webkit-transition: background 0.3s ease-in-out;
            -moz-transition: background 0.3s ease-in-out;
            transition: background-color 0.3s ease-in-out;
        }

        #contact button[type="submit"]:active {
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
        }

        .copyright {
            text-align: center;
        }

        #contact input:focus,
        #contact textarea:focus {
            outline: 0;
            border: 1px solid #aaa;
        }

        ::-webkit-input-placeholder {
            color: #888;
        }

        :-moz-placeholder {
            color: #888;
        }

        ::-moz-placeholder {
            color: #888;
        }

        :-ms-input-placeholder {
            color: #888;
        }
    </style>


    <%
        if (request.getParameter("submit") != null) {
            String userName = (request.getParameter("txt_username"));
            String userPassword = (request.getParameter("txt_password"));

            Connection con;
            PreparedStatement pst, pstCheckDatabase;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/universitate", "andrei", "12345");

            pstCheckDatabase = con.prepareStatement("SELECT * FROM user WHERE username = '" + userName + "' AND password = '" + userPassword + "' ");
            rs = pstCheckDatabase.executeQuery();

            int id_user = 0;
            int rowsNumber = 0;
            while (rs.next()) {
                rowsNumber++;
                id_user =Integer.parseInt(rs.getString("id"));
            }

            if (rowsNumber > 0) 
            {
                session.setAttribute("id_user_logat", id_user );
                session.setAttribute("username_logat", userName );
                
                out.println("<script>alert('Datele sunt corecte!');</script>");
                out.println("<meta http-equiv='refresh' content='0;URL=indexB.jsp'>");  
            }
            else
            {
               out.println("<script>alert('Check Username OR Password!');</script>");
            }
        }
    %>




    <body>
        <div class="container">  
            <form id="contact" action="login.jsp" method="post">
                <h3> Login Form</h3>
                <h4>Please enter your credentials</h4
                </fieldset>
                <fieldset>
                    <input placeholder="Username" type="text" name= "txt_username" tabindex="1" required>
                </fieldset>
                <fieldset>
                    <input placeholder="Password" type="password"  name = "txt_password" tabindex="2" required>
                </fieldset>



                <!--                <fieldset>
                                    <textarea placeholder="Type your message here...." tabindex="5" required></textarea>
                                </fieldset>-->
                <fieldset>
                    <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Login</button>
                </fieldset>
            </form>
        </div>


    </body>
</html>