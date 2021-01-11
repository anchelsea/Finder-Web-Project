package com.an.finder.controller;

import com.an.finder.entity.Interest;
import com.an.finder.entity.Photo;
import com.an.finder.entity.User;
import com.an.finder.service.*;
import com.an.finder.util.SimpleException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

@Transactional
@Controller
public class UserController {

 /*   @Autowired
    private AuthenticationManager authenticationManager;*/

    @Autowired
    private UserService userService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private InterestService interestService;

    @Autowired
    FileService fileService;

    @GetMapping("/fristlogin")
    public String signUp(Model model, HttpSession session) {

        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/";
        }

        model.addAttribute("user", user);
        model.addAttribute("interest",interestService.findAll());
        return "frist-login";
    }


    @PostMapping("/fristlogin")
    public String signUp(HttpServletRequest request, Model model, @ModelAttribute User user,
                         @RequestParam("photo") MultipartFile[] photoFiles,
                         @RequestParam("interest_tag") String interest_tag,
                         HttpSession session) {
        List<String> messages = new ArrayList<>();
    /*    user = LoginUser.getLoginUser();*/
        User currentUser = (User)session.getAttribute("user");
        currentUser.setFristname(user.getFristname());
        currentUser.setLastname(user.getLastname());
        currentUser.setBirthday(user.getBirthday());
        currentUser.setGender(user.getGender());



        try {
            System.out.println("aaa");
            System.out.println(photoFiles.length);
            for (int i = 0; i < photoFiles.length; i++) {
                fileService.saveImage(photoFiles[i]);
                System.out.println(photoFiles[i]);
                String photoPath = "/Upload/image/" + photoFiles[i].getOriginalFilename();
                System.out.println("bbbb");
                Photo photo = new Photo();

                photo.setLink(photoPath);
                photo.setUser(currentUser);


                photoService.add(photo);
                System.out.println(photo.getLink());
                System.out.println(photo);
            }

            System.out.println("user" +currentUser);

            List<Interest> interests = interestService.find(interest_tag);
            System.out.println(interests);
            currentUser.setInterest(interests);
            currentUser.setFrist_login(true);
            userService.saveOrUpdate(currentUser);


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
