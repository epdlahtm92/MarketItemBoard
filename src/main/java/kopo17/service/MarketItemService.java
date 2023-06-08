package kopo17.service;

import kopo17.dto.Pagination;

public interface MarketItemService {

	Pagination getPagination(int page, int countPerPage); // 페이지 네이션 메소드
}
