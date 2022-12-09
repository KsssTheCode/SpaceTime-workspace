package com.kh.spacetime.space.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;

@Repository
public class ReviewDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	public ArrayList<Review> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reviewMapper.selectList", memNo, rowBounds);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.selectOne("reviewMapper.selectReview", reviewNo);
	}
	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}
	
	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.updateReview", r);
	}

	// 정현--------------------
	// 호스트 소유 공간 리스트 가져오기-정현
	public ArrayList<Space> selectMySpaceList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectMySpaceList", memNo);
	}

	// 호스트 이용후기 리스트 개수 가져오기-정현
	public int selectHostReviewListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("reviewMapper.selectHostReviewListCount", memNo);
	}

	// 호스트 이용후기 리스트 가져오기-정현
	public ArrayList<Review> selectHostReviewList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reviewMapper.selectHostReviewList", memNo, rowBounds);
	}

	// 호스트 이용후기 답글 달기
	public int updateReviewAnswer(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("reviewMapper.updateReviewAnswer", r);
	}

	// 호스트 검색 이용후기 리스트 총 개수 - 정현
	public int searchHostReviewListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("reviewMapper.searchHostReviewListCount", map);
	}

	// 호스트 검색 이용후기 리스트 - 정현
	public ArrayList<Review> searchHostReviewList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reviewMapper.searchHostReviewList", map, rowBounds);
	}

	// ---------------------정현

}
