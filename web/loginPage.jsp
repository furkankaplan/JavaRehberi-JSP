<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 6.03.2017
  Time: 21:44
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Rehberi</title>
    <link rel="stylesheet" href="css/simple-css.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
    input {
        margin: 10px 0 10px 0;
        width: 300px;
        padding: 10px;
        border-radius: 3px;
        border: 1px solid #F5F5F5;
    }

    body {
        background-color: #F5F5F5;
    }

    form{
        text-align: right;
    }

</style>
<body>
    <jsp:include page="/common_pages/goBackBar.jsp"/>
    <br><br><br>
    <center> 
        <div style="display:inline-block; background-color: white; padding: 20px; border-radius: 5px; ">
              <h4 class="brown">Java Rehberi'ne Hoş Geldin..</h4>
            <br>
            <form action="/processes/loginProcess.jsp" method="post">
                 <input type="email" name="email" placeholder="Email adresiniz"><br> 
                <input type="password" name="passwd" placeholder="Şifreniz"><br> 
                <input type="submit" value="Giriş Yap!" style="width:auto;background-color: #FFC107; color: white; border: none; border-radius: 3px ">
            </form>
            <%-- 
                loginProccess'den dönen sonuç kontrol edilip ekrana bastırılma yapılıyor. 

                Eğer form post edilmesiyse errorMessage attribute boştur ve dolayısıyla aşağıdaki kod çalışmaz.  
            --%> 
            <c:if test="${not empty errorMessage}"> 
                <c:out value="${errorMessage}"/> 
            </c:if> 
        </div>
         
    </center>
</body>
</html>
