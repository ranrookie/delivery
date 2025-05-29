package com.sky.controller.admin;

import com.sky.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

@RestController("adminShopController")
@RequestMapping("/admin/shop")
@Api(tags = "店铺相关接口")
@Slf4j
public class ShopController {
    public static final String KEY = "SHOP_STATUS";

    private final RedisTemplate<String,Object> jdkRedisTemplate;

    @Autowired
    public ShopController(RedisTemplate<String,Object> jdkRedisTemplate) {
        this.jdkRedisTemplate = jdkRedisTemplate;
    }

    /**
     *
     * @param status 0为打烊，1为营业
     * @return Result.success()
     */
    @PutMapping("/{status}")
    @ApiOperation("设置店铺的营业状态")
    public Result<Object> setStatus(@PathVariable Integer status){
        log.info("设置店铺的营业状态为：{}",status == 1 ? "营业中": "打烊中");
        jdkRedisTemplate.opsForValue().set(KEY,status);
        return Result.success();
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
