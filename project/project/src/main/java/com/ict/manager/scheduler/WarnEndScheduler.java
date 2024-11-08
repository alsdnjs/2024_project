package com.ict.manager.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ict.manager.user.service.UserService;

@Component
public class WarnEndScheduler {
	@Autowired
	private UserService userService;

	@Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행
	public void deleteExpiredWarnings() {
		userService.deleteExpiredWarnings();
	}

}
