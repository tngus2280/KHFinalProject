package com.privateplaylist.www.user.lesson.findStudent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.privateplaylist.www.dto.FindStudent;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.findStu.service.FindStuService;
import com.privateplaylist.www.user.lesson.findStudent.service.UserFindStuService;

import common.util.Paging;

//이인주 : user > find_student > Controller

@Controller
@RequestMapping("/lesson/findStu")
public class UserFindStuController {
	
	@Autowired
	UserFindStuService userFindStuService;
	
	@Autowired
	FindStuService findStuService;
	
	//학생 찾기 
	@RequestMapping("/list")
	public String  userFindStuList(Model model,HttpServletRequest req,HttpSession session) {
		System.out.println("/lesson/findStu/list");
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = userFindStuService.userFindStuListPaging(req);
		
		//학생 찾기 selectList()
		List<Map<String, Object>> userFindStuList = userFindStuService.userFindStuList(paging);
		
//		System.out.println(userFindStuList);
		
		//리스트 jsp 전달
		model.addAttribute("userFindStuList", userFindStuList);
		
		//페이징 결과 전달
		model.addAttribute("paging", paging);
		
		//세션 전달
		model.addAttribute("loginUser", loginUser);
		
		return "user/lesson/findStu/list";
	}
	
	//삭제
	//int res = findStuService.deleteFindStu(findStuNo);
	@ResponseBody
	@RequestMapping("/delete")
	public String  userFindStuListDelete(@RequestParam int findStuNo,Model model,HttpServletRequest req,HttpSession session) {
		
		//결과
		String result = null;
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		
		//전달할 findStudent
		FindStudent findStudent = new FindStudent();
		
		findStudent.setUserNo(userNo);
		findStudent.setFindStuNo(findStuNo);
		
		//delete findstu
		int res = findStuService.deleteFindStu(findStuNo);
		
		if(res > 0) {
			result = "";
		}else {
			result = "삭제 실패";
		}
		
		//결과
		return result;
	}
	
	//상세페이지 detail
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String  userFindStuDetail(@RequestParam int findStuNo,Model model,HttpServletRequest req,HttpSession session) {
		System.out.println("findStuNo"+findStuNo);
		
		//root context
		String root = req.getContextPath();
		
		//로그인 세션
		Member loginUser = (Member) session.getAttribute("loginUser");
		
//		if(loginUser == null){
//			model.addAttribute("alertMsg", "로그인이 필요합니다");
//			model.addAttribute("url", root);
//
//			return "/admin/notice/error";
//		}
		
		//디테일 가지고 오기 
		Map<String, Object> findStudentOne = new HashMap<String, Object>();
		findStudentOne = userFindStuService.detailFindStu(findStuNo);
		
		//값 전달
		model.addAttribute("findStudentOne", findStudentOne);
		
		//세션 전달(작성자만 삭제 수정 가능 / 다른 사람은 목록만 보임 (메세지보내기도 가능))
		model.addAttribute("loginUser", loginUser);
		
		return "user/lesson/findStu/detail";
	}
	
	
	
}
