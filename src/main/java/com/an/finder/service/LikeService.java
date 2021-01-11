package com.an.finder.service;

import com.an.finder.dao.LikeDao;
import com.an.finder.entity.Like;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class LikeService {

    @Autowired
    LikeDao likeDao;

    @Transactional
    public void saveLike(Like like){
        likeDao.add(like);
    }
}
