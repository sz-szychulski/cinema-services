package com.spring.cinemaservices.model;

import javax.persistence.*;

@Entity
@Table(name = "movies")
public class Movie {
    public Movie() {
    }

    public Movie(String title, int time, String poster, String type, String director) {
        this.title = title;
        this.time = time;
        this.poster = poster;
        this.type = type;
        this.director = director;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "movie_id")
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "time")
    private int time;

    @Column(name = "poster")
    private String poster;

    @Column(name = "type")
    private String type;

    @Column(name = "director")
    private String director;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
}
