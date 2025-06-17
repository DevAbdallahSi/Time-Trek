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
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">user
							name</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">log
							out</a></li>
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
						<span class="summary-badge">⏱️ ${minutes} minutes available</span>
						<span class="summary-badge">🧠 Feeling ${mood}</span>
					</div>
					<p
						style="color: rgba(255, 255, 255, 0.9); margin-top: 1rem; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);">
						Based on your time and mood, here's your personalized suggestion:
					</p>
				</div>
				<div class="timer-widget">
					<div class="timer-display" id="timer">${minutes}:00</div>
					<div class="timer-label">⏰ Time Remaining</div>
					<button class="btn btn-light mt-3" onclick="startTimer()"
						id="timerBtn">▶️ Start Timer</button>
				</div>
			</div>

			<!-- Main AI Suggestion -->
			<div class="ai-suggestion">
				<div class="ai-icon">🎯</div>
				<h2 class="ai-title">Perfect Match: Quick Meditation</h2>
				<p class="ai-description">
					Since you're feeling <strong>${mood}</strong> and have <strong>${minutes}
						minutes</strong>, I recommend a guided breathing exercise. This will help
					you reset your mental state, reduce stress, and give you a fresh
					perspective. Find a comfortable spot, close your eyes, and focus on
					deep, rhythmic breathing. Try the 4-7-8 technique: inhale for 4
					counts, hold for 7, exhale for 8. This simple practice can
					significantly improve your mood and energy levels.
				</p>
			</div>
			<!-- Action Buttons -->
			<div class="action-buttons">
				<button class="btn btn-action" onclick="completeActivity()">✅
					Mark as Completed</button>
				<button class="btn btn-action btn-secondary-action"
					onclick="getNewSuggestion()">🔄 Get New Suggestion</button>
				<a href="/" class="btn btn-action" style="text-decoration: none;">🏠
					Back to Home</a>
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

	<!-- External JavaScript -->
	<script>
		window.initialMinutes = $
		{
			minutes
		};
	</script>
	<script src="/js/result.js"></script>
</body>
</html>