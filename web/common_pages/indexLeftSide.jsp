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

<sql:query var="result" dataSource="${dataSource}" sql="SELECT id, title, content, authorID, catID FROM essay ORDER BY id DESC"/>  <%-- makale bilgileri çekiliyor --%>

<c:forEach  var="row" items="${result.rows}">  <%-- tüm paylaşımlar alınıyor --%>
    <sql:query var="category" dataSource="${dataSource}" sql="SELECT catUrl FROM category WHERE id=? LIMIT 1">  <%-- paylaşıma ait link bilgileri alınıyor --%>
        <sql:param value="${row.catID}"/>  <%-- essay tablosundan cat_id post edildi --%>
    </sql:query>
    <c:forEach var="sub_row" items="${category.rows}">
        <div class="content_container shadow_box" onclick="goToEssay('${sub_row.catUrl}',${row.id},'${row.title}')">
    </c:forEach>
    <h2 class="brown">${row.title}</h2>
    <br>
    <span>${fn:substring(row.content, 0, 300 )}<a href="#" style="color: #FFC107;">[Devamını Okumak İçin Tıkla.]</a></span>  <%-- yandaki ifade paylaşımların ilk parağraglarını çekip bastırıyor. --%>
    <sql:query var="name" dataSource="${dataSource}" sql="SELECT realName FROM member WHERE id = ? LIMIT 1">  <%-- kullanıcı id'sinden diğer bilgilere ulaşılıyor --%>
        <sql:param value="${row.authorID}"/>  <%-- essay tablosundan author_id post edildi. --%>
    </sql:query>
    <c:forEach  var="sub_row" items="${name.rows}">  <%-- gerçek isim alıntı ve ekrana bastırılıyor. --%>
        <div class="content_footer">
            <b>${sub_row.realName}</b> tarafından paylaşıldı.
        </div>
    </c:forEach>
    <div class="divider"></div>
    </div>
</c:forEach>


