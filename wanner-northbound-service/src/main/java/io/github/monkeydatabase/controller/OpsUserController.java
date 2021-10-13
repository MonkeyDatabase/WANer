package io.github.monkeydatabase.controller;

import io.github.monkeydatabase.service.OpsUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class OpsUserController {

    final OpsUserService opsUserService;

    public OpsUserController(OpsUserService opsUserService) {
        this.opsUserService = opsUserService;
    }

    @GetMapping("/user/{id}")
    @ResponseBody
    public Object getUserByID(@PathVariable Integer id){
        Object o = opsUserService.getUser(id);
        log.info("request:{}, response:{}",id, o);
        return o;
    }
}
