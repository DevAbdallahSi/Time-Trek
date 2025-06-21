<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - TimeTrek</title>
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
<!-- FullCalendar CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/dashboard.css">
</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">🕒 TimeTrek</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">🏠 Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/schedule/view">📅
							My Schedule</a></li>
					<c:choose>
						<c:when test="${not empty user}">
							<li class="nav-item"><a class="nav-link "
								tabindex="-1" >👤 ${user.firstName}</a></li>
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
				<h1 class="welcome-title">👋 Welcome Back, ${user.firstName}!</h1>
				<p class="welcome-subtitle">Ready to make the most of your time
					today?</p>
			</div>

			<!-- Stats Row -->
			<div class="row stats-row">
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🎯</div>
						<div class="stat-number">${activeGoals}</div>
						<div class="stat-label">Active Goals</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">✅</div>
						<div class="stat-number">${completedToday}</div>
						<div class="stat-label">Completed Today</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">⏱️</div>
						<div class="stat-number">${minutesTracked}</div>
						<div class="stat-label">Minutes Tracked</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card">
						<div class="stat-icon">🔥</div>
						<div class="stat-number">${dayStreak}</div>
						<div class="stat-label">Day Streak</div>
					</div>
				</div>
			</div>
			<!-- Day Summary Section -->
			<div class="day-summary">
				<h3 class="section-title">📅 Results Summary</h3>
				<div class="scrol-container">
				<div class="scroll-box">
					<c:forEach var="item" items="${todaysResults}">
						
						<c:set var="startTime" value="${item.createdAt}" />
						<c:set var="durationMillis" value="${item.minutes * 60000}" />
						<c:set var="endTimeMillis"
							value="${startTime.time + durationMillis}" />
						<jsp:useBean id="endDate" class="java.util.Date" />
						<c:set target="${endDate}" property="time"
							value="${endTimeMillis}" />
											
						<div class="activity-item" onclick="window.location.href='/result/${item.id}'">
						
							<div class="activity-details">
								<div class="activbox">
									<span class="activity-time"> <fmt:formatDate
											value="${startTime}" pattern="hh:mm a" /> - <fmt:formatDate
											value="${endDate}" pattern="hh:mm a" />
									</span> <span>Duration: ${item.minutes} minutes</span>
									<c:if test="${not empty item.status}">
										<span>Status: ${item.status}</span>
									</c:if>
								</div>
								<span> Completed: <a class="nounderline"
									href="/complete/${item.id}"> <c:choose>
											<c:when test="${item.completed}">✅</c:when>
											<c:otherwise>❎</c:otherwise>
										</c:choose>
								</a>
								</span>
							</div>
						</div>
						
					</c:forEach>
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
					<c:forEach var="goal" items="${ownedGoals}">
						<div class="goal-item" data-goal-id="${goal.id}">
							<div class="goal-header">
								<div class="goal-title">${goal.title}</div>
								<div class="goal-actions">


									<form action="/deleteGoal/${goal.id}" method="post"
										onsubmit="return confirm('Are you sure you want to delete this goal?');">
										<input type="hidden" name="_method" value="delete" />
										<button type="submit" class="btn btn-glass btn-sm">🗑️
											Delete</button>
									</form>
								</div>
							</div>
							<div class="goal-description">${goal.description}</div>
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
					<h5 class="modal-title" id="goalModalTitle">➕ Add New Goal</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form:form id="goalForm" onsubmit="return addGoal();" modelAttribute="goal" action="/newGoal"
						method="POST">
						<div class="mb-3">
							<label for="goalTitle" class="form-label">Title</label>
							<form:input path="title" cssClass="form-control" id="goalTitle"
								placeholder="Enter goal title" required="required" />
							<form:errors path="title" cssClass="text-danger" />
						</div>

						<div class="mb-3">
							<label for="goalDescription" class="form-label">Description</label>
							<form:textarea path="description" cssClass="form-control"
								id="goalDescription" placeholder="Enter goal description" required="required"/>
							<form:errors path="description" cssClass="text-danger" />
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

							<button type="submit" class="btn btn-submit">➕ Add Goal</button>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>

	<div style="flex-grow: 1;"></div>

	<!-- Footer -->
	<footer class="text-center">
		<div class="container">
			<p class="mb-1">© 2025 TimeTrek. All rights reserved.</p>
			<a href="#" class="text-light">GitHub</a> | <a
				href="https://github.com/DevAbdallahSi/Time-Trek.git"
				class="text-light">Privacy Policy</a> | <a href="#"
				class="text-light">Terms of Service</a>
		</div>
	</footer>
	<c:if test="${showGoalModal}">
		<script>
			var goalModal = new bootstrap.Modal(document
					.getElementById('goalModal'));
			goalModal.show();
		</script>
	</c:if>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/dashboard.js"></script>
	<!-- FullCalendar JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js"></script>
</body>
</html>
