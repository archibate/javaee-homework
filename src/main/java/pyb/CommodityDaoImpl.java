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

    public List<Commodity> listCommodityPage(int pageNum, int itemsPerPage) throws SQLException {
        Connection conn = BaseDaoImpl.getConnection();
        conn.setAutoCommit(false);

        PreparedStatement stmt = conn.prepareStatement("select * from commodity limit ?, ?");
        stmt.setInt(1, (pageNum - 1) * itemsPerPage);
        stmt.setInt(2, itemsPerPage);
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

    public int countCommodityPages(int itemsPerPage) throws SQLException {
        Connection conn = BaseDaoImpl.getConnection();
        conn.setAutoCommit(false);

        PreparedStatement stmt = conn.prepareStatement("select count(*) from commodity");
        ResultSet rs = stmt.executeQuery();
        int totalItems = 0;
        if (rs.next()) {
            totalItems = rs.getInt(1);
        }

        conn.commit();
        return (int) Math.ceil((double) totalItems / itemsPerPage);
    }
}
