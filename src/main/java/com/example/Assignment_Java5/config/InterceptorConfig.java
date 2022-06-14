package com.example.Assignment_Java5.config;

import com.example.Assignment_Java5.interceptors.AuthInterceptors;
import com.example.Assignment_Java5.interceptors.UserInterceptors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    AuthInterceptors interceptor;

    @Autowired
    UserInterceptors userInterceptors;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor)
                .addPathPatterns("/admin/**");
        registry.addInterceptor(userInterceptors)
                .addPathPatterns("/home/info","/home/history/*")
                .excludePathPatterns("/home/index");
    }
}
