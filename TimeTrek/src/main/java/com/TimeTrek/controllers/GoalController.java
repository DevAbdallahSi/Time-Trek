package com.TimeTrek.controllers;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.Result;
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

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/join";
		}
		model.addAttribute("user", user);
		model.addAttribute("goal", new Goal());
		model.addAttribute("ownedGoals", goalservice.findGoalByOwnerID(user.getId()));
		model.addAttribute("activeGoals", goalservice.findGoalByOwnerID(user.getId()).size());

		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);

		Calendar tomorrow = (Calendar) today.clone();
		tomorrow.add(Calendar.DAY_OF_MONTH, 1);

		List<Result> todaysResults = resultService.getResultsByUserId(user.getId()).stream()
				.sorted((r1, r2) -> r2.getCreatedAt().compareTo(r1.getCreatedAt())).toList();

		model.addAttribute("todaysResults", todaysResults);

		Integer completedToday = 0;
		Integer minutesTracked = 0;
		Integer dayStreak = 0;
		Boolean streakintact = true;
		Integer prevday = 0;
		for (Result res : resultService.getResultsByUserId(user.getId()).stream()
				.sorted((r1, r2) -> r2.getCreatedAt().compareTo(r1.getCreatedAt())).toList()) {
			if (res.isCompleted() && res.getCreatedAt().getDate() == today.getTime().getDate()) {
				completedToday++;
				minutesTracked += res.getMinutes();
			}

			if (res.isCompleted() && streakintact && (prevday != res.getCreatedAt().getDate() || prevday == 0)) {
				dayStreak++;
				prevday = res.getCreatedAt().getDate();
			} else
				streakintact = false;
		}
		model.addAttribute("completedToday", completedToday);
		model.addAttribute("minutesTracked", minutesTracked);
		model.addAttribute("dayStreak", dayStreak);

		return "dashboard";
	}

	@PostMapping("/newGoal")
	public String createGoal(@Valid @ModelAttribute("goal") Goal goal, HttpSession session, BindingResult result,
			Model model) {
		System.out.println("test");

		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			session.invalidate(); // Clear the session if the user doesn't exist
			return "redirect:/join";
		}
		if (result.hasErrors()) {
			session.setAttribute("goal", goal); // send back goal with errors
			session.setAttribute("showGoalModal", true);
			System.out.println("test");
			return "redirect:/dashboard";
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
