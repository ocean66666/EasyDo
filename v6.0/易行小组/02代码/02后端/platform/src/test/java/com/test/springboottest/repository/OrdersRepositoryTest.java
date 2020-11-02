package com.test.springboottest.repository;

import com.test.springboottest.entity.Orders;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class OrdersRepositoryTest {
    @Autowired
private OrderRepository orderRepository;
    @Test
    void insert(){
        Orders order=new Orders();
        order.setGoodname("小火车");
        order.setOwnername("张三");
        order.setBuyername("小黑");
        order.setPrice(80);
        order.setTime("上午");
        order.setPlace("学校");
        order.setState("进行");
        orderRepository.save(order);
    }
}