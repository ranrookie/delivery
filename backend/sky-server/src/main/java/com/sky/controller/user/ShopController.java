package com.sky.controller.user;

import com.sky.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("userShopController")
@RequestMapping("/user/shop")
@Api(tags = "店铺相关接口")
@Slf4j
public class ShopController {
    public static final String KEY = "SHOP_STATUS";
    private final RedisTemplate<String,Object> jdkRedisTemplate;
    //构造器注入
    @Autowired
    public ShopController(RedisTemplate<String,Object> jdkRedisTemplate) {
        this.jdkRedisTemplate = jdkRedisTemplate;
    }

    /**
     * 查询店铺状态
     * @return Result.success(status)
     */
    @GetMapping("/status")
    @ApiOperation("查询店铺状态")
    public Result<Integer> getStatus(){
        Integer status = (Integer)jdkRedisTemplate.opsForValue().get(KEY);
        if(status != null){
            log.info("获取到店铺的营业状态为：{}",status == 1 ? "营业中" : "打烊中");
        }
        return  Result.success(status);
    }

}
