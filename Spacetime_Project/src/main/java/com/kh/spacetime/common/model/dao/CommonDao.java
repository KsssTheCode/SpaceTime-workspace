package com.kh.spacetime.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.reserve.model.vo.Reserve;

@Repository
public class CommonDao {
	
	// 신고 리스트 페이징 
	public int selectReportListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("commonMapper.selectReportListCount", map);
	}
	
	// 신고 리스트 조회 
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commonMapper.selectReportList", map, rowBounds);
	}
	
	// 신고 상세조회 
	public Report selectReport(SqlSessionTemplate sqlSession, int reportNo) {
		
		return sqlSession.selectOne("commonMapper.selectReport", reportNo);
	}
	
	
	// 신고 처리 (승인, 반려)
	public int updateReport(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
	
		return sqlSession.update("commonMapper.updateReport", map);
	}
	
	// 매출이 있는 공간 리스트 페이징  
	public int selectSalesListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("commonMapper.selectSalesListCount");
	}
	
	// 매출이 있는 공간 리스트 조회
	public ArrayList<Reserve> selectSalesList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// System.out.println("dao까지 오나?");
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commonMapper.selectSalesList", null, rowBounds);
	}
	
	// 공간 매출 상세조회 
	
	
	//검색어 자동완성기능
	public ArrayList<String> autoComplete(SqlSessionTemplate sqlSession, String keyword) {
		
		ArrayList<String> keywords = (ArrayList)sqlSession.selectList("commonMapper.autoComplete", keyword); 
		return keywords;
	}
	
	
	
	// ---------------------------------------------------------------------------------------- 마이페이지 신고 리스트 신희섭  
	
	// 마이페이지신고 리스트 조회 신희섭 
	public int selectMypageReportListCount(SqlSessionTemplate sqlSession, int reportMemNo) {
		
		return sqlSession.selectOne("commonMapper.selectMypageReportListCount", reportMemNo);
	}
	
	public ArrayList<Report> selectMypageReportList(SqlSessionTemplate sqlSession, int reportMemNo, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commonMapper.selectMypageReportList", reportMemNo, rowBounds);
	}
}
