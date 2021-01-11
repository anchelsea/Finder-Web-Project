package com.an.finder.restcontroller;

import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/users")
public class UserRestController {

    @Autowired
    private UserService userService;

    @GetMapping()
    public List<User> userList(String gender){
        List<User> users=null;
        users= (List<User>) userService.getAllUser();

        return users;
    }

}
