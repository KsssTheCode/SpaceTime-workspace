package com.kh.spacetime.reserve.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.service.ReserveService;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	/**
	 * @author 정현
	 *  호스트 예약관리
	 */
	@RequestMapping("revList.ho")
	public String selectHostReserveList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage, Model model) {

//		Member loginMember = (Member)session.getAttribute("loginMember");
//		int memNo = loginMember.getMemNo();
		int memNo = 5;
		
		int listCount = reserveService.selectHostReserveListCount(memNo);
		System.out.println(listCount);
		int pageLimit = 10;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> list = reserveService.selectHostReserveList(memNo, pi);
		System.out.println(list);
		

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "reserve/hostReserveList";

	}
	
	@RequestMapping("calList.ho")
	public String selectHostCalculationList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage, Model model) {

		// 연결 전
//		int listCount = reserveService.selectHostReserveListCount();
//
//		int pageLimit = 10;
//		int boardLimit = 5;
//
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
//
//		ArrayList<Reserve> list = reserveService.selectHostReserveList(pi);
//
//		model.addAttribute("pi", pi);
//		model.addAttribute("list", list);

		return "reserve/hostCalculationList";

	}
	
	/**
	 * @author 하연 
	 *  마이페이지 예약 리스트 
	 */
	
	/* 마이페이지 예약리스트 */
	
	@RequestMapping("myReserve.re")
	public String selectMyReserveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		int listCount = reserveService.selectMyReserveListCount();
		
		int pageLimit = 10;
		int boardLimit = 9;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Reserve> list = reserveService.selectMyReservetList(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
//		System.out.println(list);
		
		return "reserve/reserveList";
		
	}
	
	/* 마이페이지 예약리스트 - 드롭박스 정렬 (예약대기 / 예약취소 / 예약확정 / 이용완료 ) */
	
	@RequestMapping("myReserveSort.re")
	public String selectMyReserveListSort(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session, String selectbox) {

		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		// selectbox 랑 memNo 같이 묶어서 보내기 위한 객체 
		Member m = new Member();
		m.setMemNo(memNo);
		m.setMemId(selectbox);  // => 아이디 아닌데 그냥 형 맞아서 넣음 
		
		int listCount = 0; // 초기화 
		
		switch(selectbox) {
		case "예약대기" : selectbox = "W"; listCount = reserveService.selectMyReserveListSortCount(m); break;
		case "예약취소" : selectbox = "C"; listCount = reserveService.selectMyReserveListSortCount(m); break;
		case "예약반려" : selectbox = "N"; listCount = reserveService.selectMyReserveListSortCount(m); break;
		case "예약확정" : selectbox = "Y"; listCount = reserveService.selectMyReserveListSortConfirmCount(m); break; // 기본 카운트 
		case "이용완료" : selectbox = "Y"; listCount = reserveService.selectMyReserveListSortUsedCount(m); break; // 현재날짜 비교해서 이용완료 뽑는 카운트 
		}
		
		m.setMemId(selectbox);  // 밑에 메소드에서 재활용할거 
		
		System.out.println(selectbox);
		
		int pageLimit = 10;
		int boardLimit = 9;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Reserve> list = reserveService.selectMyReserveSortList(pi, m);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		System.out.println(listCount); 
//		System.out.println(list);
		
		return "reserve/reserveFilterList";
	}

}
