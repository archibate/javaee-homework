package pyb;

import java.sql.SQLException;

public interface UserDao {
	public boolean registerUser(User user) throws SQLException;
	public boolean loginUser(User user) throws SQLException;
}
