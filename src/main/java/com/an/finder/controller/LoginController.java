package com.an.finder.controller;

import com.an.finder.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/login")
public class LoginController {


    @GetMapping("/signin")
    public String signup(Model model){
        model.addAttribute("user",new User());

        return "login";
    }

    @PostMapping("/signup")
    public String signUp( @ModelAttribute User user, RedirectAttributes redirect) {

    return "redirect:/login";
    }
}
