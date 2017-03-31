<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="header">
    <div class="opacity-black-background"></div>
    <div class="container-flex">
        <!-- A Row Starts -->
        <!--
          .row büyük ekranlar için tasarlandı. Altındaki .row-mobile ise mobil temalar için.
          İkisi de farklı ekran çözünürlüklerinde aynı satırı gösterdiği için aynı anda gösterilmezler.
          style.css ile kontrol edilerek yerine göre değiştirilerek kullanılıyor.
        -->
        <div class="row">
            <div class="col-6"><h1>Java Rehberi</h1></div>
            <div class="col-6 headerMenu">
                <c:choose>
                    <c:when test="${not empty loggedIn}">Hoşgeldin ${username}</c:when>
                    <c:otherwise>
                        <a class="headerLogButton" href="/loginPage.jsp">Giriş Yap</a>&nbsp;&nbsp;&nbsp;<a class="headerRegButton" href="/registrationPage.jsp">Kayıt Ol</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Belows are for mobile theme-->
        <div class="row-mobile">
            <div class="col-6"><img src="/images/page_icons/menu_icon.png" width="30px" height="30px"></div>
            <div class="col-6 headerMenu">
                <c:choose>
                    <c:when test="${not empty loggedIn}">Hoşgeldin ${username}</c:when>
                    <c:otherwise>
                        <a  class="headerLogButton" href="/loginPage.jsp">Giriş Yap</a>&nbsp;&nbsp;&nbsp;<a class="headerRegButton" href="/registrationPage.jsp">Kayıt Ol</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="headerSiteName"><h1>Java Rehberi</h1></div>
        </div>
        <!-- A Row Ends -->
        <br><br><br>
        <div class="headerPhrase">
            <h2>Türkiye'nin En Büyük Java Kaynağı</h2>
            <br><br>
            <h5>Java Rehberi'nde Java, Android programlama ve Android programlamadan para kazanma konusunda dersleri okuyup, sorularınıza cevap
                bulabilirsiniz. </h5>
        </div>
    </div>
</div>