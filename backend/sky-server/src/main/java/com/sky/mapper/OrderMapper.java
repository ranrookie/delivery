package com.sky.mapper;

import com.github.pagehelper.Page;
import com.sky.dto.GoodsSalesDTO;
import com.sky.dto.OrdersPageQueryDTO;
import com.sky.entity.Orders;
import com.sky.vo.OrderOverViewVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Mapper
public interface OrderMapper {

    /**
     * 插入订单
     * @param orders
     */
    void insert(Orders orders);

    /**
     * 查询历史订单
     * @param ordersPageQueryDTO
     * @return
     */
    Page<Orders> pageQuery(OrdersPageQueryDTO ordersPageQueryDTO);

    /**
     * 根据id查询订单
     * @param id
     * @return
     */
    @Select("select * from orders where id = #{id}")
    Orders queryOrderById(Long id);

    /**
     * 根据id集合批量查询订单
     * @param idSet
     * @return
     */
    List<Orders> queryOrdersByIdSet(Set<Long> idSet);

    /**
     * 更新订单
     * @param orders
     */
    void update(Orders orders);

    /**
     * 根据订单号查询订单
     * @param orderNumber
     * @return
     */
    @Select("select * from orders where number = #{orderNumber}")
    Orders queryOrderByNumber(String orderNumber);

    /**
     * 根据状态统计订单
     * @param status
     * @return
     */
    @Select("select count(id) from orders where status = #{status}")
    Integer countByStatus(Integer status);

    /**
     * 根据状态时间查询订单
     * @param status
     * @param time
     * @return
     */
    @Select("select * from orders where status = #{status} and order_time < #{time}")
    List<Orders> geytByStatusAndTime(Integer status, LocalDateTime time);

    /**
     * 根据动态调节统计营业额
     * @param map
     * @return
     */
    Double sumAmountByMap(Map map);

    /**
     * 动态条件统计订单
     * @param map
     * @return
     */
    Integer countByMap(Map map);

    /**
     * 统计销量
     * @param begin
     * @param end
     * @return
     */
    List<GoodsSalesDTO> getTop10(LocalDateTime begin,LocalDateTime end);
}
