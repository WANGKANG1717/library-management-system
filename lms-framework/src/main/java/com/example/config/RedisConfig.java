package com.example.config;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
    /**
     * redis的序列化配置
     */
    @Resource
    private RedisConnectionFactory redisConnectionFactory;

    @Bean
    public RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        FastJson2RedisSerializer<Object> fastJson2RedisSerializer = new FastJson2RedisSerializer<>(Object.class);

        StringRedisSerializer serializer = new StringRedisSerializer();
        template.setConnectionFactory(redisConnectionFactory);
        // 设置key序列化方式string
        template.setKeySerializer(serializer);
        // 设置hash的key的序列化方式
        template.setHashKeySerializer(serializer);
        // 设置value的序列化方式json
        template.setValueSerializer(fastJson2RedisSerializer);
        // 设置hash的value的序列化方式
        template.setHashValueSerializer(fastJson2RedisSerializer);
        // 使配置生效
        template.afterPropertiesSet();

        return template;
    }
}