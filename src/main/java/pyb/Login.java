package pyb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

@WebServlet("api-login")
public class Login extends HttpServlet {

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
          String errmsg = "用户名或密码错误";
          try {
			  ok = userDao.loginUser(user);
          } catch (SQLException e) {
			  e.printStackTrace();
              errmsg = e.getMessage();
          }

          PrintWriter out = response.getWriter();
          if (ok) {
              response.addCookie(new Cookie("loginName", user.getUsername()));
        	  out.println("登录成功，正在跳转到首页");
              response.sendRedirect("commodity.jsp");
          } else {
        	  out.println("登录失败：" + errmsg);
          }
      }

      public void doPost(HttpServletRequest request,
                         HttpServletResponse response)
          throws ServletException, IOException {
         doGet(request, response);
      }
}
