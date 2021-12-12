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
                    <a class="nav-link" href="/Bookstore/list" rel="internal">
                        <li>See all books</li>
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
                
        
    	<c:if test="${book != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${book == null}">
			<form action="insert" method="post">
        </c:if>
                   <section class="main-section" id="Introduction" >
                 <!--basic styling for the headings, better practice to do the same in a css file as the styling is same for all headers-->
                    <h3 style = "background: blue; color: white">Books Add/Update Section</h3>
                    <article>
                    <p>Below you will find the form to add a new book to stock or update existing book price or other details.
                     </article>
            </section>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${book != null}">
            			Edit Book
            		</c:if>
            		<c:if test="${book == null}">
            			Add New Book
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${book != null}">
        			<input type="hidden" name="id" value="<c:out value='${book.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: </th>
                <td>
                	<input type="text" name="title" size="45"
                			value="<c:out value='${book.title}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Author: </th>
                <td>
                	<input type="text" name="author" size="45"
                			value="<c:out value='${book.author}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                	<input type="text" name="price" size="5"
                			value="<c:out value='${book.price}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            		<input type="button" onclick="javascript:window.location='/Bookstore/list'" value="Cancel" />
            	</td>
             </tr>
        </table>
        </form>
    </div>
    </div>
    </div>
	
</body>
</html>
