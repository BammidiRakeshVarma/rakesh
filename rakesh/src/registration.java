import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
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
		doGet(request, response);
		String user = request.getParameter("uname");    
	    String pwd = request.getParameter("pass");
	    String fname = request.getParameter("fname");
	    String lname = request.getParameter("lname");
	    String email = request.getParameter("email");
	    String city = request.getParameter("city");
	    String phone = request.getParameter("phone");
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
		    Statement st = con.createStatement();
		    //ResultSet rs;
		    int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "',md5('"+pwd+"'), CURDATE())");
		    if (i > 0) {
		        //session.setAttribute("userid", user);
		        st.executeUpdate("insert into info(uname,city,phone) values ( '" + user + "', '" + city + "','" + phone +"')" );
		        response.sendRedirect("index.jsp");
		       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
		    } else {
		        response.sendRedirect("index.jsp");
		    }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(Exception ex){
			ex.printStackTrace();
		}		
	}
}
