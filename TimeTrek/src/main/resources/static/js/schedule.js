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
