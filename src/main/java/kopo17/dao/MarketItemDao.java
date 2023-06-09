package kopo17.dao;

import java.util.List;

import kopo17.domain.*;

public interface MarketItemDao {

	// create
		public String[] insertNewOne(int id, String name, int count, String info, String pic_addr);
		
	// read
		public List<MarketItem> selectAll();		
		public MarketItem selectOne(int id);
		public int totalRecordCount();
		public String getTodayDate();
		
	// update
		public String updateOne(int id, int count);
	
	// delete
		public String deleteOne(int id);
}	
