package com.an.finder.controller;

import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    UserService userService;
    @GetMapping("/")
    public String login(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");


        if (user != null) {
            return "redirect:/home";
        }
        System.out.println(user);
        return "login";
    }

    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }

        if (!user.isFrist_login()) {
            return "redirect:/fristlogin";
        }
        user=userService.findUserByEmail(user.getEmail());

        int userSize=userService.getAllUser().size();
        model.addAttribute("userSize",userSize);
        model.addAttribute("users",userService.getAllUser());
        model.addAttribute("user",user);

        return "home";
    }

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/test1")
    public String test1() {
        return "test1";
    }

    @GetMapping("/test2")
    public String test2() {
        return "test2";
    }



    @GetMapping("/logout")
    public String logout(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("user", null);

        return "redirect:/";
    }
}
