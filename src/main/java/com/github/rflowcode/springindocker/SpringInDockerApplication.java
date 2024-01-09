package com.github.rflowcode.springindocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;

@SpringBootApplication
public class SpringInDockerApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(SpringInDockerApplication.class);
        application.addListeners(new ApplicationPidFileWriter());
        application.run(args);
    }

}
