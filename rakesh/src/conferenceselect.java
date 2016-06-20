

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class conferenceselect
 */
@WebServlet(description = "to select conference for user", urlPatterns = { "/conferenceselect" })
public class conferenceselect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public conferenceselect() {
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
		String ch=request.getParameter("conference");
		int n=Integer.parseInt(ch);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
			Statement st = con.createStatement();
		    String sql = "select * from conferences where cid='"+n+"'";
		    rs = st.executeQuery(sql);
			if (rs.next()) {
				String name=rs.getString("name");
				String sdate=rs.getString("startdate");
				String edate=rs.getString("enddate");
				String location=rs.getString("location");
				String type=rs.getString("eventtype");
				String link=rs.getString("link");
				URL url=new URL(link);
				sb.append("</br></br>");sb.append("Name of the Event:");sb.append("</br>");sb.append(name);
				sb.append("</br></br>");sb.append("StartDate");sb.append("</br>");sb.append(sdate);
				sb.append("</br></br>");sb.append("EndDate");sb.append("</br>");sb.append(edate);
				sb.append("</br></br>");sb.append("Location");sb.append("</br>");sb.append(location);
				sb.append("</br></br>");sb.append("Event Type");sb.append("</br>");sb.append(type);
				sb.append("</br></br>");sb.append("Description");sb.append("</br>");
				input = rs.getCharacterStream("description");
				BufferedReader br = new BufferedReader(input);
				String line;
		        while(null != (line = br.readLine())) {
		            sb.append(line);
		            sb.append(ls);
		        }
		        br.close();
		        sb.append("</br></br>");sb.append("Link");sb.append("</br>");sb.append(url);
				response.getWriter().write(sb.toString());
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
