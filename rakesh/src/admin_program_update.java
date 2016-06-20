import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class admin_program_update
 */
@WebServlet(description = "admin updates the program", urlPatterns = { "/admin_program_update" })
public class admin_program_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_program_update() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String choice=request.getParameter("program");
		Connection con;
		Statement st;
		if(choice.equals("openmp")){
			String os1=request.getParameter("pname");
			String os2=request.getParameter("prog");
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
			st = (Statement) con.createStatement();
			st.executeUpdate("insert into openmp(program,progname) values('" + os2 + "','" + os1 + "')");
			response.sendRedirect("adminsuccess.jsp");
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		else if(choice.equals("mpi")){
			String s1=request.getParameter("pname");
			String s2=request.getParameter("prog");
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
			st = (Statement) con.createStatement();
			st.executeUpdate("insert into mpi(mpiprogram,mprogname) values('" + s2 + "','" + s1 + "')");
			response.sendRedirect("adminsuccess.jsp");
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}

	}

}
