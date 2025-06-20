package com.TimeTrek.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;
import com.TimeTrek.repositories.ScheduleEventRepository;

@Service
public class ScheduleEventService {
    @Autowired private ScheduleEventRepository repo;
    public List<ScheduleEvent> findByOwner(User user) { return repo.findByOwner(user); }
    public ScheduleEvent save(ScheduleEvent event) { return repo.save(event); }
}
