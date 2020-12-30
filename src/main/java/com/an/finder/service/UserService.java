package com.an.finder.service;

import com.an.finder.dao.UserDao;
import com.an.finder.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
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
/*    @Transactional
    public <*/
}
