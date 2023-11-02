package com.example;

import com.sun.tools.javac.Main;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class FrontMain {
    public static void main(String[] args) {
        SpringApplication.run(FrontMain.class, args);
    }
}