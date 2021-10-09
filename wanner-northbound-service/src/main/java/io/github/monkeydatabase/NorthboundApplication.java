package io.github.monkeydatabase;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class NorthboundApplication {
    public static void main(String[] args) {
        SpringApplication.run(NorthboundApplication.class, args);
    }
}
