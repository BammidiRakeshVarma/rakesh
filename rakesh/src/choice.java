import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class choice
 */
@WebServlet("/choice")
public class choice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public choice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice=request.getParameter("topic");
		if(choice.equals("hpc")){
			response.sendRedirect("Hpc.jsp");	
		}
		else if(choice.equals("mpi")){
			response.sendRedirect("Mpi.jsp");	
		}
		else if(choice.equals("openmp")){
			response.sendRedirect("Openmp.jsp");
		}
		else if(choice.equals("profiling")){
			response.sendRedirect("Profiling.jsp");
		}
		else if(choice.equals("conferences")){
			response.sendRedirect("Conferenceuser.jsp");
		}
		else if(choice.equals("architecture")){
			response.sendRedirect("architecture.jsp");
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
