package pyb;

import java.math.BigDecimal;

public class Commodity {
	private int no;
	private String info;
	private String imgpath;
	private int sort;
	private BigDecimal price;
	private int storage;
	
	public Commodity() {}
	
	public Commodity(int no, String info, String imgpath, int sort, BigDecimal price, int storage) {
		this.no = no;
		this.info = info;
		this.imgpath = imgpath;
		this.sort = sort;
		this.price = price;
		this.storage = storage;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getInfo() {
		return info;
	}
	
	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getImgpath() {
		return imgpath;
	}
	
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	public int getSort() {
		return sort;
	}
	
	public void setSort(int sort) {
		this.sort = sort;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	public int getStorage() {
		return storage;
	}
	
	public void setStorage(int storage) {
		this.storage = storage;
	}
}

