<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Random"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File | Upload</title>
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/imgur.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/File.css">
</head>
<body>
<%

//String dprovider=session.getAttribute("dprovider").toString();
//session.setAttribute("dprovider", dprovider);

//Random r= new Random(); 

//String key="ABCDEF123456789";
//char c=key.charAt(r.nextInt(key.length()));
//char c1=key.charAt(r.nextInt(key.length()));
//char c2=key.charAt(r.nextInt(key.length()));
//char c3=key.charAt(r.nextInt(key.length()));
//char c4=key.charAt(r.nextInt(key.length()));
//char c5=key.charAt(r.nextInt(key.length()));

//String Secretkey=""+c+""+c1+""+c2+""+c3+""+c4+""+c5;
//System.out.print(Secretkey);


%>
<div class="d-flex justify-content-center mt-100">
    <div class="row ">
    <form action="FileuploadServlet" method="post" enctype="multipart/form-data">
        <div class="col-md-12">
            <div class="dropzone uploadfuzone fuzone">
                <div class="row">
                    <div class="col-md-8">
                        <div class="fu-text"> <span><i class="fa fa-picture-o"></i> Click here or drop file to upload</span> </div>
                    </div>
                    <div class="col-md-4">
                        <div class="snippet_image_div">
                  <!--        <br><input type="text"  name="key" value="" class="input" readonly/>  -->
                         </div>
                    </div>
                </div> <input type="file" name="filename" value="Choose" class="input" multiple  multiple >
                
            </div>
           
            <button type="submit" class="btn" name="uploadbutton" value="Upload file">Upload file</button>
            
            <div class="status"></div>
            <div class="text-center"><span class="imgur-link"></span></div>
        </div>
    </form>
    </div>
</div>

</body>
</html>