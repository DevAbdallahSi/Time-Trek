package com.TimeTrek.repositories;

import java.util.List;
import java.util.Locale.Category;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.TimeTrek.models.Goal;

@Repository
public interface GoalRepository extends CrudRepository<Goal, Long> {
	List<Goal>findAll();
    Long countByOwnerId(Long ownerId);

//	 List<Goal> findByCategoriesNotContains(Category category);}
}
