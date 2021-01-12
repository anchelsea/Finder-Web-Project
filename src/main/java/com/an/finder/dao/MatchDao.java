package com.an.finder.dao;

import com.an.finder.entity.Match;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
public class MatchDao {
    @Autowired
    EntityManager entityManager;

    public void add(Match match){
        Session session=entityManager.unwrap(Session.class);
        session.saveOrUpdate(match);
    }
}
