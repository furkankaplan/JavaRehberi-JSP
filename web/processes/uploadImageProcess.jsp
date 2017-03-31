<%--
  Created by IntelliJ IDEA.
  User: furkankaplan
  Date: 12.03.2017
  Time: 20:12
--%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<%
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "/Users/furkankaplan/IdeaProjects/JavaRehberi/web"+ "/pictures/";

    // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.contains("multipart/form-data"))) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("largeImages"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );
        try{
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items

            for (Object fileItem : fileItems) {
                FileItem fi = (FileItem) fileItem;
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    Random random = new Random();
                    final String randomName = (String.valueOf(TimeUnit.NANOSECONDS.toMicros(System.nanoTime())))+"_"+random.nextInt(100)+".jpg";
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath + randomName);
                    } else {
                        file = new File(filePath + randomName);
                    }
                    fi.write(file);
                    System.out.println("Uploaded => "+randomName);

                    %>
                    <%=randomName%>
                    <%

                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
            %>
            <%="no"%>
            <%
        }
    }else{
       System.out.println("No Uploaded!");
         %>
        <%="no"%>
        <%
    }
%>