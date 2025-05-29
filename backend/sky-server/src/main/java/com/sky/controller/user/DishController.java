package com.sky.controller.user;

import com.sky.constant.StatusConstant;
import com.sky.entity.Dish;
import com.sky.result.Result;
import com.sky.service.DishService;
import com.sky.vo.DishVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController("userDishController")
@RequestMapping("/user/dish")
@Slf4j
@Api(tags = "C端-菜品浏览接口")
public class DishController {
    private final DishService dishService;
    private final RedisTemplate<String,Object> jdkRedisTemplate;

    @Autowired
    public DishController(DishService dishService, RedisTemplate<String,Object> jdkRedisTemplate) {
        this.dishService = dishService;
        this.jdkRedisTemplate = jdkRedisTemplate;
    }

    /**
     * 根据分类id查询菜品
     *
     * @param categoryId 菜品分类id
     * @return Result.success(list)
     */
    @GetMapping("/list")
    @ApiOperation("根据分类id查询菜品")
    public Result<List<DishVO>> list(Long categoryId) {
        String key = "dish_" + categoryId;
        @SuppressWarnings("unchecked")
        List<DishVO> list1 = (List<DishVO>)jdkRedisTemplate.opsForValue().get(key);
        if(list1 != null&&!list1.isEmpty()){
            return Result.success(list1);
        }
        Dish dish = new Dish();
        dish.setCategoryId(categoryId);
        dish.setStatus(StatusConstant.ENABLE);//查询起售中的菜品

        List<DishVO> list = dishService.listWithFlavor(dish);
        jdkRedisTemplate.opsForValue().set(key,list);
        return Result.success(list);
    }

}
