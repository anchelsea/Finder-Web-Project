package com.an.finder.controller;

import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MatchController {
    @Autowired
    UserService userService;

    @GetMapping("/match")
    public String match(Model model, HttpSession session){
        User user= (User) session.getAttribute("user");

        if(user==null){
            return "redirect:/";
        }

        if(!user.isFrist_login()){
            return  "redirect:/fristlogin";
        }

        user=userService.findUserByEmail(user.getEmail());

        model.addAttribute("user",user);

        return "match";
    }



}
