package com.an.finder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

@Service
public class FileService {
    @Autowired
    ServletContext servletContext;

    List<String> contentTypes = Arrays.asList("image/png", "image/jpeg", "image/gif","image/jpg");

    public String saveImage(MultipartFile file) throws Exception{

        if(!contentTypes.contains(file.getContentType())){
            throw new Exception("File isn't an image");
        }

        String folder = servletContext.getRealPath("/") +"/Upload/image/";
        byte[] bytes = file.getBytes();
        Path path = Paths.get(folder +file.getOriginalFilename());
        Files.write(path,bytes);
        return path.toString();
    }

    public String saveMessageImage(MultipartFile file,String pathStr) throws Exception{
        if(!contentTypes.contains(file.getContentType())){
            throw new Exception("File isn't an image");
        }

        String filePath = servletContext.getRealPath("/") + pathStr;
        byte[] bytes = file.getBytes();
        Path path = Paths.get(filePath);
        Files.write(path,bytes);
        return path.toString();
    }

}
