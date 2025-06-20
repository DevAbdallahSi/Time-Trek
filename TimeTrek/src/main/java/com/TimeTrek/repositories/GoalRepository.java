package com.TimeTrek.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.TimeTrek.models.Goal;
import com.TimeTrek.models.User;

@Repository
public interface GoalRepository extends CrudRepository<Goal, Long> {
	List<Goal>findAll();
    Long countByOwnerId(Long ownerId);
    Goal findByIdAndOwner(Long id, User owner);
    @Query("SELECT g FROM Goal g WHERE g.owner.id = :ownerId")
    List<Goal> findGoalsByOwnerId(@Param("ownerId") Long ownerId);


//	 List<Goal> findByCategoriesNotContains(Category category);}
}
