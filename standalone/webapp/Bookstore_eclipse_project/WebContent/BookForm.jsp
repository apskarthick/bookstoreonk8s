<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Books Management Application Demo - Running on Google Kubernetes Engine</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="./css/styles.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="./js/validation.js"></script>
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

            <div class="content2">
            	<h3>
            		<c:if test="${book != null}">
            			Use this form to edit book details
            		</c:if>
            		<c:if test="${book == null}">
            			Use this form to add the details for the new book
            		</c:if>
            	</h3>
            </div>
        <div align="center" class="content1">
		<c:if test="${book != null}">
       <form name="bookform" action="update" method="post">
        </c:if>
        <c:if test="${book == null}">
			<form name="bookform" action="insert" method="post">
        </c:if>
        <table cellpadding="5" id="bookstore">

        		<c:if test="${book != null}">
        			<input type="hidden" name="id" value="<c:out value='${book.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: <font color="red">*</font></th>
                <td>
                       	<input type="text" name="title" id="title" size="60"
                			value="<c:out value='${book.title}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Author: <font color="red">*</font></th>
                <td>
                	<input type="text" name="author" id="author" size="45"
                			value="<c:out value='${book.author}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Price (in USD): <font color="red">*</font></th>
                <td>
                	<input type="text" name="price" id="price" size="5"
                			value="<c:out value='${book.price}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" onclick="return checkfields()"/>
            	</td>
            </tr>
            <tr>
            	<td colspan="2" align="left">
            		<font color="red">*</font> Mandatory Fields
            	</td>
            </tr>
        </table>
  </form>
    
    </div>	
   
</body>
</html>
