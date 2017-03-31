<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 8.03.2017
  Time: 08:18
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title").trim();
    String essay = nl2br(request.getParameter("essay").trim());
    String spot = request.getParameter("spot").trim();
    String catID = request.getParameter("catID");
    LocalDate  localDate = LocalDate.now();
    String date = String.valueOf(localDate);
    String  currentMillisec = String.valueOf(TimeUnit.NANOSECONDS.toMicros(System.nanoTime()));

    if(title.isEmpty() || essay.isEmpty() || catID.equals("0")){
    %>
    <%="Zorunlu alanlar boş bırakılamaz!"%>
    <%
    }else {
      if(spot.isEmpty())
        spot = "spot-empty";

      Connection connection = null;
      PreparedStatement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8", "root", "");

            // @author_id: essays veritabanında kullanmak üzere email sessionunu kullanarak kullanıcı id'sine eriştim.
            int authorID = 0;
            statement = connection.prepareStatement("SELECT id FROM member WHERE email=? LIMIT 1");
            statement.setString(1,String.valueOf(session.getAttribute("email")));
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
              authorID = resultSet.getInt("id");
            }

            if(authorID == 0){
                %>
                <%="Bu makaleyi paylaşabilmek için giriş yapmak zorundasın!"%>
                <%
                return;
            }

            statement = connection.prepareStatement("INSERT INTO essay (id, authorID, catID, title, content, spot, viewCount, commentCount, isSolved, createdAt, currentMillisec)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            int counter = 0;
            System.out.println(++counter);
            statement.setNull(1, Types.INTEGER);
            statement.setInt(2, authorID);
            statement.setInt(3, Integer.parseInt(catID));
            statement.setString(4, title);
            statement.setString(5, essay);
            statement.setString(6, spot);
            statement.setInt(7, 0);
            statement.setInt(8, 0);
            statement.setInt(9, 0);
            statement.setString(10, date);
            statement.setString(11, currentMillisec);
            statement.executeUpdate();

            statement.close();
            connection.close();
            %>
            <%="Tebrikler! Başarıyla Paylaştın!"%>
            <%
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            %>
            <%=e%>
            <%
        }

    }
%>

<%!
    private String nl2br(String msg)
    {
        msg = msg.replace("\n","<br>");
        return msg;
    }
%>