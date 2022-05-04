package com.campus.myapp.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/adminMain")
	public String adminMain() {
		return "/admin/adminMain";
	}
	
	@GetMapping("/adminSignIn")
	public String adminSignIn() {
		return "/admin/adminSignIn";
	}
	@GetMapping("/adminMembers")
	public String adminMembers() {
		return "/admin/adminMembers";
	}
}
