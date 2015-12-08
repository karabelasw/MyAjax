package karabelas;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ajax
 */
public class Ajax extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	private static String DEFAULT_VIEW = "index.jsp";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		System.out.println("YAHOOOO---->Hello World");
		System.out.println("First Name sent was " + request.getParameter("firstName"));
		System.out.println("radio button selected " + request.getParameter("sexy"));
		String combinedName = request.getParameter("sexy") + ", "+ request.getParameter("firstName");
		
		response.setContentType("text/xml");
		response.getWriter().print(combinedName);
		
		System.out.println("server received---->" + combinedName);
		
		
	}

}
