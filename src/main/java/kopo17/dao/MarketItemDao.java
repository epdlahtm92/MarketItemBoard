package kopo17.dao;

import java.util.List;

import kopo17.domain.*;

public interface MarketItemDao {

	// create
		public String[] insertNewOne(long id, String name, int count, String info, String pic_addr); //레코드 추가 메소드
		
	// read
		public List<MarketItem> selectAll();		//전체 조회 메소드
		public MarketItem selectOne(long id); // 하나 조회 메소드
		public int totalRecordCount(); //전체 개수세기 메소드
		public String getTodayDate(); // 현재 날짜 메소드
		
	// update
		public String updateOne(long id, int count); // 업데이트 메소드
	
	// delete
		public String deleteOne(long id); // 지우기 메소드
}	
