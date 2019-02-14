<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<% ArrayList<User> users = (ArrayList<User>) request.getAttribute("users"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/UsersManager/GererUsers">
		cin <input type="text" name="cin" value="" /><br /><br />
		nom <input type="text" name="nom" value="" /><br /><br />
		prenom <input type="text" name="prenom" value="" /><br /><br />
		adresse <input type="text" name="adresse" value="" /><br /><br />
		<input type="submit" name="add" value="ajouter"><br /><br />
	</form>
	<% if (users != null) { %>
		<br /><br />
		<table>
		  <tr>
		    <th>CIN</th>
		    <th>Nom</th>
		    <th>Prenom</th>
		    <th>Adresse</th>
		  </tr>
		  <% for(User user : users ) { %>
			<tr>
		    	<td><%= user.getCin() %></td>
		    	<td><%= user.getNom() %></td>
		    	<td><%= user.getPrenom() %></td>
		    	<td><%= user.getAdresse() %></td>
		  	</tr>		  	
		  <% } %>
		</table>
		
	<% } %>
</body>
</html>