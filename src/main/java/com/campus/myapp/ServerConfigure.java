package com.campus.myapp;

import java.util.Arrays;
import java.util.List;

import org.springframework.boot.web.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer, WebServerFactoryCustomizer<TomcatServletWebServerFactory>{
	
	private static final List<String> URL_PATERRNS = Arrays.asList(
				"/gather/gatherView","/gather/gatherWrite","/gather/writeOk", 
				"/gather/gatherEdit", "/car/carWrite", "/car/carWriteOk",
				"/car/carEdit", "/car/replyWrite", "/supply/supplyWrite",
				"/supply/supplyWriteOk", "/supply/supplyEdit", "/supply/supplyEditOk",
				"/supply/supplyChat", "/supply/chatSend", "/supply/chatDel", "/supply/moveChat"
			);
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATERRNS);
	}

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/ckUpload/**")
				.addResourceLocations("/ckUpload/");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		return commonsMultipartResolver;
	}
	
	public void customize(TomcatServletWebServerFactory factory) {
	    factory.addConnectorCustomizers((TomcatConnectorCustomizer)
	        connector -> connector.setAttribute("relaxedQueryChars", "<>[\\]^`{|}"));
	}
	

}
