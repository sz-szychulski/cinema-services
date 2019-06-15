package com.spring.cinemaservices.service;

import com.spring.cinemaservices.model.Movie;

import java.util.List;

public interface MovieService {
    Movie createMovie(Movie movie);
    Movie getMovie(Long id);
    List<Movie> getAllMovies();
}
