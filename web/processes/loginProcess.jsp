<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 4.03.2017
  Time: 21:22
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    if (email.isEmpty() || passwd.isEmpty()) {
        request.setAttribute("errorMessage", "Hiçbir alan boş geçilemez!");
        RequestDispatcher rd = request.getRequestDispatcher("/loginPage.jsp");
        rd.forward(request, response);
    } else {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8", "root", "");
            statement = connection.prepareStatement("SELECT COUNT(*),username,realName FROM member WHERE email=? and passwd=? LIMIT 1");
            statement.setString(1, email);
            statement.setString(2, passwd);
            ResultSet resultSet = statement.executeQuery();

            int rowCount = 0;
            //int rank = 0;
            String username = null, realName = null;

            while (resultSet.next()) {
                rowCount = resultSet.getInt("COUNT(*)");
                username = resultSet.getString("username");
                realName = resultSet.getString("realName");
                //rank = resultSet.getInt("rank");
            }

            if (rowCount == 0) {
                // Bu email ve şifre kombinasyonunda üye bulunamadı.
                session.invalidate();
                request.setAttribute("errorMessage", "Yanlış kullanıcı adı / şifre");
                RequestDispatcher rd = request.getRequestDispatcher("/loginPage.jsp");
                rd.forward(request, response);
            } else {
                // Başarıyla giriş yapıldı.
                session.setAttribute("loggedIn", true);
                session.setAttribute("email", email);
                session.setAttribute("username", username);
                session.setAttribute("realName", realName);
                //session.setAttribute("rank",rank);
                response.sendRedirect("/");
            }

            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e);
            RequestDispatcher rd = request.getRequestDispatcher("/loginPage.jsp");
            rd.forward(request, response);
        }

    }


%>
