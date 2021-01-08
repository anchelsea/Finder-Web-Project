package com.an.finder.dao;

import com.an.finder.entity.Interest;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

@Repository
public class InterestDao {

    @Autowired
    private EntityManager entityManager;

    public List<Interest> find(String interestTags){
        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from Interest where name in :tags");
        query.setParameterList("tags",getInterestListFromString(interestTags));

        return query.getResultList();
    }

    public List<Interest> findAll(){

        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from Interest ");

        return query.getResultList();
    }

    private List<String> getInterestListFromString(String interest){
        String[] str = interest.split(",");
        List<String> interestList = new ArrayList<String>();
        for(var s : str){
            interestList.add(s);
        }
        return interestList;
    }
}
