package io.github.monkeydatabase.controller;

import io.github.monkeydatabase.service.OpsUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OpsUserController {

    final OpsUserService opsUserService;

    public OpsUserController(OpsUserService opsUserService) {
        this.opsUserService = opsUserService;
    }

    @GetMapping("/user/{id}")
    @ResponseBody
    public Object getUserByID(@PathVariable Integer id){
        System.out.println("test:"+id);
        return opsUserService.getUser(id);
    }
}
