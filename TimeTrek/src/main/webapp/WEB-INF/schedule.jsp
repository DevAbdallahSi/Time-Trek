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

<style>
:root {
	--glass-bg: rgba(255, 255, 255, 0.1);
	--glass-border: rgba(255, 255, 255, 0.2);
}

body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.navbar {
	background: var(--glass-bg) !important;
	backdrop-filter: blur(10px);
	border-bottom: 1px solid var(--glass-border);
	box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
}

.navbar-brand {
	font-weight: bold;
	font-size: 1.5rem;
}

.container-main {
	flex: 1;
	padding: 20px;
	width: 100%;
	max-width: 1200px; /* Increased from 900px */
	margin: 30px auto;
	background: var(--glass-bg);
	backdrop-filter: blur(20px);
	border-radius: 25px;
	border: 1px solid var(--glass-border);
	box-shadow: 0 15px 40px rgba(31, 38, 135, 0.4);
}

h2 {
	text-align: center;
	color: black;
	margin-bottom: 20px;
	font-size: 1.8rem;
	text-shadow: 0 0 5px rgba(0, 0, 0, 0.4);
}

#calendar {
	background: white;
	border-radius: 15px;
	padding: 10px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

#modalOverlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1040;
}

#eventForm {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	width: 90%;
	max-width: 400px;
	background: var(--glass-bg);
	backdrop-filter: blur(20px);
	padding: 20px;
	border-radius: 15px;
	transform: translate(-50%, -50%);
	z-index: 1050;
	box-shadow: 0 15px 40px rgba(31, 38, 135, 0.5);
}

#eventForm h3 {
	color: white;
	text-align: center;
	margin-bottom: 1rem;
}

#eventForm label {
	color: white;
	font-weight: 600;
}

#eventForm input, #eventForm textarea {
	width: 100%;
	margin-bottom: 1rem;
	border-radius: 10px;
	padding: 10px;
	border: none;
	font-size: 1rem;
}

#eventForm textarea {
	resize: vertical;
	min-height: 60px;
}

#eventForm button {
	width: 48%;
}

@media ( max-width : 576px) {
	h2 {
		font-size: 1.4rem;
	}
	#calendar {
    background: white;
    border-radius: 20px;
    padding: 30px; /* Increased from 10px */
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    min-height: 700px; /* This ensures a tall visible calendar */
}
	.navbar-brand {
		font-size: 1.2rem;
	}
	#eventForm {
		max-width: 95%;
		padding: 15px;
	}
}
</style>
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
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/dashboard">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container-main">
		<h2>📅 My Schedule for: ${user.firstName}</h2>
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

	<script>
    const modalOverlay = document.getElementById('modalOverlay');
    const eventForm = document.getElementById('eventForm');

    function openForm(dateStr) {
        document.getElementById('eventStart').value = dateStr + "T09:00";
        document.getElementById('eventEnd').value = dateStr + "T10:30";
        eventForm.style.display = 'block';
        modalOverlay.style.display = 'block';
    }

    function closeForm() {
        eventForm.style.display = 'none';
        modalOverlay.style.display = 'none';
        document.getElementById('addEventForm').reset();
    }

    function addSecondsIfMissing(str) {
        return str.length === 16 ? str + ":00" : str;
    }

    document.getElementById('addEventForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const eventData = {
            title: document.getElementById('eventTitle').value.trim(),
            start: addSecondsIfMissing(document.getElementById('eventStart').value),
            end: addSecondsIfMissing(document.getElementById('eventEnd').value),
            description: document.getElementById('eventDesc').value.trim()
        };

        fetch('/schedule/events', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(eventData)
        })
        .then(res => res.json())
        .then(data => {
            calendar.addEvent({
                id: data.id,
                title: data.title,
                start: data.start,
                end: data.end,
                description: data.description
            });
            alert("✅ Event added!");
            closeForm();
        })
        .catch(err => {
            console.error(err);
            alert("❌ Failed to add event.");
        });
    });

    let calendar;

    document.addEventListener('DOMContentLoaded', function () {
        const calendarEl = document.getElementById('calendar');

        calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            selectable: true,
            editable: false,
            events: '/schedule/events',
            dateClick: function(info) {
                openForm(info.dateStr);
            }
        });

        calendar.render();
    });

    modalOverlay.addEventListener('click', closeForm);
</script>

</body>
</html>
