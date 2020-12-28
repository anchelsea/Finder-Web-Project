package com.an.finder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication
public class FinderApplication {

    public static void main(String[] args) {
        SpringApplication.run(FinderApplication.class, args);
    }

}
