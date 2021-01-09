package com.an.finder.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user", uniqueConstraints = {
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

    @NotNull
    @Size(min = 1,message = "password is require")
    private String password;


    @JsonIgnore
    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER )
    private List<Authority> authorities;

    @Size(min=2,max=20,message = "username size must be from 2 to 20")
    private String fristname;

    @Size(min=2,max=20,message = "username size must be from 2 to 20")
    private String lastname;


    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String gender;

    @OneToMany(mappedBy = "user")
    private List<Photo> photos;

    @Size(max = 500,message = "About is max size = 500 character")
    private String about;

    private String citylive;

    @ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JoinTable(
            name = "user_interest",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "interest_id")}
    )
    private List<Interest> interest;

    private String work;

    private String school;

  private String location_Id;

  private String gender_filter;

    private String max_distance_filter;

    private String age_range_filter;

    private boolean frist_login;

    private boolean status;

    public User(){};

    public int getPhotoLength(){
        return photos.size();
    }

    public int getInterestLength(){
        return interest.size();
    }

    public List<Authority> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<Authority> authorities) {
        this.authorities = authorities;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public List<Interest> getInterest() {
        return interest;
    }

    public void setInterest(List<Interest> interest) {
        this.interest = interest;
    }

    public boolean isFrist_login() {
        return frist_login;
    }

    public void setFrist_login(boolean frist_login) {
        this.frist_login = frist_login;
    }

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

    public List<Photo> getPhotos() {
        return photos;
    }


    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }


    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getYearBirthday(){
        Date date = this.getBirthday();
        java.sql.Date dat = java.sql.Date.valueOf(String.valueOf(date));
        Calendar cal = Calendar.getInstance();
        cal.setTime(dat);

        int year = cal.get(Calendar.YEAR);
        return year;
    }

    public int getNowYear(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        return year;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authorities=" + authorities +
                ", fristname='" + fristname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", birthday=" + birthday +
                ", gender='" + gender + '\'' +
                ", photos=" + photos +
                ", about='" + about + '\'' +
                ", citylive='" + citylive + '\'' +
                ", interest=" + interest +
                ", work='" + work + '\'' +
                ", school='" + school + '\'' +
                ", location_Id='" + location_Id + '\'' +
                ", gender_filter='" + gender_filter + '\'' +
                ", max_distance_filter='" + max_distance_filter + '\'' +
                ", age_range_filter='" + age_range_filter + '\'' +
                ", frist_login=" + frist_login +
                ", status=" + status +
                '}';
    }
}
