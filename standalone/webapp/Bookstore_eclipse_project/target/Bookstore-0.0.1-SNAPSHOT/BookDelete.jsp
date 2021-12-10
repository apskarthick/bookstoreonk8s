<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Books Management Application Demo - Running on Google Kubernetes Engine</title>
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
    but hey, it's pure CSS magic.
    -->
     <ul id="menu">
      <a href="new"><li>Add New Book</li></a>
      <a href="list"><li>List All Books</li></a>
      <a href="showeditpage"><li>Update Books</li></a>
      <a href="delete"><li>Delete Books</li></a>
      <a href="#"><li>Google Cloud Console</li></a>
      <a href="#"><li>Report Issues</li></a>
      <a href="/"><li>Sign Out</li></a>
     </ul>
  </div>
</nav>
<div class="content">
	Books Management Application Demo - Running on Google Kubernetes Engine 
</div>

    <div align="center" class="content2">
    <h3>Use this form to delete the books that are not in stock </h3>
    </div>
    <div align="center" class="content1">
           <table border="1" id="bookstore">
            <tr>
                <th width=50>Book ID</th>
                <th width=80>Title</th>
                <th width=60>Author</th>
                <th width=50>Price (USD)</th>
                <th width=50>Option</th>             
            </tr>
            <tbody>
            <c:forEach var="book" items="${listBook}">
                <tr>
                    <td align="center"><c:out value="${book.id}" /></td>
                    <td><c:out value="${book.title}" /></td>
                    <td><c:out value="${book.author}" /></td>
                    <td align="right"><c:out value="${book.price}" /></td>
                    <td>
                     <a onclick="return confirm('Are you sure want to delete this book from the stock?')" href="DeleteBook?id=<c:out value='${book.id}' /> ">Delete</a>                    	
                    </td>
                 </tr>
            </c:forEach>
        </table>
    </div>	
</body>
</html>
