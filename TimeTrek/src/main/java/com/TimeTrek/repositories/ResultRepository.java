package com.TimeTrek.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.TimeTrek.models.Result;

@Repository

public interface ResultRepository extends CrudRepository<Result, Long> {
//	  @Query("SELECT COUNT(r) FROM Result r WHERE r.owner.id = :userId AND r.status = true AND DATE(r.createdAt) = CURRENT_DATE")
//	    Long countCompletedToday(@Param("userId") Long userId);
//	  @Query("SELECT r FROM Result r WHERE r.owner.id = :userId AND FUNCTION('DATE', r.startTime) = CURRENT_DATE")
//	  List<Result> findTodayResults(@Param("userId") Long userId);


}
