package com.an.finder.service;

import com.an.finder.dao.InterestDao;
import com.an.finder.entity.Interest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class InterestService {
    @Autowired
    InterestDao interestDao;

    @Transactional
    public List<Interest> find(String interestTags){
        return interestDao.find(interestTags);
    }

    @Transactional
    public List<Interest> findAll(){
        return interestDao.findAll();
    }
}
