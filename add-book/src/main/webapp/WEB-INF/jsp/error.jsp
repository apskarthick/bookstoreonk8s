<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Books Management Application Demo - Running on Google Kubernetes Engine </title>
	<link href="./css/styles.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
</head>


<body>

<nav role="navigation">
  <div id="menuToggle">
    <!--
    A fake / hidden checkbox is used as click reciever,
    so you can use the :checked selector on it.
    -->
    <input type="checkbox" />
    
    <span></span>
    
    <span></span>
    <span></span>
    
    <!--
    Too bad the menu has to be inside of the button
    but hey, its pure CSS magic.
    -->
     <ul id="menu">
      <a href="/addnewbook"><li>Add New Book</li></a>
      <a href="/listallbooks"><li>List All Books</li></a>
      <a href="/showupdateform"><li>Update/Delete Books</li></a>
      <a href="/"><li>Sign Out</li></a>
      <a href="mailto:karthick.pakkiriswamy@cognizant.com;arnab.dutta4@cognizant.com"><li>Report Issues</li></a>
     </ul>
  </div>
</nav>
<div class="content">
	Books Management Application Demo - Running on Google Kubernetes Engine
</div>
<div  class="content3"> </div>
    <div  class="content3">

    <h4>
    <br>
                 Book with same title already exists, you may update the details     
    </h4>
   </div>	
  <!-- 
 <div  class="content4">
	<%=exception.getMessage() %>
</div>	
  -->
<div  class="content3"> </div>
<div  class="content3"> <a href=/listallbooks>Home Page </a> </div>
</body>
</html>


