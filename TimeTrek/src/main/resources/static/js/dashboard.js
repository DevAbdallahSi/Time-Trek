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
// Delete a goal
function addGoal(goalId) {
		
	
	title=document.getElementById('goalTitle').value;
	desc=document.getElementById('goalDescription').value;
	
	if(title.length<4){
		alert("title should be at least 4 characters")
		return false;
	}
	if( desc.length<5){
		alert("description should be at least 5 characters");
		return false;
	}
	return true;
	
}





