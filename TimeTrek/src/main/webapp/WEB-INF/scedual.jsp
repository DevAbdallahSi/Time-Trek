<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-4">
		<h2 class="mb-4">📅 My Schedule</h2>
		<div id="calendar"></div>

		<!-- Add Event Form -->
		<div class="mt-4">
			<h4>Add New Event</h4>
			<form id="eventForm">
				<div class="mb-3">
					<label for="evTitle" class="form-label">Title</label> <input
						type="text" class="form-control" id="evTitle" required>
				</div>
				<div class="mb-3">
					<label for="evStart" class="form-label">Start</label> <input
						type="datetime-local" class="form-control" id="evStart" required>
				</div>
				<div class="mb-3">
					<label for="evEnd" class="form-label">End</label> <input
						type="datetime-local" class="form-control" id="evEnd" required>
				</div>
				<button type="submit" class="btn btn-primary">Add Event</button>
			</form>
		</div>
</body>
</html>