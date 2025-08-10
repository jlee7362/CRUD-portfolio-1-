package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/usr/home/main")
    public String main() {
        return "/WEB-INF/jsp/home/main.jsp"; // /WEB-INF/jsp/main.jsp
    }
}