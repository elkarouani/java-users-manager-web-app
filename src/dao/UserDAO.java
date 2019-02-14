package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Model.User;

public class UserDAO {
	
	public static Connection getConnection(){
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/WebApp");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int addUser(User user){
		Connection con = getConnection();
		try {
			return con.createStatement().executeUpdate(""
					+ "insert into users values ('" + user.getCin()
					+ "', '" + user.getNom()
					+ "', '" + user.getPrenom()
					+ "', '" + user.getAdresse()+"' )");
		} catch (Exception e) {
			return -1;
		}
	}
	
	public static ArrayList<User> getAllUsers(){
		Connection con = getConnection();
		ArrayList<User> userList = new ArrayList<User>();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users ;");
			while (rs.next()) {
				String cin = rs.getString("cin");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String adresse = rs.getString("adresse");
				
				User user = new User(cin, nom, prenom, adresse);
				
				userList.add(user);
			}
			
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
