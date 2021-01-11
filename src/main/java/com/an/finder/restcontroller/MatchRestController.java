package com.an.finder.restcontroller;

import com.an.finder.entity.Like;
import com.an.finder.entity.User;
import com.an.finder.service.LikeService;
import com.an.finder.service.UserService;
import com.an.finder.util.ValidationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@RestController
public class MatchRestController {
    @Autowired
    LikeService likeService;

    @Autowired
    UserService userService;

    @PostMapping(value = "like")
    public ValidationResponse like(HttpSession session, Model model, @RequestBody @Valid List<User> users, int index) {
        User currentUser = (User) session.getAttribute("user");
        ValidationResponse res = new ValidationResponse();
        try {
            Like like = new Like();
            like.setUser(currentUser);
            like.setUser_liked(users.get(index).getId());
            likeService.saveLike(like);
            res.setStatus("SUCCESS");
        } catch (Exception e) {
            System.out.println(e);
            res.setStatus("FAIL");
        }

        return res;
    }
}
