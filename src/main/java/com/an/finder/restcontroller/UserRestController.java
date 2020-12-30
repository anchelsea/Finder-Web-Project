package com.an.finder.restcontroller;


import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import com.an.finder.util.ErrorMessage;
import com.an.finder.util.ValidationResponse;

import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class UserRestController {

    @Autowired
    UserService userService;

/*    @Autowired
    private PasswordEncoder passwordEncoder;*/


    @PostMapping(value = "modal-login")
    public @ResponseBody
    ValidationResponse loginViaAjax(Model model,
                                    @ModelAttribute(value = "user") @Valid User user,
                                    BindingResult result, HttpServletRequest request) {
        ValidationResponse res = new ValidationResponse();

            User theUser = userService.findUserByEmail(user.getEmail());
            final List<ErrorMessage> errorMessageList = new ArrayList<>();
            try {
                if (theUser.getEmail().matches(user.getEmail())) {
                    //User is exist, compare the passwords are equals?
                    if ((user.getPassword().matches(theUser.getPassword()))) {
                        // uploadUserAttributesToSession(theUser,request);
                        res.setStatus("SUCCESS");
                    } else {
                        res.setStatus("FAIL");
                        errorMessageList.add((new ErrorMessage("password", "Incorrect password! Please retype.")));

                    }
                }
            } catch (NullPointerException ex) {
                res.setStatus("FAIL");
                errorMessageList.add(new ErrorMessage("email", "The email you entered doesn't match any of the accounts!"));

            }

/*        }else{
            res.setStatus("FAIL");
            errorMessageList.add(new ErrorMessage("FORM FAIL", "Incorrect Email or Password!"));
        }*/


            //Everything is O.K. and all odds controlled
            //if there any error add it to errorlist  and send it.
            res.setErrorMessageList(errorMessageList);

        System.out.println(res.status);
        System.out.println(res);
        return res;
    }

}
