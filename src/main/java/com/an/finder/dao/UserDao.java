package com.an.finder.dao;

import com.an.finder.entity.Authority;
import com.an.finder.entity.User;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.util.List;
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

        User user = new User();
        try {
            user = query.getSingleResult();
        } catch (NoResultException nre) {
//Ignore this because as per your logic this is ok!
        }
        System.out.println(user);
        return user;
    }


    public void addAuthority(Authority authority) {
        Session session = entityManager.unwrap(Session.class);
        session.saveOrUpdate(authority);
    }

    public User findUserByUsername(String username) {
        Session session = entityManager.unwrap(Session.class);

        Query<User> query = session.createQuery("from User u where u.username=:username");
        query.setParameter("username", username);

        User user = query.getSingleResult();

        return user;
    }

    public List<User> findAll(){

        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from User");

        List<User> users = query.getResultList();

        return users;
    }

/*    public List<User> findUserByGenderAndAgeRange(String gender) {
        Session session = entityManager.unwrap(Session.class);

        String queryString;


        Query query = session.createQuery("from User u where u.gender=:gender");

        query.setFirstResult(0);
        query.setMaxResults(50);

        List<User> users = query.getSingleResult();
        return user;
    }*/

}
