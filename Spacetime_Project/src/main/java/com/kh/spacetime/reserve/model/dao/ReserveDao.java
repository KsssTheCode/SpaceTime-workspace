package com.kh.spacetime.reserve.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.vo.Reserve;

@Repository
public class ReserveDao {
	
	
	// ============== 하연 
	public int selectMyReserveListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("reserveMapper.selectMyReserveListCount");			
	}
	
	public ArrayList<Reserve> selectMyReservetList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
			
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1) * limit;
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			
			return (ArrayList)sqlSession.selectList("reserveMapper.selectMyReservetList", memNo, rowBounds);
	}
	
	public int selectMyReserveListSortCount(SqlSessionTemplate sqlSession, Member m) {

		if(m.getMemId().equals("예약대기")) {
			m.setMemId("W");
		} else if(m.getMemId().equals("예약취소")) {
			m.setMemId("C");
		} else{
			m.setMemId("N");
		}
		
		// System.out.println(m);
		
		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortCount", m);			
	}
	
	public int selectMyReserveListSortConfirmCount(SqlSessionTemplate sqlSession, Member m) {

		if(m.getMemId().equals("예약확정")) {
			m.setMemId("Y");
		} 
		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortConfirmCount", m);			
	}
	
	public int selectMyReserveListSortUsedCount(SqlSessionTemplate sqlSession, Member m) {
		if(m.getMemId().equals("이용완료")) {
			m.setMemId("Y");
		} 
		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortUsedCount", m);	
	}
	
	public ArrayList<Reserve> selectMyReserveSortList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("reserveMapper.selectMyReserveSortList", m, rowBounds);
	}
	
	
}
