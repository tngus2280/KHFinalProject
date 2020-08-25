package com.privateplaylist.www.admin.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

public interface ReviewService {

	// 리뷰게시판 전체 조회
	public List<Review> selectReviewList(Paging paging);
	// 리뷰게시판 페이징
	public Paging reviewListPaging(HttpServletRequest req);

}