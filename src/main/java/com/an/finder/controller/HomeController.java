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

        model.addAttribute("user",user);

        return "home";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }



    @GetMapping("/logout")
    public String logout(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("user", null);

        return "redirect:/";
    }
}
