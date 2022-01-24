package jspexp.a02_mvc.a01_controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a04_member.member_dao;
import jspexp.a04_member.member_vo;

/**
 * Servlet implementation class A11_CheckIdCtrl
 */
@WebServlet(name = "checkId.do", urlPatterns = { "/checkId.do" })
public class A11_CheckIdCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A11_CheckIdCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	// 1. 요청값..
		String id = request.getParameter("id"); if(id==null) id="";
		
	// 2. DAO 연결, id가 있는지 확인
		member_dao dao = new member_dao();
		member_vo m = dao.getMember(id);
		
	// 3. 전달할 
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (!id.equals("") && m==null) {
			out.print("Y");
		}else {
			out.print("N");
		}
		
		
	}

}
