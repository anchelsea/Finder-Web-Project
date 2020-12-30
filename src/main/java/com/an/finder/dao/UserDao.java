package com.an.finder.dao;

import com.an.finder.entity.User;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.util.Optional;


@Repository
public class UserDao {

    @Autowired
    EntityManager entityManager;

    public void saveOrUpdate(User user) {
        Session session = entityManager.unwrap(Session.class);
        session.saveOrUpdate(user);
    }

    public User findUserById(int id) {
        Session session = entityManager.unwrap(Session.class);

        Query<User> query = session.createQuery("from User u where u.id=:id");
        query.setParameter("id", id);

        User user = query.getSingleResult();

        return user;
    }

    public User findUserByEmail(String email) {
        Session session = entityManager.unwrap(Session.class);

        Query<User> query = session.createQuery("from User u where u.email=:email");
        query.setParameter("email", email);

        User user=new User();
        try {
       user = query.getSingleResult();
        }
        catch(NoResultException nre){
//Ignore this because as per your logic this is ok!
            }
            System.out.println(user);
            return user;
        }



    }
