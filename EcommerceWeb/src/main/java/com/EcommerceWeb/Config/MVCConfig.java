package com.EcommerceWeb.Config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin/css/**").addResourceLocations("classpath:/META-INF/admin/css/");
        registry.addResourceHandler("/admin/js/**").addResourceLocations("classpath:/META-INF/admin/js/");
        registry.addResourceHandler("/admin/plugins/**").addResourceLocations("classpath:/META-INF/admin/plugins/");
        registry.addResourceHandler("/admin/plugins/bootstrap/js/**").addResourceLocations("classpath:/META-INF/admin/plugins/bootstrap/js/");
        registry.addResourceHandler("/ckeditor/**").addResourceLocations("classpath:/META-INF/ckeditor/");
        registry.addResourceHandler("/paging/**").addResourceLocations("classpath:/META-INF/paging/");

        registry.addResourceHandler("/user/css/**").addResourceLocations("classpath:/META-INF/user/css/");
        registry.addResourceHandler("/user/img/**").addResourceLocations("classpath:/META-INF/user/img/");
        registry.addResourceHandler("/user/js/**").addResourceLocations("classpath:/META-INF/user/js/");
        registry.addResourceHandler("/user/lib/easing/**").addResourceLocations("classpath:/META-INF/user/lib/easing/");
        registry.addResourceHandler("/user/lib/owlcarousel/**").addResourceLocations("classpath:/META-INF/user/lib/owlcarousel/");
        registry.addResourceHandler("/user/lib/owlcarousel/assets/**").addResourceLocations("classpath:/META-INF/user/lib/owlcarousel/assets/");
    }

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration()
                .setMatchingStrategy(MatchingStrategies.STRICT)
                .setSkipNullEnabled(true);
        return modelMapper;
    }
}
