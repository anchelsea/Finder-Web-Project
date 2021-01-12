package com.an.finder.controller;

import com.an.finder.entity.Like;
import com.an.finder.entity.User;
import com.an.finder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

       /* int userSize=userService.getAllUserButThis(user.getId()).size();*/

        Map<Long,Boolean> userMap=new HashMap<>();

        List<Like> likes =userService.getListLike(user.getId());

        for(var like:likes){
            System.out.println("like: "+like.getUser_liked());
            userMap.put(like.getUser_liked(),true);
        }

        List<User> users;

        if(user.getGender().equals("male")){
            users = userService.findUserFeMaleButThis("female",user.getId());
        }
        else  if(user.getGender().equals("female")){
            users = userService.findUserMaleButThis("male",user.getId());
        }
        else {
            users = userService.getAllUserButThis(user.getId());
        }

        System.out.println("users list");
        for (var user1 : users){
            System.out.println(user1.getId());
        }

        List<User> resultUsers = new ArrayList<>();


        for(int i =0;i<users.size();i++){
            System.out.println("user: "+ users.get(i).getId() + "--like: " + userMap.get(users.get(i).getId()));
            if(userMap.get(users.get(i).getId()) == null){
                resultUsers.add(users.get(i));
            }
        }

        model.addAttribute("users",resultUsers);



        /*model.addAttribute("userSize",users.size());*/
        model.addAttribute("user",user);

        return "home";
    }



    @GetMapping("/test2")
    public String test2() {
        return "test2";
    }

    @GetMapping("/test1")
    public String test1() {
        return "match-modal";
    }




    @GetMapping("/logout")
    public String logout(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("user", null);

        return "redirect:/";
    }
}
