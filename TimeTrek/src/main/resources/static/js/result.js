let timerInterval;
let timeLeft = window.initialMinutes * 60; // Convert minutes to secondslet isTimerRunning = false;

function updateTimerDisplay() {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;
    document.getElementById('timer').textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}

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
                // Timer finished
                clearInterval(timerInterval);
                isTimerRunning = false;
                btn.textContent = '🎉 Time\'s Up!';
                btn.classList.remove('btn-warning');
                btn.classList.add('btn-success');
                
                // Show completion message
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

function showCompletionMessage() {
    alert('🎉 Great job! You\'ve completed your activity. How do you feel now?');
}

function completeActivity() {
    const confirmation = confirm('Did you complete this activity? This will help us improve our suggestions for you!');
    if (confirmation) {
        alert('🎉 Awesome! Activity marked as completed. Great job on making the most of your time!');
        // Here you could send data to the server to track completion
    }
}

function getNewSuggestion() {
    const confirmation = confirm('Would you like a different suggestion for your available time?');
    if (confirmation) {
        // Redirect back to home page or generate new suggestion
        window.location.href = '/';
    }
}

// Initialize timer display
updateTimerDisplay();

// Add some interactive effects
document.addEventListener('DOMContentLoaded', function() {
    // Animate suggestion items on scroll
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