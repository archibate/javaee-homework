package pyb;

public class ServiceImpl implements Service {
	public UserDao newUserDao() { return new UserDaoImpl(); }
	public CommodityDao newCommodityDao() { return new CommodityDaoImpl(); }
}
