package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;
import dao.UserDAO;

/**
 * Servlet implementation class GererUsers
 */
@WebServlet("/GererUsers")
public class GererUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GererUsers() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("add") != null) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			
			User user = new User(cin, nom, prenom, adresse);
			
			int result = UserDAO.addUser(user);
			
			if(result != -1){
				ArrayList<User> usersList = UserDAO.getAllUsers();
				
				request.setAttribute( "users", usersList );
			    this.getServletContext().getRequestDispatcher("/index.jsp").forward( request, response );
			} else {
				response.sendRedirect("index.jsp");
			}
		}
		
		if (request.getParameter("modify") != null) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			
			User user = new User(cin, nom, prenom, adresse);
			
			int result = UserDAO.modifyUser(user);
			
			if(result != -1){
				ArrayList<User> usersList = UserDAO.getAllUsers();
				
				request.setAttribute( "users", usersList );
			    this.getServletContext().getRequestDispatcher("/index.jsp").forward( request, response );
			} else {
				response.sendRedirect("index.jsp");
			}
		}
		
		if (request.getParameter("delete") != null) {
			String cin = request.getParameter("cin");
			
			int result = UserDAO.deleteUser(cin);
			
			if(result != -1){
				ArrayList<User> usersList = UserDAO.getAllUsers();
				
				request.setAttribute( "users", usersList );
			    this.getServletContext().getRequestDispatcher("/index.jsp").forward( request, response );
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	}

}
