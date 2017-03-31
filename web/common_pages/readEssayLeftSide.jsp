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

<!-- MAKALE START -->
<sql:query var="result" dataSource="${dataSource}" sql="SELECT * FROM essay WHERE id=? LIMIT 1">  <%-- makale bilgileri çekiliyor --%>
    <sql:param value="${param.essayID}"/>
</sql:query>
<c:forEach var="row" items="${result.rows}">
    <div class="content_container shadow_box">
        <h2 class="brown">${row.title}</h2>
        <br>
        <span>${row.content}</span>
        <sql:query var="name" dataSource="${dataSource}" sql="SELECT realName FROM member WHERE id = ? LIMIT 1">  <%-- kullanıcı id'sinden diğer bilgilere ulaşılıyor --%>
            <sql:param value="${row.authorID}"/>  <%-- essay tablosundan author_id post edildi. --%>
        </sql:query>
        <c:forEach  var="sub_row" items="${name.rows}">  <%-- gerçek isim alındı ve ekrana bastırılıyor. --%>
            <div class="content_footer">
                <b>${sub_row.realName}</b> tarafından paylaşıldı.
            </div>
        </c:forEach>
        <div class="divider"></div>
    </div>
</c:forEach>
<!-- MAKALE END -->

<!-- YORUMLARI GÖRÜNTÜLEME ALANI START -->
<h3 class="brown">Yorumlar</h3>
<br>
<div id="comments">
    <jsp:include page="/common_pages/readEssayComments.jsp"/>
</div>
<!-- YORUMLARI GÖRÜNTÜLEME ALANI END-->

<!-- YORUM YAZMA ALANI START -->
<h3 class="brown">Sen de yorum yaz..</h3>
<br>
<textarea id="comment" style="box-sizing: border-box; width: 100%; max-width: 100%; height: 200px; padding: 10px; border-radius: 3px;border: 1px solid #BDBDBD;"></textarea>
<br>
<div style="text-align: right;">
    <input type="submit" onclick="sendComment('${param.essayID}')" value="Gönder" class="sendEssayButton">
</div>
<!-- YORUM YAZMA ALANI END -->