package pyb;

import java.util.List;
import java.sql.SQLException;

public interface CommodityDao {
	public boolean addCommodity(Commodity commodity) throws SQLException;
    public List<Commodity> listCommodityPage(int pageNum, int itemsPerPage) throws SQLException;
    public int countCommodityPages(int itemsPerPage) throws SQLException;
}
