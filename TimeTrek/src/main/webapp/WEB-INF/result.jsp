<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Perfect Activity - Time Path</title>
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
<link rel="stylesheet" href="/css/result.css">
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

					<c:choose>
						<c:when test="${not empty user}">
							<li class="nav-item"><a class="nav-link" href="#">👤
									${user.firstName}</a></li>
							<li class="nav-item"><a class="nav-link" href="/dashboard">📊
									Dashboard</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">🔓
									Logout</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="/join">🔐
									Login & 📝 Register</a></li>

						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Results Container -->
	<div class="results-container">
		<div class="container">
			<div class="side-by-side">
				<!-- User Input Summary -->
				<div class="input-summary">
					<h3
						style="color: white; font-weight: 700; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); margin-bottom: 1rem;">
						📋 Your Request</h3>
					<div>
						<span class="summary-badge">⏱️ ${result.minutes} minutes
							available</span> <span class="summary-badge">🧠 Feeling
							${result.mood}</span>
					</div>
					<c:if test="${not empty result.status}">
						<p
							style="color: rgba(255, 255, 255, 0.9); margin-top: 1rem; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);">
							You said: ${result.status}</p>
					</c:if>
					<p
						style="color: rgba(255, 255, 255, 0.9); margin-top: 1rem; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);">
						Based on your time and mood, here's your personalized suggestion:
					</p>
				</div>

				<!-- Timer Widget -->
				<div class="timer-widget">
					<div class="timer-display" id="timer"
						data-minutes="${result.minutes}">${result.minutes}:00</div>

					<div class="timer-label">⏰ Time Remaining</div>

					<button class="btn btn-light mt-3" onclick="startTimer()"
						id="timerBtn">▶️ Start Timer</button>
				</div>

			</div>

			<!-- Main AI Suggestion -->
			<div class="ai-suggestion">

				<h2 class="ai-title">${title}</h2>
				<p class="ai-description">${result.content}</p>
			</div>

			<!-- Action Buttons -->
			<div
				class="action-buttons d-flex justify-content-center gap-3 align-items-center flex-wrap mt-3">
				<c:if test="${not empty user}">
					<!-- ✅ Mark as Completed Button -->
					<a href="/complete/${result.id}"
						class="btn btn-action text-light d-flex align-items-center"> ✅
						Mark as Completed </a>
				</c:if>

				<!-- 🔄 Get New Suggestion Form -->
				<form action="/suggest" method="POST" class="d-inline">
					<input type="hidden" name="minutes" value="${result.minutes}" /> <input
						type="hidden" name="status" value="${result.status}" /> <input
						type="hidden" name="mood" value="${result.mood}" />
					<button type="submit" class="btn btn-action btn-secondary-action">
						🔄 Get New Suggestion</button>
				</form>

				<!-- 🏠 Back to Home Button -->
				<a href="/" class="btn btn-action" style="text-decoration: none;">
					🏠 Back to Home </a>
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

	<!-- JS Variables for Timer -->
	<script>
		window.initialMinutes = $
		{
			minutes
		};
	</script>

	<!-- Custom JS -->
	<script src="/js/result.js"></script>
</body>
</html>
