let timerInterval;

// Get initial minutes from the JSP data attribute
const initialMinutes = parseInt(document.getElementById('timer').dataset.minutes);
let timeLeft = initialMinutes * 60; // Convert minutes to seconds
let isTimerRunning = false;

// Update the timer display
function updateTimerDisplay() {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;
    document.getElementById('timer').textContent =
        `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}

// Start or pause the timer
function startTimer() {
    const btn = document.getElementById('timerBtn');

    if (!isTimerRunning) {
        // Start timer
        isTimerRunning = true;
        btn.textContent = '⏸️ Pause Timer';
        btn.classList.remove('btn-light');
        btn.classList.add('btn-warning');

        timerInterval = setInterval(() => {
            timeLeft--;
            updateTimerDisplay();

            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                isTimerRunning = false;
                btn.textContent = '🎉 Time\'s Up!';
                btn.classList.remove('btn-warning');
                btn.classList.add('btn-success');
                showCompletionMessage();
            }
        }, 1000);
    } else {
        // Pause timer
        clearInterval(timerInterval);
        isTimerRunning = false;
        btn.textContent = '▶️ Resume Timer';
        btn.classList.remove('btn-warning');
        btn.classList.add('btn-light');
    }
}

// Show alert when timer is finished
function showCompletionMessage() {
    alert('🎉 Great job! You\'ve completed your activity. How do you feel now?');
}

// User marks activity as complete
function completeActivity() {
    const confirmation = confirm('Did you complete this activity? This will help us improve our suggestions for you!');
    if (confirmation) {
        alert('🎉 Awesome! Activity marked as completed. Great job on making the most of your time!');
        // Optional: Send data to server here
    }
}

// User asks for a new suggestion
function getNewSuggestion() {
    const confirmation = confirm('Would you like a different suggestion for your available time?');
    if (confirmation) {
        window.location.href = '/';
    }
}

// Initialize display on page load
updateTimerDisplay();

// Animate suggestion items when page loads
document.addEventListener('DOMContentLoaded', function () {
    const suggestionItems = document.querySelectorAll('.suggestion-item');

    suggestionItems.forEach((item, index) => {
        item.style.opacity = '0';
        item.style.transform = 'translateY(20px)';

        setTimeout(() => {
            item.style.transition = 'all 0.5s ease';
            item.style.opacity = '1';
            item.style.transform = 'translateY(0)';
        }, index * 200);
    });
});
