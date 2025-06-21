<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeTrek</title>
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
	<!-- Success Message -->
	<c:if test="${not empty success}">
		<div id="success-alert"
			class="alert glass-alert alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3"
			role="alert" style="z-index: 1055; width: fit-content;">
			${success}
			<button type="button" class="btn-close btn-close-white"
				data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>


	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">🕒 TimeTrek</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/dashboard">📊
							Dashboard</a></li>
					<c:choose>
						<c:when test="${not empty user}">
							<li class="nav-item"><a class="nav-link" href="#">👤
									${user.firstName}</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">🔓
									Logout</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="/join">🔐
									Login</a></li>
						</c:otherwise>
					</c:choose>
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
						minutes)</label> <input type="number" name="minutes" id="minutes" min="1"
						class="form-control" placeholder="e.g., 10" required> <label
						for="minutes" class="form-label"></label> <input type="text"
						class="form-control" placeholder="what is on your mind"
						name="status">
				</div>


				<div class="mb-4">
					<label class="form-label">🧠 How are you feeling?</label>
					<div class="mood-selector">
						<div class="row g-3">
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-energetic"> <input
									type="radio" name="mood" id="mood-energetic" value="energetic"
									hidden>
									<div class="mood-emoji">⚡</div>
									<div class="mood-label">Energetic</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-tired"> <input
									type="radio" name="mood" id="mood-tired" value="tired" hidden>
									<div class="mood-emoji">😴</div>
									<div class="mood-label">Tired</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-curious"> <input
									type="radio" name="mood" id="mood-curious" value="curious"
									hidden>
									<div class="mood-emoji">🤔</div>
									<div class="mood-label">Curious</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-stressed"> <input
									type="radio" name="mood" id="mood-stressed" value="stressed"
									hidden>
									<div class="mood-emoji">😰</div>
									<div class="mood-label">Stressed</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-bored"> <input
									type="radio" name="mood" id="mood-bored" value="bored" hidden>
									<div class="mood-emoji">😑</div>
									<div class="mood-label">Bored</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-creative"> <input
									type="radio" name="mood" id="mood-creative" value="creative"
									hidden>
									<div class="mood-emoji">🎨</div>
									<div class="mood-label">Creative</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-focused"> <input
									type="radio" name="mood" id="mood-focused" value="focused"
									hidden>
									<div class="mood-emoji">🎯</div>
									<div class="mood-label">Focused</div>
								</label>
							</div>
							<div class="col-6 col-md-3">
								<label class="mood-card w-100" for="mood-relaxed"> <input
									type="radio" name="mood" id="mood-relaxed" value="relaxed"
									hidden>
									<div class="mood-emoji">😌</div>
									<div class="mood-label">Relaxed</div>
								</label>
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
						<h5 class="card-title">📝 Quick Note</h5>
						<p class="card-text">Grab a pen and paper and draw, doodle, or
							write down three things you're grateful for today.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">🎵 Music Boost</h5>
						<p class="card-text">Listen to a favorite song or calming
							instrumental to reset your mind and elevate your mood.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card suggestion-card shadow-lg h-100">
					<div class="card-body">
						<h5 class="card-title">🌿 Step Outside</h5>
						<p class="card-text">Take a 5-minute walk or simply stand on
							your balcony to breathe fresh air and recharge.</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1055">
		<div id="loginToast"
			class="toast align-items-center text-white bg-success border-0"
			role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body">Login successful!</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>
	<div style="flex-grow: 1;"></div>
	<!-- Footer -->
	<footer class="text-center">
		<div class="container">
			<p class="mb-1">&copy; 2025 TimeTrek. All rights reserved.</p>
			<a href="https://github.com/DevAbdallahSi/Time-Trek.git"
				class="text-light text-decoration-none">GitHub</a>
		</div>
	</footer>

	<!-- Bootstrap Bundle JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script src="/js/home.js"></script>

</body>

</html>