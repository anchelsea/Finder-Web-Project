package com.an.finder.controller;


import com.an.finder.entity.Interest;
import com.an.finder.entity.Photo;
import com.an.finder.entity.User;
import com.an.finder.service.FileService;
import com.an.finder.service.InterestService;
import com.an.finder.service.PhotoService;
import com.an.finder.service.UserService;
import com.an.finder.util.SimpleException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EditProfileController {
    @Autowired
    UserService userService;

    @Autowired
    FileService fileService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private InterestService interestService;

    @GetMapping("/edit")
    public String editProfile(Model model, HttpSession session){
        User user= (User) session.getAttribute("user");

        if(user==null){
            return "redirect:/";
        }

        if(!user.isFrist_login()){
            return  "redirect:/fristlogin";
        }

        user=userService.findUserByEmail(user.getEmail());

        System.out.println(user);

        model.addAttribute("user",user);
        model.addAttribute("interest",interestService.findAll());
        System.out.println(user.getNowYear());
        return "profile/edit-profile";
    }

    @PostMapping("/edit")
    public String edit(HttpServletRequest request, Model model, @ModelAttribute User user,
                       @RequestParam("photo") MultipartFile photoFiles,
                       @RequestParam("interest_tag") String interest_tag,
                       HttpSession session){


        List<String> messages = new ArrayList<>();



        try {

            User currentUser= (User) session.getAttribute("user");

            currentUser.setAbout(user.getAbout());
            currentUser.setWork(user.getWork());
            currentUser.setSchool(user.getSchool());
            currentUser.setGender(user.getGender());
            currentUser.setCitylive(user.getCitylive());
            System.out.println("aaa"+currentUser);
            if(!photoFiles.isEmpty()){
                fileService.saveImage(photoFiles);
                String photoPath = "/Upload/image/" + photoFiles.getOriginalFilename();
                Photo photo = new Photo();
                photo.setLink(photoPath);
                photo.setUser(currentUser);
                photoService.add(photo);
            }


            if(!interest_tag.isEmpty()){
                List<Interest> interests = interestService.find(interest_tag);
                currentUser.setInterest(interests);
            }

            userService.saveOrUpdate(currentUser);
            System.out.println(currentUser);


        } catch (Exception e) {
/*            if (e instanceof ConstraintViolationException) {
                ConstraintViolationException cvE = (ConstraintViolationException) e;
                for (var cv : cvE.getConstraintViolations()) {
                    messages.add(cv.getMessage());
                }
            }*/

            System.out.println(e);
            if (e instanceof SimpleException) {
                messages.add(e.getMessage());
            }
        }
        return "redirect:/profile";

    }

    @GetMapping("/{userId}/delete/{id}")
    public String deletePhoto(@PathVariable("userId") int userId,@PathVariable("id") int id){
        try {
            System.out.println(id);
            photoService.detele(id);
            System.out.println("aaaa");

        }catch (Exception e){
            System.out.println(e);
        }

        return "redirect:/profile";
    }
}
