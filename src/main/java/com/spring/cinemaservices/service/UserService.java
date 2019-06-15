package com.spring.cinemaservices.service;

import com.spring.cinemaservices.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
