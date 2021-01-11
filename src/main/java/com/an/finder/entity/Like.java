package com.an.finder.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.Nullable;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "likes")
public class Like {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    @JsonIgnore
    @Nullable
    private long user_liked;


    @ManyToOne
    @JoinColumn(name = "match_id")
    private Match matches;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getUser_liked() {
        return user_liked;
    }

    public void setUser_liked(long user_liked) {
        this.user_liked = user_liked;
    }

    public Match getMatches() {
        return matches;
    }

    public void setMatches(Match matches) {
        this.matches = matches;
    }
}
