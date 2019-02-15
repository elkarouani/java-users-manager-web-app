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
	<br /><br />
	
	
	<% if (users != null) { %>
		<br /><br />
		<a href="/UsersManager/">Hide users list</a>
		<br /><br />
		<table>
		  <tr>
		    <th>CIN</th>
		    <th>Nom</th>
		    <th>Prenom</th>
		    <th>Adresse</th>
		    <th>Actions</th>
		  </tr>
		  <% for(User user : users ) { %>
			<form method="post" action="/UsersManager/GererUsers">
				<tr>
			    	<td><input type="text" name="cin" value="<%= user.getCin() %>" /></td>
			    	<td><input type="text" name="nom" value="<%= user.getNom() %>" /></td>
			    	<td><input type="text" name="prenom" value="<%= user.getPrenom() %>" /></td>
			    	<td><input type="text" name="adresse" value="<%= user.getAdresse() %>" /></td>
			    	<td>
			    		<input type="submit" name="modify" value="modifier">
			    		<input type="submit" name="delete" value="supprimer">
			    	</td>
			  	</tr>
			</form>		  	
		  <% } %>
		</table>
	<% } else { %>
		<a href="/UsersManager/GererUsers?action=display">Display users list</a>
	<% } %>
	
		
</body>
</html>