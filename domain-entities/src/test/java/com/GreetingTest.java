package com;

import com.example.demo.Greeting;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class GreetingTest {
    @Test
    void shouldCreate() {
        Greeting result = Greeting.builder()
                .value("info")
                .build();

        assertThat(result).isNotNull();
    }
}