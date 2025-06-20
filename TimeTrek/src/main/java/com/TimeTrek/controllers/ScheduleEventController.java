package com.TimeTrek.controllers;

import java.security.Principal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;
import com.TimeTrek.services.ScheduleEventService;
import com.TimeTrek.services.UserService;

@Controller
@RequestMapping("/schedule")
public class ScheduleEventController {

    @Autowired
    private ScheduleEventService eventService;

    @Autowired
    private UserService userService;

    @GetMapping("/events")
    @ResponseBody
    public ResponseEntity<List<EventDTO>> getEvents(Principal principal) {
        Optional<User> userOpt = userService.findByEmail(principal.getName());

        if (userOpt.isEmpty()) {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.UNAUTHORIZED);
        }

        User user = userOpt.get();

        List<EventDTO> eventDTOs = eventService.findByOwner(user)
                .stream()
                .map(e -> new EventDTO(
                        e.getId(),
                        e.getTitle(),
                        e.getStart().toString(),
                        e.getEnd().toString()))
                .collect(Collectors.toList());

        return ResponseEntity.ok(eventDTOs);
    }

    @PostMapping("/events")
    @ResponseBody
    public ResponseEntity<?> addEvent(@RequestBody ScheduleEvent data, Principal principal) {
        Optional<User> userOpt = userService.findByEmail(principal.getName());

        if (userOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not found.");
        }

        User user = userOpt.get();

        ScheduleEvent saved = eventService.save(new ScheduleEvent(
                data.getTitle(),
                data.getStart(),
                data.getEnd(),
                data.getDescription(),
                user
        ));

        EventDTO dto = new EventDTO(
                saved.getId(),
                saved.getTitle(),
                saved.getStart().toString(),
                saved.getEnd().toString()
        );

        return ResponseEntity.ok(dto);
    }

    // You can move this to its own file if preferred
    public static class EventDTO {
        public Long id;
        public String title;
        public String start;
        public String end;

        public EventDTO(Long id, String title, String start, String end) {
            this.id = id;
            this.title = title;
            this.start = start;
            this.end = end;
        }
    }
}
