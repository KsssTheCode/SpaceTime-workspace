package com.kh.spacetime.space.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.space.model.service.ReviewService;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 마이페이지 리뷰 리스트
	// 페이징바
	@RequestMapping("list.re")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, HttpSession session,
			Model model) {

		System.out.println("cpage : " + currentPage);

		Member m = (Member) session.getAttribute("loginMember");

		int listCount = reviewService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		// getter setter X
		ArrayList<Review> list = reviewService.selectList(pi, m.getMemNo());
		System.out.println();
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "space/mypageReviewList";
	}

	@RequestMapping("detail.re")
	public ModelAndView selectBoard(int rde, ModelAndView mv) {

		Review r = reviewService.selectReview(rde);

		// 조회된 데이터를 담아서space/mypageReviewDetail.jsp 로 포워딩
		mv.addObject("r", r).setViewName("space/mypageReviewDetail");

		return mv;

		// return "space/mypageReviewDetail";
	}


	//리뷰 삭제
	@RequestMapping("delete.re")
	public String deleteReview(int reviewNo, String filePath, HttpSession session, Model model) {
	
	// System.out.println(rno);
	
	int result = reviewService.deleteReview(reviewNo);
	System.out.println("rde : " + reviewNo);
	
	if(result > 0) { // 게시글 삭제 성공
		
		// 게시판 리스트 페이지 url 재요청
		session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");
		
		return "redirect:/list.re";
	}
	else { // 게시글 삭제 실패
		
		model.addAttribute("errorMsg", "리뷰 삭제 실패");
		
		return "common/errorPage";
	}
}

	@RequestMapping("updateForm.re")
	public String updateFormReview(int reviewNo, Model model) {
		Review r = reviewService.selectReview(reviewNo); // 기존의 상세보기 서비스를 재활용
		
		model.addAttribute("r", r);
	
		return "space/mypageReviewUpdate";
	}
	
	@RequestMapping("update.re")
	public String updateReview(Review r, HttpSession session, Model model) {
		System.out.println("123"+r);
		// Service 단으로 r 보내기'
		int rno = r.getReviewNo();
		int result = reviewService.updateReview(r);
	
		if(result > 0) { // 게시글 수정 성공
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 수정되었습니다.");
			
			// 리뷰 상세보기 페이지로 url 재요청
			return "redirect:/detail.re?rde=" + rno;
		}
		else { // 게시글 수정 실패
			
			model.addAttribute("errorMsg", "리뷰 수정 실패");
			
			return "common/errorPage";
		}
	}

	@RequestMapping("bookmark.sp")
	public String bookMark() {

		return "space/mypageBookMark";
	}

	// 정현--------------------
	/**
	 * @author 정현 호스트 이용후기관리 리스트
	 */
	@RequestMapping("hostRvwList.rv")
	public String selectHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			Model model) {

//		Member loginMember = (Member)session.getAttribute("loginMember");
//		int memNo = loginMember.getMemNo();
		int memNo = 5;

		int listCount = reviewService.selectHostReviewListCount(memNo);
		int pageLimit = 10;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Review> rList = reviewService.selectHostReviewList(memNo, pi);
		ArrayList<Space> sList = reviewService.selectMySpaceList(memNo);

		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "space/hostReviewList";
	}

	/**
	 * @author 정현 호스트 이용후기관리 리스트
	 */
	@RequestMapping("schHostRvwList.rv")
	public String searchHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "spaceTitle", defaultValue = "") String spaceTitle,
			@RequestParam(value = "hostAnswer", defaultValue = "") String hostAnswer, Model model) {

//		Member loginMember = (Member)session.getAttribute("loginMember");
//		int memNo = Integer.parseInt(loginMember.getMemNo());
		String memNo = "5";
		
		System.out.println("검색어:"+keyword);
		System.out.println("공간명:"+spaceTitle);
		System.out.println("답급유무:"+hostAnswer);

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memNo", memNo);
		map.put("spaceTitle", spaceTitle);
		map.put("hostAnswer", hostAnswer);
		map.put("keyword", keyword);


		int listCount = reviewService.searchHostReviewListCount(map);
		System.out.println(listCount);
		int pageLimit = 10;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Review> rList = reviewService.searchHostReviewList(map, pi);
		System.out.println(rList);
		
		
		ArrayList<Space> sList = reviewService.selectMySpaceList(Integer.parseInt(memNo));

		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "space/hostReviewList";
//		return "redirect:/hostRvwList.rv";
	}

	// ------------------정현

}
