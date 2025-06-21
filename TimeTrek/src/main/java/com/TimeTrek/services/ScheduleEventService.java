package com.TimeTrek.services;

import java.util.List;

import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;

public interface ScheduleEventService {
    List<ScheduleEvent> findByOwner(User owner);
    ScheduleEvent save(ScheduleEvent event);
}
