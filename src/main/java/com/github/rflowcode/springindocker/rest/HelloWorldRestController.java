package com.github.rflowcode.springindocker.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.UUID;

@RestController
@RequestMapping("${openapi.oblivionPortal.base-path:/rest}")
class HelloWorldRestController {

    @RequestMapping(method = RequestMethod.GET, value = "/hello-world", produces = "application/json")
    Mono<ResponseEntity<HelloWorldDto>> get() {
        return Mono.fromSupplier(SecureRandom::new)
                .map(secureRandom -> HelloWorldDto.builder()
                        .randomNumber(secureRandom.nextInt())
                        .now(LocalDateTime.now())
                        .uuid(UUID.randomUUID())
                        .build())
                .map(ResponseEntity::ok);
    }
}
