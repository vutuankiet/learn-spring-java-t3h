package t3h.vn.k34_dl.config.authen;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import t3h.vn.k34_dl.entities.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthenticationSuccessHandlerCustom implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
//        SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = ((UserEntity)authentication.getPrincipal());
        if ("ADMIN".equalsIgnoreCase(userEntity.getRole())) {
            response.sendRedirect("/backend/user/list");
        } else {
            response.sendRedirect("/backend/user/create");
        }
    }
}
