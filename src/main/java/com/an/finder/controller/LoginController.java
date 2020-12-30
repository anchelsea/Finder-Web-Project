package com.an.finder.controller;

import com.an.finder.entity.Role;
import com.an.finder.entity.RoleName;
import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import com.an.finder.util.ErrorMessage;
import com.an.finder.util.SimpleException;
import com.an.finder.util.ValidationResponse;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Controller
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
    public @ResponseBody
    ValidationResponse signUpViaAjax(Model model,
                              @ModelAttribute(value = "user") @Valid User user,
                              BindingResult result, HttpServletRequest request,
                         @RequestParam("rePassword") String rePassword )
     {
        ValidationResponse res = new ValidationResponse();

        final List<ErrorMessage> errorMessageList=new ArrayList<>();
         System.out.println(user.getEmail());
         System.out.println(user.getEmail());
         System.out.println(user.getEmail());
         System.out.println(user.getUsername());
         User theUser = userService.findUserByEmail(user.getEmail());
         System.out.println(theUser.getEmail());
        try{
  /*          if(!user.getPassword().equals(rePassword)){
                res.setStatus("FAIL");
                errorMessageList.add((new ErrorMessage("rePassword", "Incorrect password! Please retype.")));

            }*/
            if (theUser.getEmail()==null & theUser.getUsername()==null) {
                //User is exist, compare the passwords are equals?
                System.out.println(user.getUsername());
/*                User user1 = new User();
                user1.setUsername(user.getUsername());
                user1.setPassword(user.getPassword());
                user1.setEmail(user.getEmail());*/
                userService.saveOrUpdate(user);
            }

        }catch (Exception ex){
            res.setStatus("FAIL");
            errorMessageList.add(new ErrorMessage("email", "The email/username has exist in another account!"));
        }
         res.setErrorMessageList(errorMessageList);

         System.out.println(res.status);
         System.out.println(res);
        return res;
    }

}
