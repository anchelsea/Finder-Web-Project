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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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


        model.addAttribute("user",user);
        model.addAttribute("interest",interestService.findAll());
        return "profile/edit-profile";
    }

    @PostMapping("/edit")
    public String edit(HttpServletRequest request, Model model, @ModelAttribute User user,
                       @RequestParam("photo") MultipartFile[] photoFiles,
                       @RequestParam("interest_tag") String interest_tag,
                       HttpSession session){


        List<String> messages = new ArrayList<>();

        User currentUser= (User) session.getAttribute("user");
        System.out.println("aaaaa");
        System.out.println(currentUser);
        currentUser.setAbout(user.getAbout());
        currentUser.setWork(user.getWork());
        currentUser.setSchool(user.getSchool());
        currentUser.setGender(user.getGender());

        try {
/*            System.out.println(photoFiles.length);
            for (int i = 1; i < photoFiles.length; i++) {
                fileService.saveImage(photoFiles[i]);
                System.out.println(photoFiles[i]);
                String photoPath = "/Upload/image/" + photoFiles[i].getOriginalFilename();
                Photo photo = new Photo();

                photo.setLink(photoPath);
                photo.setUser(currentUser);


                photoService.add(photo);
                System.out.println(photo.getLink());
                System.out.println(photo);
            }*/

            System.out.println("user" +currentUser);

            List<Interest> interests = interestService.find(interest_tag);
            System.out.println(interests);
            currentUser.setInterest(interests);
            userService.saveOrUpdate(currentUser);
            System.out.println("Bbbb");
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
        return "redirect:/home";



    }
}
