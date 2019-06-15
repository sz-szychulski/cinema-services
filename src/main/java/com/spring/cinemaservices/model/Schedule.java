package com.spring.cinemaservices.model;

import javax.persistence.*;

@Entity
@Table(name = "schedule")
public class Schedule {
    public Schedule() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "schedule_id")
    private long id;

    @Column(name = "movie_id")
    private long movie_id;

    @Column(name = "time")
    private String time;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(long movie_id) {
        this.movie_id = movie_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
