package com.an.finder.service;

import com.an.finder.dao.MatchDao;
import com.an.finder.dao.UserDao;
import com.an.finder.entity.Like;
import com.an.finder.entity.Match;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class MatchService {
    @Autowired
    UserDao userDao;

    @Autowired
    MatchDao matchDao;

    @Transactional
    public void saveMatch(Match match) {
        matchDao.add(match);
    }

    @Transactional
    public List<Like> findListMatch(long userId) {
        return userDao.findListMatch(userId);
    }
}
