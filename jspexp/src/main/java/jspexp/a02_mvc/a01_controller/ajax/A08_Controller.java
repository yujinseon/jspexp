package jspexp.a02_mvc.a01_controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A08_Controller
 */
@WebServlet(name = "mvcAjax05", urlPatterns = { "/mvcAjax05" })
public class A08_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A08_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("컨트롤러 호출!!!");
		// name=홍길동
		String name = request.getParameter("name");
		System.out.println("요청값(name):"+name);
		String stname = request.getParameter("stname");
		System.out.println("요청값(stname):"+stname);
		String kor = request.getParameter("kor");
		System.out.println("요청값(kor):"+kor);
		String math = request.getParameter("math");
		System.out.println("요청값(math):"+math);
		String eng = request.getParameter("eng");
		System.out.println("요청값(eng):"+eng);
		
		
		// client에 넘길 부분..
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// json : javascript object notation
		// {"속성":"문자열속성값","속성2":숫자형}
		// {"name":"홍길동"}
		// "{\"name\":\"홍길동\"}"
		out.print("{\"name\":\"홍길동\"}");
		
	}

}
