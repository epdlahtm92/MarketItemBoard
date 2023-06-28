package kopo17.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kopo17.domain.MarketItem;

public class MarketItemDaoImpl implements MarketItemDao {
	
	private String sqlUrl = "jdbc:mysql://localhost:33060/kopo17"; // 디비 주소
	private String sqlUser = "root"; // 디비 아이디
	private String sqlPassWd = "kopo1717"; // 디비 비번
	
	Date now  = new Date(); // 현재 날짜 구하기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포매팅
	private String todayDate = sdf.format(now); // 현재 날짜 포매팅

	@Override
	public String[] insertNewOne(long id, String name, int count, String info, String pic_addr) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트
			
			ResultSet rset = stmt.executeQuery("select id from market_item;");
			while(rset.next()) {
				if (id == rset.getLong(1)) {
					String[] idDupl = {"상품 코드 중복", "-1"};
					rset.close();
					return idDupl;
				} 
			}
			
			stmt.execute("insert into market_item (id, name, count, record_date, stock_date, info, pic_addr) values(" + id + ",'" + name + "', " + count + ", date(now()), date(now()), '" + info + "', '" + pic_addr + "');"); // 일렬번호 및 인자 넣어서 새 글 작성 쿼리 실행
			
			stmt.close(); // 스테이트먼트 종료
			conn.close(); // 커넥션 종료
			
			String[] res = {"상품 추가 완료", Long.toString(id)};
			return res; //과정 완료 후 리턴 할 문구
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			
			String[] resError = {"상품 추가 실패", "-1"};
			return resError; // 과정 실패 후 출력할 문구
		}
	}

	@Override
	public List<MarketItem> selectAll() {
		// TODO Auto-generated method stub
		
		List<MarketItem> marketItemList = new ArrayList<MarketItem>(); // 전체 조회할 리스트 선언
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트
			
			ResultSet rset = stmt.executeQuery("select * from market_item order by rec_order desc;"); // 전체 조회하는 쿼리문 실행
			while (rset.next()) { // 리절트셋 
				MarketItem marketItem = new MarketItem(); // 도메인 클래스 객체 선언
				marketItem.setId(rset.getLong(1)); // 일렬번호 구해서 세터로 넣기
				marketItem.setName(rset.getString(2)); // 타이틀 구해서 세터로 넣기
				marketItem.setCount(rset.getInt(3)); // 개수 구해서 세터로 넣기
				marketItem.setRecord_date(rset.getString(4)); // 날짜 구해서 세터로 넣기
				marketItem.setStock_date(rset.getString(5)); // 날짜 구해서 세터로 넣기
				marketItem.setInfo(rset.getString(6)); // 정보 구해서 넣기
				marketItem.setPic_addr(rset.getString(7)); // 사진 주소 넣기
				
				marketItemList.add(marketItem); // 넣은 클래스 리스트에 넣기
			}
				
			stmt.close(); // 스테이트먼트 종료
			rset.close(); // 리절트셋 종료
			conn.close(); // 커넥션 종료
			
			return marketItemList; // 전체 조회 리스트 반환
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			return null; // 과정 실패 시 널 값 반환
		}
	}

	@Override
	public MarketItem selectOne(long id) {
		// TODO Auto-generated method stub
		
		MarketItem marketItem = new MarketItem(); // 도메인 클래스 객체 선언

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트
			
			ResultSet rset = stmt.executeQuery("select * from market_item where id = " + id + ";"); // 일렬번호 구하는 쿼리문 실행
			rset.next(); // 리절트셋 
				marketItem.setId(rset.getLong(1)); // 일렬번호 구해서 세터로 넣기
				marketItem.setName(rset.getString(2)); // 타이틀 구해서 세터로 넣기
				marketItem.setCount(rset.getInt(3)); // 개수 구해서 세터로 넣기
				marketItem.setRecord_date(rset.getString(4)); // 날짜 구해서 세터로 넣기
				marketItem.setStock_date(rset.getString(5)); // 날짜 구해서 세터로 넣기
				marketItem.setInfo(rset.getString(6)); // 정보 구해서 넣기
				marketItem.setPic_addr(rset.getString(7)); // 사진 주소 넣기
				
			stmt.close(); // 스테이트먼트 종료
			rset.close(); // 리절트셋 종료
			conn.close(); // 커넥션 종료
			
			return marketItem; //과정 완료 후 리턴 할 문구
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			return null; // 과정 실패 후 출력할 문구
		}
	}

	@Override
	public int totalRecordCount() {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트
			
			
			ResultSet rset = stmt.executeQuery("select count(*) from market_item;"); // 전체 레코드 개수 구하는 쿼리문 실행
			rset.next(); // 리절트셋 
			int totalRecordCount = rset.getInt(1); // 전체 레코드 구하기
			
			stmt.close(); // 스테이트먼트 종료
			rset.close(); // 리절트셋 종료
			conn.close(); // 커넥션 종료
			
			return totalRecordCount; //과정 완료 후 리턴 할 값
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			return -1; // 과정 실패 후 출력할 값
		}
	}

	@Override
	public String updateOne(long id, int count) {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트			
			
			stmt.execute("update market_item set count = " + count + ", stock_date = date(now())  where id = " + id + ";"); // 레코드 수정하는 쿼리문 실행
			
			stmt.close(); // 스테이트먼트 종료
			conn.close(); // 커넥션 종료
			
			return "상품 정보 수정 완료"; //과정 완료 후 리턴 할 문구
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			return "상품 정보 수정 오류"; // 과정 실패 후 출력할 문구
		}
	}

	@Override
	public String deleteOne(long id) {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버
			Connection conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPassWd); // 커넥션
			Statement stmt = conn.createStatement(); //스테이트먼트
			
			
			stmt.execute("delete from market_item where id = " + id + ";"); // 레코드 삭제하는 쿼리문 실행
			
			stmt.close(); // 스테이트먼트 종료
			conn.close(); // 커넥션 종료
			
			return "상품 삭제 완료"; //과정 완료 후 리턴 할 문구
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace(); //예외 출력
			return "상품 삭제 오류"; // 과정 실패 후 출력할 문구
		}
	}

	@Override
	public String getTodayDate() {
		// TODO Auto-generated method stub
		return todayDate;
	}
	
}
