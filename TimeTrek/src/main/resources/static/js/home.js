
// Mood selector functionality
document.addEventListener('DOMContentLoaded', function() {
	const moodCards = document.querySelectorAll('.mood-card');
	const moodInput = document.getElementById('mood');

	moodCards.forEach(card => {
		card.addEventListener('click', function() {
			// Remove selected class from all cards
			moodCards.forEach(c => c.classList.remove('selected'));

			// Add selected class to clicked card
			this.classList.add('selected');

			// Update hidden input value
			const selectedMood = this.getAttribute('data-mood');
			moodInput.value = selectedMood;

			// Add a subtle animation
			this.style.transform = 'scale(1.1)';
			setTimeout(() => {
				this.style.transform = '';
			}, 200);
		});
	});

	// Form validation to ensure mood is selected
	const form = document.querySelector('form');
	form.addEventListener('submit', function(e) {
		if (!moodInput.value) {
			e.preventDefault();
			alert('Please select how you\'re feeling!');
			return false;
		}
	});
});

document.querySelector("form").addEventListener("submit", function() {
	document.getElementById("result-wait").style.display = "flex";
});

window.addEventListener("DOMContentLoaded", function() {
	const alert = document.getElementById("success-alert");
	if (alert) {
		setTimeout(function() {
			alert.classList.remove("show");
			alert.classList.add("hide");
		}, 2000);
	}
});
