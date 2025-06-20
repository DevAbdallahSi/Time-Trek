let currentEditingGoal = null;

let goals = [
    {
        id: 1,
        icon: '📖',
        title: 'Read 30 Minutes Daily',
        description: 'Build a consistent reading habit by dedicating 30 minutes each day to reading books that inspire and educate.',
        current: 23,
        target: 30,
        progress: 75
    },
    {
        id: 2,
        icon: '🏃‍♂️',
        title: 'Exercise 5 Times Per Week',
        description: 'Stay physically active with regular exercise sessions to improve health and energy levels.',
        current: 3,
        target: 5,
        progress: 60
    },
    {
        id: 3,
        icon: '🧘',
        title: 'Daily Meditation Practice',
        description: 'Cultivate mindfulness and reduce stress through daily meditation sessions.',
        current: 27,
        target: 30,
        progress: 90
    }
];

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

// Save a new or edited goal
function saveGoal() {
    const title = document.getElementById('goalTitle').value.trim();
    const description = document.getElementById('goalDescription').value.trim();
    const target = parseInt(document.getElementById('goalTarget').value);
    const icon = document.getElementById('goalIcon').value.trim() || '🎯';

    if (!title || !description || !target) {
        alert('Please fill in all fields');
        return;
    }

    if (currentEditingGoal) {
        const goalIndex = goals.findIndex(g => g.id === currentEditingGoal);
        if (goalIndex !== -1) {
            goals[goalIndex] = {
                ...goals[goalIndex],
                icon: icon,
                title: title,
                description: description,
                target: target,
                progress: Math.round((goals[goalIndex].current / target) * 100)
            };
        }
    } else {
        const newGoal = {
            id: Date.now(),
            icon: icon,
            title: title,
            description: description,
            current: 0,
            target: target,
            progress: 0
        };
        goals.push(newGoal);
    }

    renderGoals();
    bootstrap.Modal.getInstance(document.getElementById('goalModal')).hide();

    setTimeout(() => {
        alert(currentEditingGoal ? '✅ Goal updated successfully!' : '🎉 New goal added successfully!');
    }, 300);
}

// Delete a goal
function deleteGoal(goalId) {
    if (confirm('Are you sure you want to delete this goal? This action cannot be undone.')) {
        const goalIndex = goals.findIndex(g => g.id === goalId);
        if (goalIndex !== -1) {
            goals.splice(goalIndex, 1);
            renderGoals();
        }
    }
}

// Render all goals in the DOM
function renderGoals() {
    const goalsList = document.getElementById('goalsList');
    goalsList.innerHTML = '';

    goals.forEach(goal => {
        const goalHTML = `
            <div class="goal-item" data-goal-id="${goal.id}">
                <div class="goal-header">
                    <div class="goal-title">${goal.icon} ${goal.title}</div>
                    <div class="goal-actions">
                        <button class="btn btn-glass btn-sm" onclick="editGoal(${goal.id})">✏️ Edit</button>
                        <button class="btn btn-glass btn-sm" onclick="deleteGoal(${goal.id})">🗑️ Delete</button>
                    </div>
                </div>
                <div class="goal-description">${goal.description}</div>
                <div class="goal-progress">Progress: ${goal.progress}%</div>
            </div>
        `;
        goalsList.insertAdjacentHTML('beforeend', goalHTML);
    });
}

// FullCalendar setup
document.addEventListener('DOMContentLoaded', function () {
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
        form.addEventListener('submit', function (e) {
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
