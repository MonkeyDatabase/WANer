package io.github.monkeydatabase.northoperator.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserBasicInformationDTO {
    private String username;

    private String password;

    private Boolean status;

    private List<String> roles;

    private List<String> apis;
}
