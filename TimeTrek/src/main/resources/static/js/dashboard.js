let currentEditingGoal = null;



// Show the modal to add a new goal
function showAddGoalModal() {
	currentEditingGoal = null;
	document.getElementById('goalModalTitle').textContent = '➕ Add New Goal';
	document.getElementById('goalForm').reset();
	const modal = new bootstrap.Modal(document.getElementById('goalModal'));
	modal.show();
}

// Show the modal to edit an existing goal
function editGoal(goalId) {
	const goal = goals.find(g => g.id === goalId);
	if (!goal) return;

	currentEditingGoal = goalId;
	document.getElementById('goalModalTitle').textContent = '✏️ Edit Goal';
	document.getElementById('goalTitle').value = goal.title.replace(goal.icon + ' ', '');
	document.getElementById('goalDescription').value = goal.description;
	document.getElementById('goalTarget').value = goal.target;
	document.getElementById('goalIcon').value = goal.icon;

	const modal = new bootstrap.Modal(document.getElementById('goalModal'));
	modal.show();
}



// Delete a goal
function deleteGoal(goalId) {
	if (confirm('Are you sure you want to delete this goal? This action cannot be undone.')) {
		window.location.href = `/deleteGoal/${goalId}`;


	}
}



// FullCalendar setup
document.addEventListener('DOMContentLoaded', function() {
	const calendarEl = document.getElementById('calendar');
	if (calendarEl) {
		const calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'timeGridWeek',
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			editable: false,
			events: '/schedule/events' // This must be served as JSON from your backend
		});
		calendar.render();
	}

	// Attach event form handler safely
	const form = document.getElementById('eventForm');
	if (form) {
		form.addEventListener('submit', function(e) {
			e.preventDefault();

			const title = document.getElementById('evTitle').value;
			const start = document.getElementById('evStart').value;
			const end = document.getElementById('evEnd').value;

			if (!title || !start || !end) {
				alert("Please fill in all event fields.");
				return;
			}

			fetch("/schedule/events", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ title, start, end })
			}).then(res => res.json())
				.then(() => location.reload())
				.catch(err => alert("Failed to add event."));
		});
	}

	renderGoals();
});
