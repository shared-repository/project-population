package com.webproject.population.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webproject.population.service.AdminService;
import com.webproject.population.vo.MemberVO;

@Controller
@RequestMapping(path = {"/admin" })

public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@GetMapping(path = { "/adminpage" })
	public String loadAllMembers(Model model) {
		
		// 데이터 조회 시작
		List<MemberVO> members = adminService.findAllMembers();
		System.out.println(members.size());
		
		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("members", members);
		
		return "admin/adminpage";
	}
}