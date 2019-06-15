package com.spring.cinemaservices.repository;

import com.spring.cinemaservices.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}
