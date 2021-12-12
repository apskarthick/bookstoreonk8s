<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Bookstore Management Application</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <nav id="navbar">
                <h3>Menu</h3>
                <!--content stacking for smaller screens-->
                <ul class="nav nav-pills nav-stacked">
                 <!--internal linking to the respective sections-->
                    <a class="nav-link" href="/Bookstore/new" rel="internal">
                        <li>Add New Book</li>
                    </a>
                    <a class="nav-link" href="../" rel="internal">
                        <li>Sign Out</li>
                    </a>
                    <a class="nav-link" href="mailto:karthick.pakkiriswamy@cognizant.com;arnab.dutta4@cognizant.com" rel="internal">
                        <li>Report issues</li>
                    </a>
                 </ul>
            </nav>
        </div>
       <div class="col-md-10 col-sm-12 col-xs-12">
            <main id="main-doc">
                <section class="main-section" id="Introduction" >
                 <!--basic styling for the headings, better practice to do the same in a css file as the styling is same for all headers-->
                    <h3 style = "background: blue; color: white">Bookstore Management Application</h3>
                    <article>
                    <p>This is the onprem version of Bookstore Management Application.
                        </article>
                </section>
		
        <h2>
        	<a href="list">Refresh the list of books below</a>
        </h2>
           <section class="main-section" id="Introduction" >
                 <!--basic styling for the headings, better practice to do the same in a css file as the styling is same for all headers-->
                    <h3 style = "background: blue; color: white">Books Stock</h3>
                    <article>
                    <p>Below you will find the list of books in stock.
                        </article>
            </section>
	        <table border="1" cellpadding="5">
                <tr align=center">
                <th>Book ID</th>
                <th>Title</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book" items="${listBook}">
                <tr>
                    <td><c:out value="${book.id}" /></td>
                    <td><c:out value="${book.title}" /></td>
                    <td><c:out value="${book.author}" /></td>
                    <td align="right"><c:out value="${book.price}" /></td>
                    <td>
                    	<a href="/Bookstore/edit?id=<c:out value='${book.id}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="/Bookstore/delete?id=<c:out value='${book.id}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
                    <section class="main-section" id="What_you_should_already_know">
                    <h3 style = "background: blue; color: white">Try this one time</h3>
                    <article>
                        <p>Click <a href="https://gke.bookstore.cloudns.nz"> here</a> to access this application running on a Modern Infrastructure and Application Platform powered by Google Cloud!!!</p>
<!--creating list using html-->

                    </article>
                </section>
</body>
</html>
