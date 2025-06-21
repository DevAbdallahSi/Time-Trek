<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>📅 My Schedule</title>

<!-- FullCalendar CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css"
	rel="stylesheet" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="/css/schedule.css">

</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="#">🕒 TimeTrek</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">🏠 Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/dashboard">📊 Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">🔓 Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container-main">
		<h2 >📅 My Schedule for: ${user.firstName}</h2>
		<div id="calendar"></div>
	</div>

	<!-- Modal Overlay & Form -->
	<div id="modalOverlay"></div>

	<div id="eventForm" role="dialog" aria-modal="true">
		<h3>Add New Event</h3>
		<form id="addEventForm">
			<label for="eventTitle">Title</label> <input type="text"
				id="eventTitle" required /> <label for="eventStart">Start</label> <input
				type="datetime-local" id="eventStart" required /> <label
				for="eventEnd">End</label> <input type="datetime-local"
				id="eventEnd" required /> <label for="eventDesc">Description</label>
			<textarea id="eventDesc"></textarea>

			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-primary">Add</button>
				<button type="button" class="btn btn-secondary"
					onclick="closeForm()">Cancel</button>
			</div>
		</form>
	</div>

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

		<script src="/js/schedule.js"></script>
	

</body>
</html>
