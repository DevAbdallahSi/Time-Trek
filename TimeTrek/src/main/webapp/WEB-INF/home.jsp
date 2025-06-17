<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Path</title>
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
<link rel="stylesheet" href="/css/home.css">

</head>

<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">🕒 Time Path</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<!-- <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li> -->
					<li class="nav-item"><a class="nav-link" href="#about">user
							name</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">log
							out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<div class="hero container">
		<h1 class="display-4 mb-4">✨ Make the Most of Your Free Time</h1>
		<p class="lead mb-5">Tell us how many minutes you have, and how
			you're feeling. We'll suggest something meaningful!</p>

		<div class="form-container">
			<form action="/suggest" method="POST" class="mx-auto"
				style="max-width: 500px;">
				<div class="mb-4">
					<label for="minutes" class="form-label">⏱️ Free Time (in
						minutes)</label> <input type="number" name="minutes" id="minutes"
						class="form-control" placeholder="e.g., 10" required> <label
						for="minutes" class="form-label"></label> <input type="text"
						class="form-control" placeholder="what is on your mind" required>

				</div>

				<div class="mb-4">
					<label class="form-label">🧠 How are you feeling?</label>
					<div class="mood-selector">
						<input type="hidden" name="mood" id="mood" value="">
						<div class="row g-3">
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="energetic">
									<div class="mood-emoji">⚡</div>
									<div class="mood-label">Energetic</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="tired">
									<div class="mood-emoji">😴</div>
									<div class="mood-label">Tired</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="curious">
									<div class="mood-emoji">🤔</div>
									<div class="mood-label">Curious</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="stressed">
									<div class="mood-emoji">😰</div>
									<div class="mood-label">Stressed</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="bored">
									<div class="mood-emoji">😑</div>
									<div class="mood-label">Bored</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="creative">
									<div class="mood-emoji">🎨</div>
									<div class="mood-label">Creative</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="focused">
									<div class="mood-emoji">🎯</div>
									<div class="mood-label">Focused</div>
								</div>
							</div>
							<div class="col-6 col-md-3">
								<div class="mood-card" data-mood="relaxed">
									<div class="mood-emoji">😌</div>
									<div class="mood-label">Relaxed</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<button type="submit" class="btn btn-submit w-100">🚀 Get
					My Perfect Suggestion</button>
			</form>
		</div>
	</div>

	<!-- More Suggestions Section -->
	<div class="suggestions-section container">
		<h2 class="text-center suggestions-title">💡 Popular Quick
			Activities</h2>
		<div class="row g-4">
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">🏃‍♂️ Quick Exercise</h5>
						<p class="card-text">5–10 minute stretching or bodyweight
							workout to refresh your energy and boost your mood.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">🧘‍♀️ Mindfulness</h5>
						<p class="card-text">Try deep breathing or a short guided
							meditation to clear your mind and find inner peace.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">📚 Learn Something</h5>
						<p class="card-text">Watch a 2-minute explainer video or read
							fascinating facts about science, tech, or the world.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">📝 quick note</h5>
						<p class="card-text">Grab a pen and paper and draw, doodle, or
							write down three things you're grateful for today.</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="text-center">
		<div class="container">
			<p class="mb-1">&copy; 2025 Time Path. All rights reserved.</p>
			<a href="#" class="text-light text-decoration-none">GitHub</a>
		</div>
	</footer>

	<!-- Bootstrap Bundle JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script src="/js/home.js"></script>



</body>

</html>