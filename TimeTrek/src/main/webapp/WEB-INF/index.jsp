<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">

<title>🕒 TimeTrek - Login & Registration</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google font Montserrat -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700,800"
	rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<!-- Floating Background Elements -->
	<div class="floating-element">🕒</div>
	<div class="floating-element">⏰</div>
	<div class="floating-element">📅</div>

	<!-- Brand Logo -->
	<div class="brand-logo">🕒 TimeTrek</div>

	<div class="container ${showSignUp ? 'right-panel-active' : ''}"
		id="container">
		<!-- Registration form -->
		<div class="form-container sign-up-container">
			<form:form action="/register" method="post" modelAttribute="newUser">
				<h1>Create Account</h1>
				<p>Join us and start your journey</p>

				<form:input path="firstName" placeholder="First Name"
					required="true" htmlEscape="false" />
				<form:errors path="firstName" cssClass="text-danger" />

				<form:input path="lastName" placeholder="Last Name" required="true"
					htmlEscape="false" />
				<form:errors path="lastName" cssClass="text-danger" />

				<form:input path="email" placeholder="Email" required="true"
					htmlEscape="false" />
				<form:errors path="email" cssClass="text-danger" />

				<form:password path="password" placeholder="Password"
					required="true" htmlEscape="false" />
				<form:errors path="password" cssClass="text-danger" />

				<form:password path="confirm" placeholder="Confirm Password"
					required="true" htmlEscape="false" />
				<form:errors path="confirm" cssClass="text-danger" />

				<button type="submit">Register</button>
			</form:form>
		</div>

		<!-- Login form -->
		<div class="form-container sign-in-container">
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<h1>Welcome Back</h1>
				<p>Sign in to continue your time management journey</p>

				<form:input path="email" placeholder="Email" required="true"
					htmlEscape="false" />
				<form:errors path="email" cssClass="text-danger" />

				<form:password path="password" placeholder="Password"
					required="true" htmlEscape="false" />
				<form:errors path="password" cssClass="text-danger" />

				<button type="submit">Sign In</button>
			</form:form>
		</div>

		<!-- Overlay panel with sliding buttons -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To stay connected with your goals and continue managing your
						time effectively, please login with your personal info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your details and start your journey with
						TimeTrek for better time management, personalized dashboard with goal tracking, daily summaries, and
						more smart features!</p>
					<button class="ghost" id="signUp">Register</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script src="/js/script.js"></script>

</body>
</html>