package io.github.monkeydatabase.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderTest {
    public static void main(String[] args) {
        String password = "123456";
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = bCryptPasswordEncoder.encode(password);

        System.out.println("raw password: " + password);
        System.out.println("encoded password: " + encodedPassword);
        System.out.println("whether match: " + bCryptPasswordEncoder.matches(password, encodedPassword));
    }
}
