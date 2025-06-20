package com.TimeTrek.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.User;
import com.TimeTrek.services.GoalService;
import com.TimeTrek.services.ResultService;
import com.TimeTrek.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class GoalController {
	@Autowired
	private GoalService goalservice;
	@Autowired
	private ResultService resultService;
	@Autowired
	private UserService userService;

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
		model.addAttribute("goal", new Goal());
		model.addAttribute("ownedGoals",goalservice.findGoalByOwnerID(user.getId()));
		model.addAttribute("activeGoals",goalservice.findGoalByOwnerID(user.getId()).size());
		return "dashboard";
	}
	
	
	

	@PostMapping("/newGoal")
	public String createGoal(@Valid @ModelAttribute("goal") Goal goal, HttpSession session, BindingResult result,
			Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/join";
		}
		if (result.hasErrors()) {
			model.addAttribute("user", user); // in case the dashboard needs it
			model.addAttribute("goal", goal); // send back goal with errors
			model.addAttribute("showGoalModal", true);
			return "dashboard";
		}

		goal.setOwner(user);
		goalservice.createGoal(goal);
		session.setAttribute("loggedInUser", userService.findUserById(user.getId()));
		return "redirect:/dashboard";
	}

	
	
	@DeleteMapping("/deleteGoal/{goalId}")
	public String deleteProject(@PathVariable("goalId") Long goalId, HttpSession session) {
	    User user = (User) session.getAttribute("loggedInUser");
	    if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
	        return "redirect:/";
	    }

	    goalservice.deleteGoal(goalId);
	    return "redirect:/dashboard";
	}


}
