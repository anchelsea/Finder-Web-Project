package com.an.finder.restcontroller;


import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import com.an.finder.util.ErrorMessage;
import com.an.finder.util.ValidationResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
public class UserRestController {

    @Autowired
    UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;



    @PostMapping(value = "ModalLogin")
    public ValidationResponse loginViaAjax(Model model,
                                           @ModelAttribute(value = "user") @Valid User user,
                                           BindingResult result, HttpServletRequest request){
        ValidationResponse res=new ValidationResponse();
        if(result.hasErrors()){
            res.setStatus("FAIL");
            List<FieldError> allError=result.getFieldErrors();
            final List<ErrorMessage> errorMessages=new ArrayList<ErrorMessage>();
            for(FieldError objectError : allError){
                errorMessages.add(new ErrorMessage(objectError.getField(),objectError.getDefaultMessage()));
            }
            res.setErrorMessageList(errorMessages);
        }

        else {
            Optional<User> theUser=userService.findUserByEmail(user.getEmail());
            final List<ErrorMessage> errorMessageList=new ArrayList<>();

            if(theUser.isPresent()){
                //User is exist, compare the passwords are equals?
                if(passwordEncoder.matches(user.getPassword(),theUser.get().getPassword())){
                   // uploadUserAttributesToSession(theUser,request);
                    res.setStatus("SUCCESS");
                }
                else {
                    res.setStatus("FAIL");
                    errorMessageList.add((new ErrorMessage("password","Invalid password!")));

                }
            }else {
                res.setStatus("FAIL");
                errorMessageList.add(new ErrorMessage("FORM FAIL", "Incorrect Email or Password!"));
            }
        }
        return res;
    }

}
