package com.example.config;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONReader;
import com.alibaba.fastjson2.JSONWriter;
import com.alibaba.fastjson2.filter.Filter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import java.nio.charset.Charset;
import java.util.Objects;

@Slf4j
public class FastJson2RedisSerializer<T> implements RedisSerializer<T> {
    // 按需加上需要支持自动类型的类名前缀，范围越小越安全
    static final Filter AUTO_TYPE_FILTER = JSONReader.autoTypeFilter(
            "com.example.domain.entity.LoginUser"
    );

    private final Class<T> clazz;

    public FastJson2RedisSerializer(Class<T> clazz) {
        super();
        this.clazz = clazz;
    }

    @Override
    public byte[] serialize(T t) throws SerializationException {
        if (Objects.isNull(t)) {
            return new byte[0];
        }
        try {
            return JSON.toJSONBytes(t, JSONWriter.Feature.WriteClassName);
        } catch (Exception e) {
            log.error("Fastjson2 序列化错误：{}", e.getMessage());
            throw new SerializationException("无法序列化: " + e.getMessage(), e);
        }
    }

    @Override
    public T deserialize(byte[] bytes) throws SerializationException {
        if (ArrayUtils.isEmpty(bytes)) {
            return null;
        }
        try {
            return  JSON.parseObject(bytes, clazz, AUTO_TYPE_FILTER);
        } catch (Exception e) {
            log.error("Fastjson2 反序列化错误：{}", e.getMessage());
            throw new SerializationException("无法反序列化: " + e.getMessage(), e);
        }
    }
}
