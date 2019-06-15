package com.spring.cinemaservices.service;

import com.spring.cinemaservices.model.Schedule;

import java.util.List;

public interface ScheduleService {
    Schedule createSchedule(Schedule schedule);
    Schedule getSchedule(Long id);
    List<Schedule> getAllSchedules();
    void deleteSchedule(Schedule schedule);
}
