<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 7.03.2017
  Time: 19:59
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/common_pages/config.jsp"/>

<c:set var="icon_size" value="20px"/> <%-- I set this variable to control w&h of icons in tool. --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Rehberi</title>
    <link rel="stylesheet" href="css/simple-css.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="common_functions/jquery.js"></script>
</head>
<style>
    .input,.select {
        margin: 10px 0 10px 0;
        width: 500px;
        padding: 10px;
        border-radius: 3px;
        border: 1px solid #F5F5F5;
        -webkit-appearance: none;
        -moz-appearance: none;
        text-align: left;
    }

    body {
        background-color: #F5F5F5;
    }

    .essayDiv{
        margin: 10px 0 10px 0;
        width: 500px;
        padding: 10px;
        border-radius: 3px;
        border: 1px solid #F5F5F5;
        -webkit-appearance: none;
        -moz-appearance: none;
    }
</style>
<script>


  $(document).ready(function(){
    $("#imageSelectorIcon").click(function(){
      $("#imageSelector").click();
    });

    $("#linkIcon").on("click", function(){
      $("#essay").val($("#essay").val()+"<a href='#' target='_blank'>test</a>");
    });

    $("#boldIcon").on("click", function(){
      $("#essay").val($("#essay").val()+"<b>test</b>");
    });


    $(".sendEssayButton").on("click", function() {
      var title = encodeURIComponent($("#title").val());
      var essay = encodeURIComponent($("#essay").val());
      var catID = $("#categories").val();
      var spot = encodeURIComponent($("#spot").val());
      $.ajax({
        type:"post",
        url:"/processes/writeEssayProcess.jsp",
        data:"title="+title+"&essay="+essay+"&catID="+catID+"&spot="+spot,
        success:function (e) {
          alert($.trim(e));
        }
      });
    });

    $("#imageSelector").on("change",uploadFile);

  });


  function uploadFile(event) {
    event.stopPropagation();
    event.preventDefault();
    var files = event.target.files;
    var data = new FormData();
    $.each(files, function(key, value)
    {
      data.append(key, value);
    });
    postFilesData(data);
    $("#imageSelector").val(""); // it must be here because of cache. I dont send file with a same name without this command.

  }

  function postFilesData(data) {
    $.ajax({
      url: '/processes/uploadImageProcess.jsp',
      type: 'POST',
      data: data,
      cache: false,
      processData: false,
      contentType: false,
      success: function(e) {
        //success

        $("#essay").val($("#essay").val()+"\n<img src='/pictures/"+$.trim(e)+"'"+" alt='java rehberi ders resmi' style='display:block; margin:10px auto;' width='50%'>\n");

      },
      error: function(e) {
        alert('ERRORS: ' + e);
      }
    });


  }
</script>
<body>
    <jsp:include page="common_pages/goBackBar.jsp"/>
    <br><br><br>
    <div style="text-align: center">
        <div style="display:inline-block; background-color: white; padding: 20px; border-radius: 5px; margin-left: auto; margin-right: auto ">
             <h4 class="brown">Java Rehberi Makale Editörü</h4>
            <br>
            <div id="tools">
                <!-- Image Upload Area Start -->
                <img width="${icon_size}" height="${icon_size}" id="imageSelectorIcon" src="images/editor_icons/image_icon.png">
                <form action="" method="post" enctype="multipart/form-data" style="display: none">
                    <input type="file" id="imageSelector" value="" name="file" size="50" />
                    <br />
                    <input type="submit" id="uploadImage" />
                </form>
                <!-- Image Upload Area End -->

                <!-- Link Area Start -->
                <img width="${icon_size}" height="${icon_size}" id="linkIcon" src="images/editor_icons/link_icon.png" >
                <!-- Link Area End-->

                <!-- Bold Text Area Start-->
                <img width="${icon_size}" height="${icon_size}" id="boldIcon" src="images/editor_icons/bold_icon.png" >
                <!-- Bold Text Area End-->
                <br>
            </div>
            <div id="form" style="font-size: 12px">
                <br>
                <c:if test="${not empty realName}">
                    Yazar: <b>${realName}</b>
                </c:if>
                <br>
                <input type="text" class="input" id="title" placeholder="Makale başlığını giriniz">
                <br>
                <textarea class="input" id="essay" placeholder="Makaleyi giriniz." style="height: 300px; max-width: 500px"></textarea>
                <br>
                <input type="text" class="input" id="spot" placeholder="Spot cümlesini giriniz(Opsiyonel)">
                <br>
                <select class="select" id="categories" style="width: 99.2%;"> 
                    <option value="0" style="padding: 10px" selected="selected">Makalenin ait olduğu kategoriyi seçiniz</option> 
                    <sql:query var="result" dataSource="${dataSource}"  sql="SELECT * FROM category"/> 
                    <c:forEach var="row" items="${result.rows}"> 
                        <option value="${row.id}" style="padding: 10px">${row.catName}</option> 
                    </c:forEach> 
                </select>
                <div style="text-align: right;">
                    <input type="submit" value="Makaleyi Paylaş" class="sendEssayButton">
                </div>

            </div>

            <%-- 
                loginProccess'den dönen sonuç kontrol edilip ekrana bastırılma yapılıyor. 

                Eğer form post edilmesiyse errorMessage attribute boştur ve dolayısıyla aşağıdaki kod çalışmaz.  
            --%> 
            <c:if test="${not empty errorMessage}"> 
                <c:out value="${errorMessage}"/> 
            </c:if> 

        </div>
    </div>

</body>
</html>