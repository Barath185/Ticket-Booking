package servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.MovieModel;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controller.LoginController;
import controller.RegisterController;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		LoginController lc = new LoginController(email, password);
		
		if(lc.toStore()) {
			List<MovieModel> list=new ArrayList();
			ResultSet rs=lc.toGet();
			try {
				 while (rs.next()) {
			         MovieModel type=new MovieModel();
			         type.setId(rs.getString(1));
			         type.setMovie(rs.getString(2));
			         type.setPrice(rs.getString(3));
			         type.setShowtime(rs.getString(4));
			         type.setDate(rs.getString(5));
			         type.setImage(rs.getString(6));
			         list.add(type);
			      }
				 request.setAttribute("list",list);
				 request.getRequestDispatcher("views/listview.jsp").forward(request,response);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("views/listview.jsp").forward(request,response);
		}else {
			System.out.println("error");
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
