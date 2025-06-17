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

function showAddGoalModal() {
    currentEditingGoal = null;
    document.getElementById('goalModalTitle').textContent = '➕ Add New Goal';
    document.getElementById('goalForm').reset();
    const modal = new bootstrap.Modal(document.getElementById('goalModal'));
    modal.show();
}

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
        // Edit existing goal
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
        // Add new goal
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
    
    // Success message
    setTimeout(() => {
        alert(currentEditingGoal ? '✅ Goal updated successfully!' : '🎉 New goal added successfully!');
    }, 300);
}

function deleteGoal(goalId) {
    if (confirm('Are you sure you want to delete this goal? This action cannot be undone.')) {
        const goalIndex = goals.findIndex(g => g.id === goalId);
        if (goalIndex !== -1) {
            goals.splice(goalIndex, 1);
            renderGoals(); // Update the UI after deletion
        }
    }
}

