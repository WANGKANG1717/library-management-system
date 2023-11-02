package com.example.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    @Bean
    public OpenAPI springShopOpenAPI() {
        return new OpenAPI()
                .info(new Info().title("前端接口文档")
                        .description("前端")
                        .version("1.0.0")
                        // .license(new License().name("Apache 2.0").url("http://springdoc.org")))
                        .license(new License().name("WANGKANG").url("https://121.41.110.43")))
                .externalDocs(new ExternalDocumentation()
                        .description("外部文档")
                        .url("https://springdoc.org/"));
    }
}