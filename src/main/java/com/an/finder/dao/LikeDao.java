package com.an.finder.dao;

import com.an.finder.entity.Like;
import com.an.finder.entity.Photo;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
public class LikeDao {
    @Autowired
    EntityManager entityManager;

    public void add(Like like){
        Session session = entityManager.unwrap(Session.class);
        session.saveOrUpdate(like);
    }
}
