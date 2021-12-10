package io.github.monkeydatabase.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class LoginController {
    @RequestMapping("/login-page")
    public String demo(Model model){
        log.debug("login html ok");
        model.addAttribute("msg", "hello thymeleaf");
        return "login";
    }
}
