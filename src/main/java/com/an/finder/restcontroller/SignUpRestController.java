package com.an.finder.restcontroller;

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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class SignUpRestController {

    @Autowired
    UserService userService;


    @PostMapping(value = "modal-signup")
    public @ResponseBody
    ValidationResponse signUpViaAjax(Model model,
                                     @RequestBody @Valid User user,
                              BindingResult result, HttpServletRequest request,
                         @RequestParam(value = "rePassword",required = false) String rePassword )
     {
        ValidationResponse res = new ValidationResponse();

        final List<ErrorMessage> errorMessageList=new ArrayList<>();

         User theUser = userService.findUserByEmail(user.getEmail());
        try{
/*            if(!user.getPassword().equals(user.get)){
                res.setStatus("FAIL");
                errorMessageList.add((new ErrorMessage("rePassword", "Incorrect password! Please retype.")));
            }*/
            if (theUser.getEmail()==null ) {
                //User is exist, compare the passwords are equals?

                try {
                    if(theUser.getUsername()==null){
                        user.setStatus(true);
                        userService.saveOrUpdate(user);
                        res.setStatus("SUCCESS");
                    }
                    else {
                        res.setStatus("FAIL");
                        errorMessageList.add(new ErrorMessage("username", "The username has exist in another account!"));
                    }
                }catch (Exception ex){
                    res.setStatus("FAIL");
                    errorMessageList.add(new ErrorMessage("username", "The username has exist in another account!"));
                }

            }
            else {
                res.setStatus("FAIL");
                errorMessageList.add(new ErrorMessage("email", "The email has exist in another account!"));
            }

        }catch (Exception ex){
            res.setStatus("FAIL");
            errorMessageList.add(new ErrorMessage("email", "The email has exist in another account!"));
        }
         res.setErrorMessageList(errorMessageList);

         System.out.println(res.status);
        return res;
    }

}
