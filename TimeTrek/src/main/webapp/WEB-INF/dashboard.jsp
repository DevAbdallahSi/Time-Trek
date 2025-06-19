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
					<li class="nav-item"><a class="nav-link" href="/">🏠 Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/result">🎯
							Results</a></li>

					<c:choose>
						<c:when test="${not empty user}">
							<li class="nav-item"><a class="nav-link disabled"
								tabindex="-1" aria-disabled="true">👤
									${user.firstName}</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">🔓
									Log Out</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Dashboard Container -->
	<div class="dashboard-container">
		<div class="container">

			<!-- Welcome Section -->
			<div class="welcome-section">
				<h1 class="welcome-title">👋 Welcome Back,
					${user.firstName}!</h1>
				<p class="welcome-subtitle">Ready to make the most of your time
					today?</p>
			</div>

			<!-- Stats Row -->
			<div class="row stats-row">
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🎯</div>
						<div class="stat-number">${user.activeGoals}</div>
						<div class="stat-label">Active Goals</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">✅</div>
						<div class="stat-number">${user.completedToday}</div>
						<div class="stat-label">Completed Today</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">⏱️</div>
						<div class="stat-number">${user.minutesTracked}</div>
						<div class="stat-label">Minutes Tracked</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🔥</div>
						<div class="stat-number">${user.dayStreak}</div>
						<div class="stat-label">Day Streak</div>
					</div>
				</div>
			</div>

			<!-- Day Summary Section -->
			<div class="day-summary">
				<h3 class="section-title">📅 Today's Summary</h3>
				<c:forEach var="item" items="${daySummaries}">
					<div class="activity-item">
						<div class="activity-title">${item.title}</div>
						<div class="activity-details">
							<span class="activity-time">${item.startTime} -
								${item.endTime}</span> | Duration: ${item.duration} | Status:
							${item.status}
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Goals Section -->
			<div class="goals-section">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h3 class="section-title mb-0">🎯 Personal Goals</h3>
					<button class="btn btn-action btn-success"
						onclick="showAddGoalModal()">➕ Add New Goal</button>
				</div>

				<div id="goalsList">
					<c:forEach var="goal" items="${goals}">
						<div class="goal-item" data-goal-id="${goal.id}">
							<div class="goal-header">
								<div class="goal-title">${goal.icon}${goal.title}</div>
								<div class="goal-actions">
									<button class="btn btn-glass btn-sm"
										onclick="editGoal(${goal.id})">✏️ Edit</button>
									<button class="btn btn-glass btn-sm"
										onclick="deleteGoal(${goal.id})">🗑️ Delete</button>
								</div>
							</div>
							<div class="goal-description">${goal.description}</div>
							<div class="progress-bar-container">
								<div class="progress-bar" style="width: ${goal.progress}%"></div>
							</div>
							<div class="progress-text">${goal.progress}%Complete
								(${goal.completed}/${goal.target})</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

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

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/dashboard.js"></script>
</body>
</html>
