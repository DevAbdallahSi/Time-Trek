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
	public String newSuggest(HttpSession session, Model model , @RequestParam Integer minutes,@RequestParam String status, @RequestParam (defaultValue = "neutral") String mood) {
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
        
        
        Result result = resultService.createResult(new Result(mood,status,response,user,minutes));
        

		System.out.println("response"+response);	
		

		
		return "redirect:/result/"+result.getId();
		
	}
	
	@GetMapping("/result/{id}")
	public String result(@PathVariable Long id, Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");

		if (user == null) {
			return "result";
		}

		model.addAttribute("user", user);
		model.addAttribute("result", resultService.getResultById(id));
		return "result";
	}
	
	@GetMapping("/complete/{resultid}")
	public String complete(@PathVariable ("resultid") Long Id) {
		
		resultService.complete(Id);
		return "redirect:/dashboard";

	}

}
