package com.TimeTrek.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TimeTrek.models.User;
import com.TimeTrek.services.GoalService;

import jakarta.servlet.http.HttpSession;

@Controller
public class GoalController {
	@Autowired
	private GoalService goalservice;
	

	@GetMapping("/home")
	public String home(HttpSession session, Model model) {

//		User user = (User) session.getAttribute("loggedInUser");
//		if (user == null) {
//			session.invalidate(); // Clear the session if the user doesn't exist
//			return "redirect:/";
//		}
//
//		model.addAttribute("user", user);

		return "home";
	}
	
	@PostMapping("/suggest")
	public String newSuggest(HttpSession session, Model model ) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/";
		}
		
		return "redirect:/result";
		
	}
	

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

//		User user = (User) session.getAttribute("loggedInUser");
//		if (user == null) {
//			session.invalidate(); // Clear the session if the user doesn't exist
//			return "redirect:/";
//		}
//		model.addAttribute("user", user);
//		model.addAttribute);
		return "dashboard";
	}
	
	
}
