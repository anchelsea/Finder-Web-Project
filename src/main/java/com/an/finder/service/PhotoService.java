package com.an.finder.service;

import com.an.finder.dao.PhotoDao;
import com.an.finder.entity.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class PhotoService {
    @Autowired
    PhotoDao photoDao;

    @Transactional
    public void add(Photo photo){
        photoDao.add(photo);
    }

    @Transactional
    public void detele(int id){
        photoDao.delete(id);
    }
}
