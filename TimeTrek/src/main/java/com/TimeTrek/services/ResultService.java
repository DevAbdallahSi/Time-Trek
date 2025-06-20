package com.TimeTrek.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.TimeTrek.models.Result;
import com.TimeTrek.models.User;
import com.TimeTrek.repositories.ResultRepository;

@Service
public class ResultService {

    private final ResultRepository resultRepo;

    public ResultService(ResultRepository resultRepo) {
        this.resultRepo = resultRepo;
    }

    // CREATE
    public Result createResult(Result result) {
        return resultRepo.save(result);
    }

    // READ ALL
    public List<Result> getAllResults() {
        return resultRepo.findAll();
    }

    // READ ONE
    public Result getResultById(Long id) {
        return resultRepo.findById(id).orElse(null);
    }

    // UPDATE
    public Result updateResult(Result result) {
        return resultRepo.save(result); // save handles both create and update
    }

    // DELETE
    public void deleteResult(Long id) {
        resultRepo.deleteById(id);
    }

    // Optional: Get all results by user (owner)
    public List<Result> getResultsByUserId(Long userId) {
        return resultRepo.findByOwnerId(userId);
    }
    
    public void complete(Long Id) {
    	Result existingResult = resultRepo.findById(Id).orElse(null);
		if (existingResult == null)
			return ;

		// Only update allowed fields (e.g. title, description, dueDate)
		existingResult.setCompleted(!existingResult.isCompleted());
		

		// DO NOT change the owner here unless you're allowing ownership transfers
		// DO NOT re-add the user to members if he's already in

		 resultRepo.save(existingResult);
    	
    }
}
