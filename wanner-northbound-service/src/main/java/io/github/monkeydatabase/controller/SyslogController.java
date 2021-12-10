package io.github.monkeydatabase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SyslogController {

    @GetMapping("/syslog")
    @ResponseBody
    public String sysLog() {
        return "日志管理";
    }
}
