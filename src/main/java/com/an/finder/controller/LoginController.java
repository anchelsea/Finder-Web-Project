package com.an.finder.controller;

import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import com.an.finder.util.ValidationResponse;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("")
public class LoginController {

    @Autowired
    UserService userService;

/*    @GetMapping("/modal-signup")
    public ModelAndView signup(){
        ModelAndView modelAndView=new ModelAndView();
        User user=new User();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("signup-modal");

        return modelAndView;
    }*/


    @PostMapping(value = "modal-signup")
    public String signUp(HttpServletRequest httpServletRequest,
                               @ModelAttribute(value = "user") User user, BindingResult bindingResult, Model model, RedirectAttributes redirect) {

        userService.saveOrUpdate(user);

        return "redirect:/signup-modal";
    }

}
