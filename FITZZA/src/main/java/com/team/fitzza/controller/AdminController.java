package com.team.fitzza.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.AdminService;
import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;
import com.team.fitzza.vo.PagingVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	@Inject
	MemberService Mservice;

	@GetMapping("/admin/adminHome")
	public ModelAndView adminHome(MemberVO vo) {
		BoardVO bvo = new BoardVO();
		System.out.println("adminHome START");
		
		ModelAndView mav = new ModelAndView();
		//중고 거래 관리 ----------------------------------------------------------
		//중고 리스트
		mav.addObject("adminOldList", service.adminOldList(bvo));
		//전체 개수
		mav.addObject("allOldList", service.saleOldList(bvo));
		//판매중
		mav.addObject("saleOldList", service.saleOldList(bvo));
		//예약중
		mav.addObject("reserveOldList", service.reserveOldList(bvo));
		//거래완료
		mav.addObject("completeOldList", service.completeOldList(bvo));
				
		//신고 관리 ------------------------------------------------------------------
		//신고 리스트
		mav.addObject("reportList", service.reportSelect(bvo));
		//신고 개수
		mav.addObject("reportCount", service.reportCount(bvo));
		//미처리 신고 개수
		mav.addObject("reportNoCount", service.reportNoCount(bvo));
		//처리 신고 개수
		mav.addObject("reportYesCount", service.reportYesCount(bvo));
		
		//회원관리-----------------------------------------------------------------------------------------------------------------------------------
		//전체 회원 수
		mav.addObject("user_num",service.CountUser(vo));	
		//탈퇴한 회원 수
		mav.addObject("user_leave_num",service.CountLeaveUser(vo));	
		
		//탈퇴한 회원 명단
		mav.addObject("leaveList", service.LeaveUser(vo));
		
		mav.setViewName("admin/adminHome");
		return mav;
	}
	@ResponseBody //Ajax
	@RequestMapping(value = "/admin/member/memberLists")
	public List<MemberVO> newsMoreView(PagingVO pvo, @RequestParam(value="startNum", required=false)String startNum) throws Exception {
		System.out.println("멤버리스트!");
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(8);		
		//회원 명단
		return service.AllUser(pvo);
		}
	
	//검색 기능
	@GetMapping("/admin/member/search")
		public ModelAndView search(String searchKey, String searchWord) {
		   ModelAndView mav = new ModelAndView();
		   MemberVO vo = new MemberVO();
		   System.out.println("goHome!");
		   //전체 회원 수
			mav.addObject("user_num",service.CountUser(vo));	
			//탈퇴한 회원 수
			mav.addObject("user_leave_num",service.CountLeaveUser(vo));
			//탈퇴한 회원 명단
			mav.addObject("leaveList", service.LeaveUser(vo));
		   mav.setViewName("/admin/adminHome");
		   return mav;
	}
		
	@ResponseBody //Ajax
	@RequestMapping(value = "/admin/member/searchLists")
	public List<MemberVO> searchMoreView(@RequestParam(value="startNum", required=false)String startNum,
	String searchKey, String searchWord) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 8;
		System.out.println("searchKey -> "+searchKey);
		System.out.println("searchWord -> "+searchWord);
		return service.memberSearch(searchKey, "%"+searchWord+"%", start, end);
	}
	
	//강제 탈퇴
	@PostMapping("/admin/multiDel")
	@ResponseBody
	public String multiDelete(MemberVO vo, HttpSession session) {
		System.out.println("multiDelete START");
		System.out.println("memberDelete!");
		service.forcedBye(vo);
		service.memberDel(vo);
		return "선택한 회원이 강퇴되었습니다";
	}

	//관리자 권한 부여
	@ResponseBody //Ajax
	@RequestMapping(value = "/admin/multiAdmin", method=RequestMethod.POST)
	public ModelAndView multiAdmin(MemberVO vo) {
		System.out.println("memberAdmin!");
		ModelAndView mav = new ModelAndView();
		service.makeAdmin(vo);
		mav.setViewName("redirect:adminHome");
		return mav;
	}
	
	//신고관리-----------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminReport")
	public ModelAndView adminReport(BoardVO vo) {
		System.out.println("adminReport START!!");
		ModelAndView mav = new ModelAndView();
		mav.addObject("reportList", service.reportSelect(vo));
		mav.setViewName("/admin/adminReport");
		System.out.println(vo.getBoard_num());
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/admin/adminReportOff")
	public int adminReportOff(@RequestParam(value="report_num", required=false)int report_num) {
		return service.reportOff(report_num);
	}
	//중고거래 관리--------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminOld")
	public String adminOld() {
		return "/admin/adminOld";
	}
	//게시판 관리----------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminBoard")
	public String adminBoard() {
		return "/admin/adminBoard";
	}
	//회원 추가
	@RequestMapping("/admin/adminMemberInsert")
	public String adminMemberInsert() {
		
		return "/admin/adminMemberInsert";
	}
	// 회원등록
		@PostMapping("/admin/MemberInsertOk")
		public String memberFormOk(MemberVO vo, Model model) {
			// 회원등록
			int cnt = Mservice.memberInsert(vo);
			
			// 클라이언트 페이지로 insert 결과를 보낸다.
			model.addAttribute("cnt",cnt);
			return "/admin/MemberInsertOk";
		}
	
}
