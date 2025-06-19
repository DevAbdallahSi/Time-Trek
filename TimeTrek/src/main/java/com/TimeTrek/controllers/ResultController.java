package com.TimeTrek.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TimeTrek.models.Result;
import com.TimeTrek.models.User;
import com.TimeTrek.services.LLMhandler;
import com.TimeTrek.services.ResultService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResultController {
	@Autowired
	private ResultService resultService;
	
	@PostMapping("/suggest")
	public String newSuggest(HttpSession session, Model model , @RequestParam Integer minutes,@RequestParam String status, @RequestParam String mood) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
//			session.invalidate(); // Clear the session if the user doesn't exist
			
			
			String response=LLMhandler.getResponse(""+minutes,mood,status);
	        Result result = new Result(mood,status,response,null,minutes);
			session.setAttribute("result",result);


			return "redirect:/result";
		}

		String response=LLMhandler.getResponse(user,""+minutes,mood,status);
        System.out.print("mood"+mood);
        System.out.print("status"+status);
        
        
        Result result = new Result(mood,status,response,user,minutes);
        resultService.createResult(result);
        

		System.out.println("response"+response);	
		session.setAttribute("result",result);

		
		return "redirect:/result";
		
	}
	
	@GetMapping("/result")
	public String result( Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");

		if (user == null) {
			return "result";
		}

		// Call AI Model or service to fetch suggestion
//	        String suggestion = resultService.getSuggestion(minutes, mood);

		model.addAttribute("user", user);
//		Result result = resultService.getResultById(id);
//		model.addAttribute("result", result);
		return "result";
	}

}
