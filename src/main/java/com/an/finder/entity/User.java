package com.an.finder.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.validation.constraints.Email;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(columnNames = {
                "username"
        }),
        @UniqueConstraint(columnNames = {
                "email"
        })
})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(max=100)
    @Email
    private String email;


    @NotNull
    @Size(min=2,max=30,message = "username size must be from 2 to 20")
    private String username;

    @JsonIgnore
    @NotNull
    @Size(min = 1,message = "password is require")
    private String password;


    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @Size(min=2,max=20,message = "username size must be from 2 to 20")
    private String fristname;

    @Size(min=2,max=20,message = "username size must be from 2 to 20")
    private String lastname;

    private int age;

    private String gender;

    @Size(max = 500,message = "About is max size = 500 character")
    private String about;

    private String citylive;

    private String interest;

    private String work;

    private String school;

  private String location_Id;

  private String gender_filter;

    private String max_distance_filter;

    private String age_range_filter;

    private boolean status;

    public User(){};

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getFristname() {
        return fristname;
    }

    public void setFristname(String fristname) {
        this.fristname = fristname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCitylive() {
        return citylive;
    }

    public void setCitylive(String citylive) {
        this.citylive = citylive;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getLocation_Id() {
        return location_Id;
    }

    public void setLocation_Id(String location_Id) {
        this.location_Id = location_Id;
    }

    public String getGender_filter() {
        return gender_filter;
    }

    public void setGender_filter(String gender_filter) {
        this.gender_filter = gender_filter;
    }

    public String getMax_distance_filter() {
        return max_distance_filter;
    }

    public void setMax_distance_filter(String max_distance_filter) {
        this.max_distance_filter = max_distance_filter;
    }

    public String getAge_range_filter() {
        return age_range_filter;
    }

    public void setAge_range_filter(String age_range_filter) {
        this.age_range_filter = age_range_filter;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
