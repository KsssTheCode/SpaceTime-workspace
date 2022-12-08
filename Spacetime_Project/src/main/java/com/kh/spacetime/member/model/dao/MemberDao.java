package com.kh.spacetime.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;

@Repository
public class MemberDao {
	
	/**
	 * 로그인 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return Member
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	/**
	 * 회원가입 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	/**
	 * 아이디 중복체크 Dao - 경미
	 * @param sqlSession
	 * @param checkId
	 * @return
	 */
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	/**
	 * 닉네임 중복체크 Dao - 경미
	 * @param sqlSession
	 * @param checkNick
	 * @return
	 */
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	/**
	 * 회원 탈퇴 Dao - 경미
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.update("memberMapper.deleteMember", memNo);
	}
	
	/**
	 * 회원정보 수정 Dao - 경미
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int updateMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("memberMapper.updateMember", map);
	}
	
	/**
	 * 	회원 수 조회 - 혜민 
	 * @param sqlSession
	 * @return
	 */
	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectMemberListCount");
	}
	
	/**
	 * 회원 리스트 조회 - 혜민 
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember", memNo);
	}
	
}
