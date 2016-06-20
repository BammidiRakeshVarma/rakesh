

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.*;

/**
 * Servlet implementation class openmp
 */
@WebServlet(description = "choice for openmp programs", urlPatterns = { "/openmp" })
public class openmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public openmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Reader input = null;
		StringBuilder sb = new StringBuilder();
		String  ls = System.getProperty("line.separator");
		ResultSet rs=null;
		String ch=request.getParameter("openmp");
		int n=Integer.parseInt(ch);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
			Statement st = con.createStatement();
		    String sql = "select program from openmp where id='" + n + "'";
		    rs = st.executeQuery(sql);
			if (rs.next()) {
				input = rs.getCharacterStream("program");
				BufferedReader br = new BufferedReader(input);
				String line;
		        while(null != (line = br.readLine())) {
		            sb.append(line);
		            sb.append(ls);
		        }
		        br.close();
		        response.getWriter().write(sb.toString());
				//request.setAttribute("result",sb.toString());
				//String nextJSP = "/openmp_programs.jsp"; 
			    //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP); 
			    //dispatcher.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
