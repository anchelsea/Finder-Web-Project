package com.an.finder.dao;

import com.an.finder.entity.Authority;
import com.an.finder.entity.Like;
import com.an.finder.entity.User;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Parameter;
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


    public User findUserById(long id) {
        Session session = entityManager.unwrap(Session.class);

        Query<User> query = session.createQuery("from User u where u.id=:id");
        query.setParameter("id", id);

        User user = new User();
        try {
            user = query.getSingleResult();
        } catch (NoResultException nre) {
//Ignore this because as per your logic this is ok!
        }
        System.out.println(user);
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

    public List<User> finUserMale(String gender){
        Session session=entityManager.unwrap(Session.class);

        Query<User> query=session.createQuery("from User u where u.gender=:male");

        query.setParameter("male",gender);

        List<User> users = query.getResultList();

        return users;
    }

    public List<User> finUserMaleButThis(String gender,long userId){
        Session session=entityManager.unwrap(Session.class);

        Query<User> query=session.createQuery("from User u where u.gender=:male and u.id!=:userId");

        query.setParameter("male",gender);
        query.setParameter("userId",userId);

        List<User> users = query.getResultList();

        return users;
    }

    public List<User> finUserFeMaleButThis(String gender,long userId1){
        Session session=entityManager.unwrap(Session.class);

        Query<User> query=session.createQuery("from User u where u.gender=:male and u.id!=:userId1");

        query.setParameter("male",gender);
        query.setParameter("userId1",userId1);

        List<User> users = query.getResultList();

        return users;
    }

    public List<Like> findListLike(Long userId){
        Session session=entityManager.unwrap(Session.class);

        Query<Like> query=session.createQuery("from Like l where l.user.id=:userId");

        query.setParameter("userId",userId);

        List<Like> likes = query.getResultList();

        return likes;
    }

    public List<Like> findListMatch(Long userId){
        Session session=entityManager.unwrap(Session.class);

        Query<Like> query=session.createQuery("from Like l where l.user.id=:userId and l.matches.id!=0");

        query.setParameter("userId",userId);

        List<Like> likes = query.getResultList();

        return likes;
    }

    public List<User> finUserFeMale(String gender){
        Session session=entityManager.unwrap(Session.class);

        Query<User> query=session.createQuery("from User u where u.gender=:female");



        query.setParameter("female",gender);

        List<User> users = query.getResultList();

        return users;
    }

    public List<User> findAll(){

        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from User");

        List<User> users = query.getResultList();

        return users;
    }

    public List<User> findAllButThis(long userId){

        Session session = entityManager.unwrap(Session.class);

        Query query = session.createQuery("from User u where u.id!=:userId");

        query.setParameter("userId",userId);

        List<User> users = query.getResultList();

        return users;
    }

    public Like findLikeOfUser(long userId,long userLiked){
        Session session=entityManager.unwrap(Session.class);

        Query<Like> query=session.createQuery("from Like l where l.user.id=:userId and l.user_liked=:userLiked");



        query.setParameter("userId", userId);
        query.setParameter("userLiked", userLiked);

        Like like = query.getSingleResult();

        return like;
    }

    public List getLikedOfUser(long userId){
        Session session=entityManager.unwrap(Session.class);

        Query<User> query=session.createQuery("select Like.user_liked from Like where Like.user.id=:userId");


        query.setParameter("userId", userId);


        List<User> users = query.getResultList();

        return users;
    }

    public Boolean existInListLikedOfCurrentUser(long currentUserId,long likedUserId){
        Session session = entityManager.unwrap(Session.class);

        javax.persistence.Query query = session.createQuery("" +
                "select count(*) from Like where user.id=:userId and user_liked=:userLikedId");
        query.setParameter("userId",currentUserId);
        query.setParameter("userLikedId",likedUserId);

        long result = (long)query.getSingleResult();

        return result==1;
    }

/*    public void getUserlikedFromUser(long userId){
        Session session = entityManager.unwrap(Session.class);

        javax.persistence.Query query = session.createQuery("" +
                "select user_liked from Like where user.id=:userId");
        query.setParameter("userId",userId);


        long result = (long)query.getSingleResult();
    }*/

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
