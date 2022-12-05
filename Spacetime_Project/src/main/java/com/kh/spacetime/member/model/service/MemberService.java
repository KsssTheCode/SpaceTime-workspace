package com.kh.spacetime.member.model.service;

import com.kh.spacetime.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	// 회원정보 수정 서비스 (update)
	int updateMember(Member m);
	
	// 회원탈퇴 서비스 (update)
	int deleteMember(int memNo);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId);
	
	// 닉네임 중복체크 서비스 (select)
	int nickCheck(String nickName);
}
