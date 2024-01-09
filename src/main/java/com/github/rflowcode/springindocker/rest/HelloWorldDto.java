package com.github.rflowcode.springindocker.rest;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
class HelloWorldDto {
    private Integer randomNumber;
    private LocalDateTime now;
    private UUID uuid;
}
