<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<% ArrayList<User> users = (ArrayList<User>) request.getAttribute("users"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<link href="assets/css/app.css" rel="stylesheet" type="text/css">
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<title>Users Manager</title>
	</head>
	<body>
		<div class="card login">
  			<div class="card-header text-center">
    			Create New User : 
  			</div>
  			<div class="card-body">
    			<form class="form-group" method="post" action="/UsersManager/GererUsers">
					<label for="cinInput">cin : </label>
					<input id="cinInput" class="form-control" type="text" name="cin" value="" />
					<label for="nomInput">nom : </label>
					<input id="nomInput" class="form-control" type="text" name="nom" value="" />
					<label for="prenomInput">prenom : </label>
					<input id="prenomInput" class="form-control" type="text" name="prenom" value="" />
					<label for="adresseInput">adresse : </label>
					<input id="adresseInput" class="form-control" type="text" name="adresse" value="" /><br/>
					<input class="form-control btn btn-primary" type="submit" name="add" value="ajouter">
				</form>
  			</div>
		</div>
		<br />
		
		<% if (users != null) { %>
			<a class="btn btn-link toggleList" href="/UsersManager/">
				<ion-icon name="remove-circle-outline" size="large"></ion-icon>Hide Users List
			</a>
			<br /><br />
			<form method="post" action="/UsersManager/GererUsers">
				<label for="searchInput">Search By CIN : </label>
				<input id="searchInput" type="text" name="cin" value="">
				<input type="submit" name="search" value="Search">
			</form>
			<br /><br />
			<table>
		  		<% if (users.size() != 0) { %>
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
				<% } else { %>
					<tr><th>There is no user with that CIN !!</th></tr>
				<% } %>
			</table>
		<% } else { %>
			<a class="btn btn-link toggleList" href="/UsersManager/GererUsers?action=display">
				<ion-icon name="add-circle-outline" size="large"></ion-icon>Display Users List
			</a>
		<% } %>
		<br />
		
		<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>
	</body>
</html>