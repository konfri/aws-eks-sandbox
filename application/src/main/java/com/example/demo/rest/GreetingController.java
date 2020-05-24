package com.example.demo.rest;

import java.util.concurrent.atomic.AtomicLong;

import com.Greeting;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    @GetMapping("/")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
        return Greeting.builder()
                .value("Hello World")
                .build();
    }
}