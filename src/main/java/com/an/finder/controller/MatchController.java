package com.an.finder.controller;

import com.an.finder.entity.Like;
import com.an.finder.entity.Match;
import com.an.finder.entity.User;
import com.an.finder.service.MatchService;
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
public class MatchController {
    @Autowired
    UserService userService;

    @Autowired
    MatchService matchService;

    @GetMapping("/match")
    public String match(Model model, HttpSession session){
        User user= (User) session.getAttribute("user");


        if(user==null){
            return "redirect:/";
        }

        if(!user.isFrist_login()){
            return  "redirect:/fristlogin";
        }

        user=userService.findUserByEmail(user.getEmail());
        Map<Long,Boolean> userMap=new HashMap<>();

        List<Like> likes =matchService.findListMatch(user.getId());

        for(var like:likes){
  /*          System.out.println(like);
            Match match=like.getMatches();

            if(match!=null){
                System.out.println("match: "+like.getUser_liked());

            }*/
            System.out.println(like.getUser_liked());
            userMap.put(like.getUser_liked(),true);
        }

        List<User> users = userService.getAllUserButThis(user.getId());;

        List<User> resultUsers = new ArrayList<>();


        for(int i =0;i<users.size();i++){
            System.out.println("user: "+ users.get(i).getId() + "--match: " + userMap.get(users.get(i).getId()));
            if(userMap.get(users.get(i).getId()) != null){
                resultUsers.add(users.get(i));
            }
        }

        model.addAttribute("users",resultUsers);



        model.addAttribute("user",user);

        return "match";
    }



}
