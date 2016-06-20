

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mpi
 */
@WebServlet("/mpi")
public class mpi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mpi() {
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
		String ch=request.getParameter("mpi");
		int m=Integer.parseInt(ch);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
			Statement st = con.createStatement();
			String sql = "select mpiprogram from mpi where mid='" + m + "'";
			rs = st.executeQuery(sql);
			
			
			if (rs.next()) {
				input = rs.getCharacterStream("mpiprogram");
				BufferedReader br = new BufferedReader(input);
				String line;
		        while(null != (line = br.readLine())) {
		            sb.append(line);
		            sb.append(ls);
		        }
		        br.close();
		        response.getWriter().write(sb.toString());
				//request.setAttribute("result",sb.toString());
				//String nextJSP = "/mpi_programs.jsp"; 
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
		doGet(request, response);
	}

}
