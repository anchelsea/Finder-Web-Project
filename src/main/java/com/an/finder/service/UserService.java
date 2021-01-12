package com.an.finder.service;

import com.an.finder.dao.UserDao;
import com.an.finder.entity.Authority;
import com.an.finder.entity.Like;
import com.an.finder.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserDao userDao;

    @Transactional
    public void saveOrUpdate(User user) {
        userDao.saveOrUpdate(user);
    }

    @Transactional
    public User findUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    @Transactional
    public User findUserById(long id) {
        return userDao.findUserById(id);
    }

    @Transactional
    public void addAuthority(Authority authority){
        userDao.addAuthority(authority);
    }

    @Transactional
    public User findUserByUsername(String username){
        return userDao.findUserByUsername(username);
    }

    @Transactional
    public List<User> getAllUser(){
        return userDao.findAll();
    }

    @Transactional
    public List<User> getAllUserButThis(long userId){
        return userDao.findAllButThis(userId);
    }


    @Transactional
    public List<User> findUserMale(String gender){
        return userDao.finUserMale(gender);
    }

    @Transactional
    public List<User> findUserMaleButThis(String gender,long userId){
        return userDao.finUserMaleButThis(gender,userId);
    }


    @Transactional
    public List<User> findUserFeMaleButThis(String gender,long userId){
        return userDao.finUserFeMaleButThis(gender,userId);
    }

    @Transactional
    public List<User> findUserFemale(String gender){
        return userDao.finUserFeMale(gender);
    }

    @Transactional
    public List<Like> getListLike(long userId){
        return userDao.findListLike(userId);
    }

    @Transactional
    public Like findLikeOfUser(long userId,long userLikedId){
        return userDao.findLikeOfUser(userId,userLikedId);
    }

    @Transactional
    public List<User> getLikedOfUser(long userId){
        return userDao.getLikedOfUser(userId);
    }

/*    @Transactional
    public  boolean isLike(long userId,long userLikeId){
        return userDao.isLike(userId,userLikeId);
    }*/
/*    @Transactional
    public <*/
}
