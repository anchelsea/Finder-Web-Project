/*
package com.an.finder.service;

import com.an.finder.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class LoginUser {
    public static User getLoginUser(){
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails){
            UserDetails userLogin = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = null;
            if(userLogin != null){
                user = ((MyUserDetails)userLogin).getUser();
            }
            return user;
        }
        return null;
    }
}
*/
