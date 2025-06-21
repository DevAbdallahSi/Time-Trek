package com.TimeTrek.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.TimeTrek.models.ScheduleEvent;
import com.TimeTrek.models.User;
import com.TimeTrek.services.ScheduleEventService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/schedule")
public class ScheduleEventController {

	private final ScheduleEventService eventService;

	public ScheduleEventController(ScheduleEventService eventService) {
		this.eventService = eventService;
	}

	@GetMapping("/view")
	public String viewSchedulePage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			return "redirect:/join"; // Or your login page
		}
		model.addAttribute("user", user);
		return "schedule";
	}

	@GetMapping("/events")
	@ResponseBody
	public ResponseEntity<List<EventDTO>> getEvents(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

		List<EventDTO> eventDTOs = eventService.findByOwner(user).stream()
				.map(e -> new EventDTO(e.getId(), e.getTitle(), e.getStart().toString(), e.getEnd().toString()))
				.collect(Collectors.toList());

		return ResponseEntity.ok(eventDTOs);
	}

	@PostMapping("/events")
	@ResponseBody
	public ResponseEntity<?> addEvent(@RequestBody ScheduleEvent data, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in.");
		}

		ScheduleEvent saved = eventService.save(
				new ScheduleEvent(data.getTitle(), data.getStart(), data.getEnd(), data.getDescription(), user)
		);

		EventDTO dto = new EventDTO(saved.getId(), saved.getTitle(), saved.getStart().toString(), saved.getEnd().toString());
		return ResponseEntity.ok(dto);
	}

	// DTO class
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
