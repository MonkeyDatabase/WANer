package io.github.monkeydatabase.controller;

import io.github.monkeydatabase.ajax.AjaxResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomePageController {
    @RequestMapping("/")
    public AjaxResponse index() {

        return AjaxResponse.success(233, "This is from homePage");
    }
}
