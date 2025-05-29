package com.sky.controller.admin;

import com.sky.dto.DishDTO;
import com.sky.dto.DishPageQueryDTO;
import com.sky.entity.Dish;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.DishService;
import com.sky.vo.DishVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/admin/dish")
@Api(tags = "菜品相关接口")
@Slf4j
public class DishController {
    private final DishService dishService;
    private final RedisTemplate<String,Object> jdkRedisTemplate;

    @Autowired
    public DishController(DishService dishService, RedisTemplate<String,Object> jdkRedisTemplate) {
        this.dishService = dishService;
        this.jdkRedisTemplate = jdkRedisTemplate;
    }
    /**
     * 添加菜品
     * @param dishDTO 前端传入菜品数据
     * @return Result.success
     */
    @PostMapping
    @ApiOperation("添加菜品")
    public Result<T> addDish(@RequestBody DishDTO dishDTO) {
        log.info("添加菜品：{}", dishDTO);
        dishService.addDish(dishDTO);
        return Result.success();
    }

    /**
     * 菜品分页查询
     * @param dishPageQueryDTO 传入查询条件
     * @return Result.success(pageResult)
     */
    @GetMapping("/page")
    @ApiOperation("菜品分页查询")
    public Result<PageResult> getDishPage(DishPageQueryDTO dishPageQueryDTO) {
        log.info("菜品分页查询...");
        PageResult pageResult = dishService.pageQuery(dishPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 删除菜品
     * @param ids 传入删除菜品id数组
     * @return Result.success()
     */
    @DeleteMapping
    @ApiOperation("菜品批量删除")
    public Result<T> deleteDish(@RequestParam List<Long> ids) {
        log.info("菜品批量删除...");
        dishService.deleteBatch(ids);
        cleanCache("dish_*");
        return Result.success();
    }

    /**
     * 根据id查询菜品
     * @param id 菜品id
     * @return Result.success(dishVO)
     */
    @GetMapping("/{id}")
    @ApiOperation("根据id查询菜品")
    public Result<DishVO> getDishById(@PathVariable Long id) {
        log.info("根据id查询菜品");
        DishVO dishVO = dishService.getByIdWithFlavor(id);
        return Result.success(dishVO);
    }

    /**
     * 修改菜品
     * @param dishDTO 修改的具体数据
     * @return Result.success()
     */
    @PutMapping
    @ApiOperation("修改菜品")
    public Result<T> updateDish(@RequestBody DishDTO dishDTO) {
        log.info("修改菜品");
        dishService.updateDish(dishDTO);
        cleanCache("dish_*");
        return Result.success();
    }

    /**
     * 菜品起售停售
     * @param status 菜品状态
     * @param id 菜品id
     * @return Result.success()
     */
    @PostMapping("/status/{status}")
    @ApiOperation("菜品起售,停售")
    public Result<T> startOrStop(@PathVariable Integer status,Long id) {
        log.info("菜品起售,停售...");
        dishService.startOrStop(status,id);
        cleanCache("dish_*");
        return Result.success();
    }

    /**
     * 根据分类id查询菜品
     * @param categoryId 菜品类别id
     * @return Result.success(dishes)
     */

    @GetMapping("/list")
    @ApiOperation("根据分类id查询菜品")
    public Result<List<Dish>> queryDishByCategoryId(@RequestParam Long categoryId) {
        log.info("根据分类id{}查询菜品..",categoryId);
        List<Dish> dishes = dishService.queryDishByCategoryId(categoryId);
        return Result.success(dishes);
    }

    /**
     * 一个清除redis菜品缓存的复用函数
     * @param pattern 需要匹配的key
     */
    @SuppressWarnings("all")
    private void cleanCache(String pattern){
        Set<String> keys = jdkRedisTemplate.keys(pattern);
        if(keys!=null){
            jdkRedisTemplate.delete(keys);
        }
    }
}
