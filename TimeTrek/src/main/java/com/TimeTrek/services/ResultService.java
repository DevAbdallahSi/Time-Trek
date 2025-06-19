package com.TimeTrek.services;

import org.springframework.stereotype.Service;

@Service

public class ResultService {

	public class DashboardStatsDTO {
		private Integer activeGoals;
		private Integer completedToday;
		private Integer minutesTracked;
		private Integer dayStreak;

		public Integer getActiveGoals() {
			return activeGoals;
		}

		public void setActiveGoals(Integer activeGoals) {
			this.activeGoals = activeGoals;
		}

		public Integer getCompletedToday() {
			return completedToday;
		}

		public void setCompletedToday(Integer completedToday) {
			this.completedToday = completedToday;
		}

		public Integer getMinutesTracked() {
			return minutesTracked;
		}

		public void setMinutesTracked(Integer minutesTracked) {
			this.minutesTracked = minutesTracked;
		}

		public Integer getDayStreak() {
			return dayStreak;
		}

		public void setDayStreak(Integer dayStreak) {
			this.dayStreak = dayStreak;
		}

		// Constructors, Getters, Setters
	}

}
