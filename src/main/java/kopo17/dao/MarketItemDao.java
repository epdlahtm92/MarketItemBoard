package kopo17.dao;

import java.util.List;

import kopo17.domain.*;

public interface MarketItemDao {

	// create
		public String[] insertNewOne(String name, int count, String info, String pic_addr, int product_code);
		
	// read
		public List<MarketItem> selectAll();		
		public MarketItem selectOne(int id);
		public int totalRecordCount();
		public String getTodayDate();
		
	// update
		public String updateOne(int id, String name, int count, String info, String pic_addr, int product_code);
	
	// delete
		public String deleteOne(int id);
}	
