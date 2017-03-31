<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 4.03.2017
  Time: 21:22



--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    String passwd2 = request.getParameter("passwd2");
    String real_name = request.getParameter("real_name");
    LocalDate  localDate = LocalDate.now();
    String date = String.valueOf(localDate);
    String  currentMillisec = String.valueOf(TimeUnit.NANOSECONDS.toMicros(System.nanoTime()));

    if(username.isEmpty() || email.isEmpty() || passwd.isEmpty() || passwd2.isEmpty() || real_name.isEmpty()){
        request.setAttribute("errorMessage", "Hiçbir alan boş geçilemez!");
        RequestDispatcher rd = request.getRequestDispatcher("/registrationPage.jsp");
        rd.forward(request, response);
    }else {
        if(passwd.equals(passwd2)){
            Connection connection = null;
            PreparedStatement statement = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8","root","");
                statement = connection.prepareStatement("INSERT INTO member (id, realName, username, passwd, email, answerNumber, questionNumber, essayNumber, jPoint, createdAt, currentMillisec) VALUES "
                        + "(?,?,?,?,?,?,?,?,?,?,?)");
                statement.setNull(1,Types.INTEGER);
                statement.setString(2,real_name);
                statement.setString(3,username);
                statement.setString(4,passwd);
                statement.setString(5,email);
                statement.setInt(6,0);
                statement.setInt(7,0);
                statement.setInt(8,0);
                statement.setInt(9,0);
                statement.setString(10,date);
                statement.setString(11,currentMillisec);
                statement.executeUpdate();

                //Başarıyla kayıt olundu.
                session.setAttribute("loggedIn", true);
                session.setAttribute("email", email);
                session.setAttribute("username", username);
                session.setAttribute("real_name", real_name);
                //session.setAttribute("rank",0);
                response.sendRedirect("/");

                statement.close();
                connection.close();

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", e);
                RequestDispatcher rd = request.getRequestDispatcher("/registrationPage.jsp");
                rd.forward(request, response);
            }
        }else {
            request.setAttribute("errorMessage", "Şifreler eşleşmiyor!");
            RequestDispatcher rd = request.getRequestDispatcher("/registrationPage.jsp");
            rd.forward(request, response);
        }
    }


%>
