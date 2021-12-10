package io.github.monkeydatabase.config.rbac;

import io.github.monkeydatabase.config.rbac.domain.WanUserDetails;
import io.github.monkeydatabase.northoperator.NorthOperatorAuthService;
import io.github.monkeydatabase.northoperator.dto.UserBasicInformationDTO;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class WanUserDetailsService implements UserDetailsService {

    private final NorthOperatorAuthService authService;

    public WanUserDetailsService(NorthOperatorAuthService authService) {
        this.authService = authService;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        WanUserDetails userDetails = new WanUserDetails();

        UserBasicInformationDTO basicInfo = authService.getBasicInfoByUsername(username);

        if(basicInfo == null) {
            throw new UsernameNotFoundException("Username is not present");
        }

        userDetails.setUsername(username);
        userDetails.setPassword(basicInfo.getPassword());
        userDetails.setStatus(basicInfo.getStatus());

        List<String> authorities = basicInfo.getApis();
        List<String> roleAuthorities = basicInfo.getRoles().stream().map(r -> "ROLE_" + r).collect(Collectors.toList());

        authorities.addAll(roleAuthorities);
        userDetails.setAuthorities(AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(",", authorities)));
        return userDetails;
    }
}
