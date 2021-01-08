package com.an.finder.controller;

import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

@Transactional
@Controller
public class UserController {

 /*   @Autowired
    private AuthenticationManager authenticationManager;*/

    @Autowired
    private UserService userService;

    @GetMapping("/fristlogin")
    public String signUp(Model model){
        model.addAttribute("user",new User());

        return "frist-login";
    }

/*    @PostMapping
    public String signUp(HttpServletRequest request, @ModelAttribute User user,
                         )*/
}
