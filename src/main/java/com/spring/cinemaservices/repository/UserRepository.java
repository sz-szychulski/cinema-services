package com.spring.cinemaservices.repository;

import com.spring.cinemaservices.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
