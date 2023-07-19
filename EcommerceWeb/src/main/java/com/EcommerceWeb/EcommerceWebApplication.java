package com.EcommerceWeb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class EcommerceWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(EcommerceWebApplication.class, args);
    }

}
