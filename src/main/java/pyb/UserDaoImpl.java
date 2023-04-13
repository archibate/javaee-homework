package pyb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {
	public boolean registerUser(User user) throws SQLException {
		Connection conn = BaseDaoImpl.getConnection();
		conn.setAutoCommit(false);
		
		PreparedStatement stmt = conn.prepareStatement("insert into t_user (u_name, u_passwd, u_email, u_tel, u_sex) values (?, md5(?), ?, ?, ?)");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getTel());
		stmt.setString(5, user.getSex());
		if (stmt.executeUpdate() != 1) {
			return false;
		}
		
		conn.commit();
		return true;
	}

	public boolean loginUser(User user) throws SQLException {
		Connection conn = BaseDaoImpl.getConnection();
		conn.setAutoCommit(false);
		
		PreparedStatement stmt = conn.prepareStatement("select u_name from t_user where u_name = ? and u_passwd = md5(?)");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());
        ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			return false;
		}
		
		conn.commit();
		return true;
	}
}
