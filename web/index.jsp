<%--
  Created by fucking IntelliJ IDEA.
  User: furkankaplan
  Date: 3.03.2017
  Time: 18:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Rehberi</title>
    <link rel="stylesheet" href="/css/simple-css.css">
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <script>
    function goToEssay(catUrl, essayID, title) {
      title = toSeoUrl(title);
      location = "/dersler/"+catUrl+"/"+essayID+"/"+title;
    }

    function toSeoUrl(textString) {

      textString = textString.replace(/ /g, "-");
      textString = textString.replace(/</g, "");
      textString = textString.replace(/>/g, "");
      textString = textString.replace(/"/g, "");
      textString = textString.replace(/é/g, "");
      textString = textString.replace(/!/g, "");
      textString = textString.replace(/'/, "");
      textString = textString.replace(/£/, "");
      textString = textString.replace(/^/, "");
      textString = textString.replace(/#/, "");
      textString = textString.replace(/$/, "");
      textString = textString.replace(/\+/g, "");
      textString = textString.replace(/%/g, "");
      textString = textString.replace(/½/g, "");
      textString = textString.replace(/&/g, "");
      textString = textString.replace(/\//g, "");
      textString = textString.replace(/{/g, "");
      textString = textString.replace(/\(/g, "");
      textString = textString.replace(/\[/g, "");
      textString = textString.replace(/\)/g, "");
      textString = textString.replace(/]/g, "");
      textString = textString.replace(/=/g, "");
      textString = textString.replace(/}/g, "");
      textString = textString.replace(/\?/g, "");
      textString = textString.replace(/\*/g, "");
      textString = textString.replace(/@/g, "");
      textString = textString.replace(/€/g, "");
      textString = textString.replace(/~/g, "");
      textString = textString.replace(/æ/g, "");
      textString = textString.replace(/ß/g, "");
      textString = textString.replace(/;/g, "");
      textString = textString.replace(/,/g, "");
      textString = textString.replace(/`/g, "");
      textString = textString.replace(/|/g, "");
      textString = textString.replace(/\./g, "");
      textString = textString.replace(/:/g, "");
      textString = textString.replace(/İ/g, "i");
      textString = textString.replace(/I/g, "i");
      textString = textString.replace(/ı/g, "i");
      textString = textString.replace(/ğ/g, "g");
      textString = textString.replace(/Ğ/g, "g");
      textString = textString.replace(/ü/g, "u");
      textString = textString.replace(/Ü/g, "u");
      textString = textString.replace(/ş/g, "s");
      textString = textString.replace(/Ş/g, "s");
      textString = textString.replace(/ö/g, "o");
      textString = textString.replace(/Ö/g, "o");
      textString = textString.replace(/ç/g, "c");
      textString = textString.replace(/Ç/g, "c");
      textString = textString.replace(/--/g, "-");
      textString = textString.replace(/---/g, "-");
      textString = textString.replace(/----/g, "-");
      textString = textString.replace(/----/g, "-");

      return textString.toLowerCase();
    }
  </script>
  <body>

  <div class="container-flex">

    <!-- HEADER START -->
    <jsp:include page="/common_pages/header.jsp"/>
    <!-- HEADER END-->

    <!-- <div id="ask_container">Buraya tıklayarak sorunu çekinmeden sorabilirsin.</div> -->

    <!-- MIDDLE START -->
    <div id="middle">
      <!-- A Row Starts -->
      <div class="row">
        <div class="col-space-1"></div>
        <div class="col-7">
          <jsp:include page="common_pages/indexLeftSide.jsp"/>
        </div>
        <div class="col-3">
          <jsp:include page="common_pages/rightSide.jsp"/>
        </div>
      </div>
      <!-- Belows are for mobile theme-->
      <div class="row-mobile col-12">
        <jsp:include page="common_pages/indexLeftSide.jsp"/>
      </div>
      <!-- A Row Ends -->
    </div>
    <!-- MIDDLE END -->

  </div>
  </body>
</html>
