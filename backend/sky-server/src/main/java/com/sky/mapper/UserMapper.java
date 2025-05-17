package com.sky.mapper;

import com.sky.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface UserMapper {
    /**
     * 根据openid查询用户
     * @param opneid
     * @return
     */
    @Select("select * from user where openid = #{openid}")
    User getByOpenid(String opneid);

    /**
     * 插入数据
     * @param user
     */
    void insert(User user);

    /**
     * 根据动态调节统计用户
     * @param map
     * @return
     */
    Integer sumUserByMap(Map map);
}
