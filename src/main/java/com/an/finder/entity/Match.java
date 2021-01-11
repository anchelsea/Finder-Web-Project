package com.an.finder.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "matches")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToMany(mappedBy = "matches")
    private List<Like> likess;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time_match;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public Date getTime_match() {
        return time_match;
    }

    public void setTime_match(Date time_match) {
        this.time_match = time_match;
    }

    public List<Like> getLikess() {
        return likess;
    }

    public void setLikess(List<Like> likess) {
        this.likess = likess;
    }
}
