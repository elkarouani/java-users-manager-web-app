package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
