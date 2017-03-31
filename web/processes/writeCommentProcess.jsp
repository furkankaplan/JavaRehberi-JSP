<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 21.03.2017
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common_functions/User.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String comment = nl2br(request.getParameter("comment").trim());
    String email = String.valueOf(session.getAttribute("email"));
    int essayID = Integer.parseInt(request.getParameter("essayID"));
    LocalDate  localDate = LocalDate.now();
    String date = String.valueOf(localDate);
    String  currentMillisec = String.valueOf(TimeUnit.NANOSECONDS.toMicros(System.nanoTime()));
    int userId = User.getId(String.valueOf(session.getAttribute("email")));  // Email adresini kullanarak kullanıcı id'sini çektik.

    if(essayID < 1){
      %>
        <%="Makale id'si bulunamadı!"%>
      <%
        return;
    }

    if(email == null || userId < 1){
      %>
        <%="Giriş yapmadan yorum yazamazsın!"%>
      <%
        return;
    }

    Connection connection = null;
    PreparedStatement statement = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8", "root", "");

        statement = connection.prepareStatement("INSERT INTO comment (id, essayID, writerID, comment, createdAt, currentMillisec)"
                + " VALUES (?,?,?,?,?,?) ");
        statement.setNull(1,Types.INTEGER);
        statement.setInt(2, essayID);
        statement.setInt(3, userId);
        statement.setString(4, comment);
        statement.setString(5, date);
        statement.setString(6, currentMillisec);
        statement.executeUpdate();

        statement.close();
        connection.close();
        %>
        <%="Tebrikler! Başarıyla Paylaştın!"%>
        <%
    }catch (ClassNotFoundException | SQLException e){
        %>
           <%=e%>
        <%
    }
%>
<%!
    private String nl2br(String msg)
    {
        msg = msg.replace("\n","<br>");
        return msg;
    }
%>