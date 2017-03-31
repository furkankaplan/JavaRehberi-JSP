<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 29.03.2017
  Time: 15:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/common_pages/config.jsp"/>
<html>
<body>
<sql:query var="result" dataSource="${dataSource}" sql="SELECT * FROM comment WHERE essayID=? ORDER BY id DESC ">
    <sql:param value="${param.essayID}"/>
</sql:query>
<c:forEach var="row" items="${result.rows}">
    <div style=" margin-bottom: 20px; padding: 10px; background-color: #f9f9f9; border-radius: 3px; ">
            ${row.comment}<br>
        <sql:query var="user" dataSource="${dataSource}" sql="SELECT realName FROM member WHERE id=? LIMIT 1">
            <sql:param value="${row.writerID}"/>
        </sql:query>
        <c:forEach var="sub_row" items="${user.rows}">
            <span style="color: #BDBDBD; margin-top: 10px; display: block;  font-size: 12px;"><b>${sub_row.realName}</b> tarafından yazıldı.</span>
        </c:forEach>
    </div>
</c:forEach>
</body>
</html>