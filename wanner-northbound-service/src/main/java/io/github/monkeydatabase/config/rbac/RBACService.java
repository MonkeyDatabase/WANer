package io.github.monkeydatabase.config.rbac;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component("rbac")
public class RBACService {
    public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
        Object principal = authentication.getPrincipal();

        if (principal instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) principal;
            SimpleGrantedAuthority grantedAuthority = new SimpleGrantedAuthority(request.getRequestURI());
            return userDetails.getAuthorities().contains(grantedAuthority);
        }

        return false;
    }
}
