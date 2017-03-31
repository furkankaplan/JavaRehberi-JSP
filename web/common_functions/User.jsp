<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 24.03.2017
  Time: 22:25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
    public static class User{
        static int getId(String email){
            Connection connection = null;
            PreparedStatement statement = null;
            int author_id = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8", "root", "");

                // @author_id: essays veritabanında kullanmak üzere email sessionunu kullanarak kullanıcı id'sine eriştim.
                statement = connection.prepareStatement("SELECT id FROM member WHERE email=? LIMIT 1");
                statement.setString(1,email);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()){
                    author_id = resultSet.getInt("id");
                }

                statement.close();
                connection.close();
                return author_id;

            }catch (Exception ex){
              // Admin için hata logu tut!
            }

            return author_id;
        }
    }
%>