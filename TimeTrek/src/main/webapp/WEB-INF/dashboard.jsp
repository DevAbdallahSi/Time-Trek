<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Time Path</title>
<!-- Meta tags for mobile optimization -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- External CSS -->
<link rel="stylesheet" href="/css/dashboard.css">
</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">🕒 Time Path</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="#about">Dashboard</a></li>
					    <li class="nav-item"><a class="nav-link" href="/schedule">Schedule</a></li> <!-- ✅ New -->
					<li class="nav-item"><a class="nav-link" href="#about">John
							Doe</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">Log
							Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Dashboard Container -->
	<div class="dashboard-container">
		<div class="container">

			<!-- Welcome Section -->
			<div class="welcome-section">
				<h1 class="welcome-title">👋 Welcome Back, John!</h1>
				<p class="welcome-subtitle">Ready to make the most of your time
					today?</p>
			</div>

			<!-- Stats Row -->
			<div class="row stats-row">
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🎯</div>
						<div class="stat-number">7</div>
						<div class="stat-label">Active Goals</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">✅</div>
						<div class="stat-number">24</div>
						<div class="stat-label">Completed Today</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">⏱️</div>
						<div class="stat-number">156</div>
						<div class="stat-label">Minutes Tracked</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🔥</div>
						<div class="stat-number">12</div>
						<div class="stat-label">Day Streak</div>
					</div>
				</div>
			</div>

			<!-- Day Summary Section -->
			<div class="day-summary">
				<h3 class="section-title">📅 Today's Summary</h3>

				<div class="activity-item">
					<div class="activity-title">🧘 Morning Meditation</div>
					<div class="activity-details">
						<span class="activity-time">08:30 AM - 08:45 AM</span> | Duration:
						15 minutes | Status: ✅ Completed
					</div>
				</div>

				<div class="activity-item">
					<div class="activity-title">📚 Reading Session</div>
					<div class="activity-details">
						<span class="activity-time">10:15 AM - 11:00 AM</span> | Duration:
						45 minutes | Status: ✅ Completed
					</div>
				</div>

				<div class="activity-item">
					<div class="activity-title">💪 Quick Workout</div>
					<div class="activity-details">
						<span class="activity-time">02:30 PM - 03:00 PM</span> | Duration:
						30 minutes | Status: ✅ Completed
					</div>
				</div>

				<div class="activity-item">
					<div class="activity-title">🎨 Creative Writing</div>
					<div class="activity-details">
						<span class="activity-time">07:00 PM - 08:00 PM</span> | Duration:
						60 minutes | Status: 🔄 In Progress
					</div>
				</div>
			</div>

			<!-- Goals Section -->
			<div class="goals-section">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h3 class="section-title mb-0">🎯 Personal Goals</h3>
					<button class="btn btn-action btn-success"
						onclick="showAddGoalModal()">➕ Add New Goal</button>
				</div>

				<div id="goalsList">
					<!-- Goal 1 -->
					<div class="goal-item" data-goal-id="1">
						<div class="goal-header">
							<div class="goal-title">📖 Read 30 Minutes Daily</div>
							<div class="goal-actions">
								<button class="btn btn-glass btn-sm" onclick="editGoal(1)">✏️
									Edit</button>
								<button class="btn btn-glass btn-sm" onclick="deleteGoal(1)">🗑️
									Delete</button>
							</div>
						</div>
						<div class="goal-description">Build a consistent reading
							habit by dedicating 30 minutes each day to reading books that
							inspire and educate.</div>
						<div class="progress-bar-container">
							<div class="progress-bar" style="width: 75%"></div>
						</div>
						<div class="progress-text">75% Complete (23/30 days)</div>
					</div>

					<!-- Goal 2 -->
					<div class="goal-item" data-goal-id="2">
						<div class="goal-header">
							<div class="goal-title">🏃‍♂️ Exercise 5 Times Per Week</div>
							<div class="goal-actions">
								<button class="btn btn-glass btn-sm" onclick="editGoal(2)">✏️
									Edit</button>
								<button class="btn btn-glass btn-sm" onclick="deleteGoal(2)">🗑️
									Delete</button>
							</div>
						</div>
						<div class="goal-description">Stay physically active with
							regular exercise sessions to improve health and energy levels.</div>
						<div class="progress-bar-container">
							<div class="progress-bar" style="width: 60%"></div>
						</div>
						<div class="progress-text">60% Complete (3/5 sessions this
							week)</div>
					</div>

					<!-- Goal 3 -->
					<div class="goal-item" data-goal-id="3">
						<div class="goal-header">
							<div class="goal-title">🧘 Daily Meditation Practice</div>
							<div class="goal-actions">
								<button class="btn btn-glass btn-sm" onclick="editGoal(3)">✏️
									Edit</button>
								<button class="btn btn-glass btn-sm" onclick="deleteGoal(3)">🗑️
									Delete</button>
							</div>
						</div>
						<div class="goal-description">Cultivate mindfulness and
							reduce stress through daily meditation sessions.</div>
						<div class="progress-bar-container">
							<div class="progress-bar" style="width: 90%"></div>
						</div>
						<div class="progress-text">90% Complete (27/30 days)</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Add/Edit Goal Modal -->
	<!-- Goals Container -->
	<div id="goalsContainer" class="container mt-4"></div>

	<!-- Goal Modal -->
	<div class="modal fade" id="goalModal" tabindex="-1"
		aria-labelledby="goalModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="goalModalTitle"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="goalForm">
						<div class="mb-3">
							<label for="goalIcon" class="form-label">Icon</label> <input
								type="text" class="form-control" id="goalIcon"
								placeholder="e.g., 📖">
						</div>
						<div class="mb-3">
							<label for="goalTitle" class="form-label">Title</label> <input
								type="text" class="form-control" id="goalTitle"
								placeholder="Enter goal title">
						</div>
						<div class="mb-3">
							<label for="goalDescription" class="form-label">Description</label>
							<textarea class="form-control" id="goalDescription"
								placeholder="Enter goal description"></textarea>
						</div>
						<div class="mb-3">
							<label for="goalTarget" class="form-label">Target</label> <input
								type="number" class="form-control" id="goalTarget"
								placeholder="Enter target value">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="saveGoal()">Save
						Goal</button>
				</div>
			</div>
		</div>
	</div>

	


	<!-- Footer -->
	<footer class="text-center">
		<div class="container">
			<p class="mb-1">© 2025 Time Path. All rights reserved.</p>
			<a href="#" class="text-light">GitHub</a> | <a href="#"
				class="text-light">Privacy Policy</a> | <a href="#"
				class="text-light">Terms of Service</a>
		</div>
	</footer>

	<!-- Bootstrap Bundle JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/dashboard.js"></script>


</body>
</html>
