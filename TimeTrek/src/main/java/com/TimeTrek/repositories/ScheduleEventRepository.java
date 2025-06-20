package com.TimeTrek.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;

@Repository
public interface ScheduleEventRepository extends JpaRepository<ScheduleEvent, Long> {
    List<ScheduleEvent> findByOwner(User owner);
}