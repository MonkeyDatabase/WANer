package io.github.monkeydatabase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DeviceController {

    @GetMapping("/device")
    @ResponseBody
    public String getDevices() {
        return "设备管理";
    }
}
