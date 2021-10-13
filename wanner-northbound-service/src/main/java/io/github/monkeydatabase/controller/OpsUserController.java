package io.github.monkeydatabase.controller;

import io.github.monkeydatabase.billing.domain.OpsUserDO;
import io.github.monkeydatabase.service.OpsUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OpsUserController {
    @Autowired
    OpsUserService opsUserService;

    @GetMapping("/user/{id}")
    @ResponseBody
    public Object getUserByID(@PathVariable Integer id){
        System.out.println("test:"+id);
        return opsUserService.getUser(id);
    }
}