package com.TimeTrek.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;
import com.TimeTrek.repositories.ScheduleEventRepository;

@Service
public class ScheduleEventServiceImpl implements ScheduleEventService {

    @Autowired
    private ScheduleEventRepository eventRepo;

    @Override
    public List<ScheduleEvent> findByOwner(User owner) {
        return eventRepo.findByOwner(owner);
    }

    @Override
    public ScheduleEvent save(ScheduleEvent event) {
        return eventRepo.save(event);
    }
}
