package pyb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("api-register")
public class Register extends HttpServlet {

      public void doGet(HttpServletRequest request,
                        HttpServletResponse response)
                throws ServletException, IOException
      {
          response.setContentType("text/plain;charset=UTF-8");
          
          String username = request.getParameter("username");
          String password = request.getParameter("password");
          String email = request.getParameter("email");
          String sex = request.getParameter("sex");
          String tel = request.getParameter("tel");
          
          User user = new User();
          user.setUsername(username);
          user.setPassword(password);
          user.setEmail(email);
          user.setSex(sex);
          user.setTel(tel);
          
          UserDao userDao = new ServiceImpl().newUserDao();
          boolean ok = false;
          String errmsg = "用户名或电话或电子邮件已存在";
          try {
			  ok = userDao.registerUser(user);
          } catch (SQLException e) {
			  e.printStackTrace();
              errmsg = e.getMessage();
          }

          PrintWriter out = response.getWriter();
          if (ok) {
        	  out.println("注册成功，正在跳转到登录页面");
              response.sendRedirect("login.jsp");
          } else {
        	  out.println("注册失败：" + errmsg);
          }
      }

      public void doPost(HttpServletRequest request,
                         HttpServletResponse response)
          throws ServletException, IOException {
         doGet(request, response);
      }
}
