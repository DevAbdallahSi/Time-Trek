package com.TimeTrek.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.User;
import com.TimeTrek.repositories.GoalRepository;

@Service
public class GoalService {
	
	
	@Autowired
	private GoalRepository goalRepository; 
	@Autowired
	private UserService userService;
	
	public Goal createGoal(Goal goal) {
	    return goalRepository.save(goal);
	}
	public List<Goal> allGoal() {
	    return goalRepository.findAll();
	}
	public void deleteGoal(Long id) {
		goalRepository.deleteById(id);
	}
	public List<Goal> findGoalByOwnerID(Long id) {
	    return goalRepository.findGoalsByOwnerId(id);
	}


}
