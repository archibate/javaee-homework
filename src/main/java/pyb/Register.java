package pyb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/register")
public class Register extends HttpServlet {

      public void doGet(HttpServletRequest request,
                        HttpServletResponse response)
                throws ServletException, IOException
      {
          response.setContentType("text/plain;charset=UTF-8");
          
          String username = request.getParameter("username");
          String password = request.getParameter("password");
          
          User user = new User();
          user.setUsername(username);
          user.setPassword(password);
          
          UserDao userDao = new ServiceImpl().newUserDao();
          boolean ok = false;
          String errmsg = "Unknown";
          try {
			  ok = userDao.registerUser(user);
          } catch (SQLException e) {
			  e.printStackTrace();
              errmsg = e.getMessage();
          }

          PrintWriter out = response.getWriter();
          if (ok) {
        	  out.println("OK");
          } else {
        	  out.println("ERROR:" + errmsg);
          }
      }

      public void doPost(HttpServletRequest request,
                         HttpServletResponse response)
          throws ServletException, IOException {
         doGet(request, response);
      }
}
