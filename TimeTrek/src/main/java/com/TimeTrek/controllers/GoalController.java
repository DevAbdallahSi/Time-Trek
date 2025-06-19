package com.TimeTrek.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.User;
import com.TimeTrek.services.GoalService;
import com.TimeTrek.services.ResultService;

import jakarta.servlet.http.HttpSession;

@Controller
public class GoalController {
	@Autowired
	private GoalService goalservice;
	@Autowired 
	private ResultService resultService;
	

	@GetMapping("/")
	public String home(HttpSession session, Model model) {

		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "home";
		}

		model.addAttribute("user", user);

		return "home";
	}
	
	
	

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/join";
		}
		model.addAttribute("user", user);

		return "dashboard";
	}
	
	@PostMapping("/newGoal")
	public String createGoal(@RequestParam String title,@RequestParam String description,HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/join";
		}
		goalservice.createGoal(new Goal(title,description,user));
		return "redirect:/dashboard";
	}
	
	
	
	
}
