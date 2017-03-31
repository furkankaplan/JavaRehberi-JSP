<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 27.03.2017
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/javarehb_eri.com?useUnicode=true&characterEncoding=UTF-8"
                   user="root"
                   password=""
                   scope="session" />