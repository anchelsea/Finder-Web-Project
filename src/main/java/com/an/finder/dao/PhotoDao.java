package com.an.finder.dao;

import com.an.finder.entity.Photo;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.swing.text.html.parser.Entity;
import java.util.List;

@Repository
public class PhotoDao {
    @Autowired
    EntityManager entityManager;

    public List<Photo> findAll(){

        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from Photo");

        List<Photo> photos = query.getResultList();

        return photos;
    }

    public void add(Photo photo){
        Session session = entityManager.unwrap(Session.class);
        session.saveOrUpdate(photo);
    }
}
