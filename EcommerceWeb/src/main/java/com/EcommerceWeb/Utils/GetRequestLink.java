package com.EcommerceWeb.Utils;

import javax.servlet.http.HttpServletRequest;

public class GetRequestLink {
    public static String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}
