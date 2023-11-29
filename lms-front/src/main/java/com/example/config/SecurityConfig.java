package com.example.config;

import com.example.filter.JwtAuthenticationTokenFilter;
import com.example.handler.security.AccessDeniedHandlerImpl;
import com.example.handler.security.AuthenticationEntryPointImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    // 白名单放行
    public static final List<String> WHITE_LIST = List.of("/user/login");
    public static final List<String> DOC_WHITE_LIST = List.of("/swagger-ui.html", "/swagger-ui/**", "/v3/api-docs/**", "/doc.html", "/webjars/**", "doc.html#/**");
    public static final List<String> POST_WHITE_LIST = List.of("/user");
    @Autowired
    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;
    @Autowired
    AccessDeniedHandlerImpl accessDeniedHandler;
    @Autowired
    AuthenticationEntryPointImpl authenticationEntryPoint;


    /**
     * 加密方式
     */
    @Bean
    public BCryptPasswordEncoder PasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 认证管理器，登录的时候参数会传给 authenticationManager
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 关闭csrf
                .csrf(csrf -> csrf.disable())
                // 允许跨域
                // .cors().and()
                // 不通过Session获取SecurityContext
                .sessionManagement(sess -> sess.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                                .requestMatchers(WHITE_LIST.toArray(new String[0])).anonymous()
                                .requestMatchers(HttpMethod.GET, DOC_WHITE_LIST.toArray(new String[0])).permitAll()
                                .requestMatchers(HttpMethod.POST, POST_WHITE_LIST.toArray(new String[0])).permitAll()
                                .anyRequest().authenticated()
                                // .anyRequest().permitAll()
                );
        // 配置异常处理器
        http.exceptionHandling(auth -> auth.authenticationEntryPoint(authenticationEntryPoint)
                .accessDeniedHandler(accessDeniedHandler)
        );
        // 用来关闭springSecurity默认的logout接口，避免发生冲突
        http.logout(logout -> logout.disable());
        http.addFilterBefore(jwtAuthenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }
}
