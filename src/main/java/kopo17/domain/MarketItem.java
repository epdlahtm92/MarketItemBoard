package kopo17.domain;

public class MarketItem {
	
	private int id; // 전역변수 선언
	private String name; // 전역변수 선언
	private int count;
	private String record_date; // 전역변수 선언
	private String stock_date; // 전역변수 선언
	private String info; // 전역변수 선언
	private String pic_addr; // 전역변수 선언
	private int produuct_code;
	
	//게터 세터 설정
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public String getStock_date() {
		return stock_date;
	}
	public void setStock_date(String stock_date) {
		this.stock_date = stock_date;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getPic_addr() {
		return pic_addr;
	}
	public void setPic_addr(String pic_addr) {
		this.pic_addr = pic_addr;
	}
	public int getProduuct_code() {
		return produuct_code;
	}
	public void setProduuct_code(int produuct_code) {
		this.produuct_code = produuct_code;
	}
	

	
	

}
