<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 27.03.2017
  Time: 20:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/common_pages/config.jsp"/>


<c:if test="${not empty loggedIn}">
    <a href="/writeEssayPage.jsp" class="sendEssayButton" style="display: block">Makale Gönder</a>
    <br>
</c:if>
<div class="categories">
    <h4 class="brown">Kategoriler</h4>
    <br>
    <sql:query var="result" dataSource="${dataSource}" sql="SELECT catName,catUrl,id FROM category"/>
    <ul>
        <c:forEach var="row" items="${result.rows}">
            <sql:query var="number" dataSource="${dataSource}" sql="SELECT COUNT(*) AS counter FROM essay WHERE catID = ?">
                <sql:param value="${row.id}"/>
            </sql:query>
            <c:forEach var="sub_row" items="${number.rows}">
                <li><img src="/images/category_icons/${row.catUrl}.png" class="circle"><a href="/${row.catUrl}.jsp">${row.catName}(${sub_row.counter})</a></li>
            </c:forEach>
        </c:forEach>
    </ul>
</div>