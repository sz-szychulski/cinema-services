package com.spring.cinemaservices.controler;

import com.spring.cinemaservices.model.Movie;
import com.spring.cinemaservices.model.Schedule;
import com.spring.cinemaservices.model.User;
import com.spring.cinemaservices.service.*;
import com.spring.cinemaservices.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private MovieService movieService;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/")
    public String welcome(Model model) {
        model.addAttribute("movieList", movieService.getAllMovies());
        return "index";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping("/movies_control")
    public String moviesControl(Model model) {
        model.addAttribute("movieList", movieService.getAllMovies());
        return "movies_control";
    }

    @PostMapping("/movies_control/add")
    public String addMovie(@RequestParam("title") String title,
                           @RequestParam("director") String director,
                           @RequestParam("type") String type,
                           @RequestParam("time") int time,
                           @RequestParam("poster_link") String posterLink,
                           Model model) {
        Movie newMovie = new Movie(title, time, posterLink, type, director);
        movieService.createMovie(newMovie);
        return "redirect:/";
    }

    @GetMapping("/movies_control/delete/{id}")
    public String deleteMovie(@PathVariable("id") Long id,
                              Model model){
        Movie selectMovie = movieService.getMovie(id);
        movieService.deleteMovie(selectMovie);
        return "redirect:/";
    }

    @GetMapping("/reservation/{id}")
    public String reserveTime(@PathVariable("id") Long id,
                                Model model) {
        Movie selectedMovie = movieService.getMovie(id);
        List<Schedule> allSchedules = scheduleService.getAllSchedules();
        List<Schedule> selectedMovieSchedules = new ArrayList<Schedule>();
        for(Schedule schedule : allSchedules) {
            if (schedule.getMovie_id() == id) {
                selectedMovieSchedules.add(schedule);
            }
        }
        model.addAttribute("title", selectedMovie.getTitle());
        model.addAttribute("director", selectedMovie.getDirector());
        model.addAttribute("type", selectedMovie.getType());
        model.addAttribute("time", selectedMovie.getTime());
        model.addAttribute("poster_link", selectedMovie.getPoster());
        model.addAttribute("schedulesList", selectedMovieSchedules);
        model.addAttribute("id", id);
        return "select_time";
    }

    @PostMapping("/reservation/{id}/details")
    public String showDetails(@PathVariable("id") Long id,
                              @RequestParam("schedule_id") Long schedule_id,
                              Model model) {
        Movie selectedMovie = movieService.getMovie(id);
        Schedule schedule = scheduleService.getSchedule(schedule_id);
        model.addAttribute("selectedMovie", selectedMovie);
        model.addAttribute("schedule", schedule);
        return "details";
    }

    @GetMapping("/schedule_control")
    public String scheduleControl(Model model) {
        model.addAttribute("schedulesList", scheduleService.getAllSchedules());
        return "schedule_control";
    }

    @PostMapping("/schedule_control/add")
    public String addSchedule(@RequestParam("movie_id") Long movie_id,
                              @RequestParam("time") String time,
                              @RequestParam("hall") int hall,
                              Model model) {
        Schedule schedule = new Schedule(movie_id, time, hall);
        scheduleService.createSchedule(schedule);
        return "redirect:/";
    }

    @GetMapping("/schedule_control/delete/{id}")
    public String deleteSchedule(@PathVariable("id") Long id,
                                 Model model){
        Schedule schedule = scheduleService.getSchedule(id);
        scheduleService.deleteSchedule(schedule);
        return "redirect:/";
    }
}
