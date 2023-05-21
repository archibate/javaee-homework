package pyb;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CommodityDaoImpl extends BaseDaoImpl implements CommodityDao {
	public boolean addCommodity(Commodity commodity) throws SQLException {
		Connection conn = BaseDaoImpl.getConnection();
		conn.setAutoCommit(false);
		
		PreparedStatement stmt = conn.prepareStatement("insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values (?, ?, ?, ?, ?)");
		stmt.setString(1, commodity.getInfo());
		stmt.setString(2, commodity.getImgpath());
		stmt.setInt(3, commodity.getSort());
		stmt.setBigDecimal(4, commodity.getPrice());
		stmt.setInt(5, commodity.getStorage());
		if (stmt.executeUpdate() != 1) {
			return false;
		}
		
		conn.commit();
		return true;
	}

    private PreparedStatement makeUpSearchCondition(Connection conn, String sql, String searchKey, int pageNum, int itemsPerPage) throws SQLException {
        String[] searchTerms = null;
        if (searchKey != null && !searchKey.isEmpty()) {
            searchTerms = searchKey.toLowerCase().split("\\s+");
            if (searchTerms.length > 0) {
                sql += "WHERE LOWER(c_info) LIKE ?";
                for (int i = 1; i < searchTerms.length; i++) {
                    sql += " AND LOWER(c_info) LIKE ?";
                }
            }
        }
        if (pageNum != -1) {
            sql += " LIMIT ?, ?";
        }
        PreparedStatement stmt = conn.prepareStatement(sql);

        int paramCount = 1;
        if (searchTerms != null) {
            for (String searchTerm : searchTerms) {
                stmt.setString(paramCount, "%" + searchTerm + "%");
                paramCount++;
            }
        }
        if (pageNum != -1) {
            stmt.setInt(paramCount, (pageNum - 1) * itemsPerPage);
            paramCount++;
            stmt.setInt(paramCount, itemsPerPage);
        }
        return stmt;
    }

    public List<Commodity> listCommodityPage(int pageNum, int itemsPerPage, String searchKey) throws SQLException {
        Connection conn = BaseDaoImpl.getConnection();
        conn.setAutoCommit(false);
        PreparedStatement stmt = makeUpSearchCondition(conn, "SELECT * FROM commodity ", searchKey, pageNum, itemsPerPage);
        ResultSet rs = stmt.executeQuery();
        List<Commodity> commodities = new ArrayList<>();
        while (rs.next()) {
            Commodity commodity = new Commodity();
            commodity.setNo(rs.getInt("c_no"));
            commodity.setInfo(rs.getString("c_info"));
            commodity.setImgpath(rs.getString("c_imgpath"));
            commodity.setSort(rs.getInt("c_sort"));
            commodity.setPrice(rs.getBigDecimal("c_price"));
            commodity.setStorage(rs.getInt("c_storage"));
            commodities.add(commodity);
        }

        conn.commit();
        return commodities;
    }

    public int countCommodityPages(int itemsPerPage, String searchKey) throws SQLException {
        Connection conn = BaseDaoImpl.getConnection();
        conn.setAutoCommit(false);

        PreparedStatement stmt = makeUpSearchCondition(conn, "SELECT COUNT(*) FROM commodity ", searchKey, -1, itemsPerPage);
        ResultSet rs = stmt.executeQuery();
        int totalItems = 0;
        if (rs.next()) {
            totalItems = rs.getInt(1);
        }

        conn.commit();
        return (int) Math.ceil((double) totalItems / itemsPerPage);
    }
}
