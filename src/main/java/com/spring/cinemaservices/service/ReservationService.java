package com.spring.cinemaservices.service;

import com.spring.cinemaservices.model.Reservation;

import java.util.List;

public interface ReservationService {
    Reservation createReservation(Reservation reservation);
    Reservation getReservation(Long id);
    List<Reservation> getAllReservations();
    void deleteReservation(Reservation reservation);
}