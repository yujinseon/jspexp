package jspexp.a02_mvc.a01_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A07_Controller
 */
@WebServlet(name = "mvcAjax04", urlPatterns = { "/mvcAjax04" })
public class A07_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A07_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("호출됨!!");
		String prodname = request.getParameter("prodname");
		String price = request.getParameter("price");
		String cnt = request.getParameter("cnt");
		System.out.println("물건명:"+prodname);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();		
		out.print("{\"pname\":\"컴퓨터\"}");
		// {"pname":"컴퓨터"}
	}

}
