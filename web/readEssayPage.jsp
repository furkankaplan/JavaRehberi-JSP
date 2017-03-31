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

<jsp:include page="/common_pages/config.jsp"/>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Rehberi</title>
    <link rel="stylesheet" href="/css/simple-css.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/common_functions/jquery.js"></script>
  </head>
  <script>

    function sendComment(essayID) {
      var comment = decodeURIComponent($.trim($("#comment").val()));
      if(comment == 0){
        alert("boş geçilemez");
      }else {
        $.ajax({
          type:"post",
          url:"/processes/writeCommentProcess.jsp",
          data: "comment="+comment+"&essayID="+essayID,
          success:function (e) {
            alert($.trim(e));
            reloadComments();
          },
          error: function(e) {
            alert('ERRORS: ' +JSON.stringify(e));
          }
        })
      }

    }
    function reloadComments() {
      $.ajax({
        type:"post",
        url:"/common_pages/readEssayComments.jsp",
        data:"essayID="+${param.essayID},
        success:function(e){
          $("#comments").html(e);
        }
      });
      $("#comment").val("");  // Yorum yazma alanını temizliyor.
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
            <jsp:include page="/common_pages/readEssayLeftSide.jsp"/>
          </div>
          <div class="col-3">
            <jsp:include page="/common_pages/rightSide.jsp"/>
          </div>
        </div>
        <!-- Belows are for mobile theme-->
        <div class="row-mobile col-12">
          <jsp:include page="/common_pages/readEssayLeftSide.jsp"/>
        </div>
        <!-- A Row Ends -->
      </div>
      <!-- MIDDLE END -->

    </div>
  </body>
</html>
