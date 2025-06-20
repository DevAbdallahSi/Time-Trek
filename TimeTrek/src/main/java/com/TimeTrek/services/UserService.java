package com.TimeTrek.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.LoginUser;
import com.TimeTrek.models.User;
import com.TimeTrek.repositories.UserRepository;

@Service
public class UserService {


	@Autowired
	private UserRepository userRepo;

	public User register(User newUser, BindingResult result) {
		Optional<User> existingUser = userRepo.findByEmail(newUser.getEmail());

		if (existingUser.isPresent()) {
			result.rejectValue("email", "Unique", "This email is already registered!");
		}

		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "Passwords must match!");
		}

		if (result.hasErrors()) {
			return null;
		}

		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}

	public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());

		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "NotFound", "email or password not correct");
			return null;
		}

		User user = potentialUser.get();

		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Invalid", "email or password not correct");
		}

		if (result.hasErrors()) {
			return null;
		}

		return user;
	}
	
	public void updateInfo() {
		
	}

	public User findUserById(Long id) {
		return userRepo.findById(id).orElse(null);
	}

	 public Optional<User> findByEmail(String email) {
	        return userRepo.findByEmail(email);
	    }
	 
	 
	 public void deleteGoal(Goal goal,User user) {
		 user.getOwnedGoals().remove(goal);
		 userRepo.save(user);
	 }
}