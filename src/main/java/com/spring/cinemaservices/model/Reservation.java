package com.spring.cinemaservices.model;

import javax.persistence.*;

@Entity
@Table(name = "reservation")
public class Reservation {
    public Reservation() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "reservation_id")
    private long id;

    @Column(name = "seat_id")
    private long seat_id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(long seat_id) {
        this.seat_id = seat_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
}
