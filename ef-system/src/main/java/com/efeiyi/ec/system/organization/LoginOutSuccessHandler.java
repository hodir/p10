package com.efeiyi.ec.system.organization;


import com.efeiyi.ec.organization.model.MyUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hean on 2014/8/4.
 */
public class LoginOutSuccessHandler extends
        SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {


    @Override
    public void onLogoutSuccess
            (HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {


        response.sendRedirect(request.getContextPath() + "/pc/login.do");
        super.onLogoutSuccess(request, response, authentication);
    }
}

