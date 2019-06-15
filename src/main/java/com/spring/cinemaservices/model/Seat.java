package com.spring.cinemaservices.model;

import javax.persistence.*;

@Entity
@Table(name = "seat")
public class Seat {
    public Seat() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "seat_id")
    private long id;

    @Column(name = "movie_id")
    private long movie_id;

    @Column(name = "seat_row")
    private int row;

    @Column(name = "seat_column")
    private int column;

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

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }
}
