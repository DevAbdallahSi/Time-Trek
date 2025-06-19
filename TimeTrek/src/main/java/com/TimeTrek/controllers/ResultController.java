package com.TimeTrek.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.TimeTrek.models.User;

import jakarta.servlet.http.HttpSession;

@Controller

public class ResultController {

	
	@GetMapping("/result")
	public String dashboard(HttpSession session, Model model) {

		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "result";
		}

		model.addAttribute("user", user);

		return "result";
	}
	
}
