package com.cdap.mock.mq.produce;

import com.base.web.util.JsonUtils;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbRechargeEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserLoginEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbWithdrawalEntity;
import com.cdap.mock.config.properties.DataRabbitMqProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class RabbitProduceComponent {

    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    private DataRabbitMqProperties rabbitMqProperties;

    /**
     * 1. 发送 注册用户
     * @param userEntityList
     */
    public void sendTbUserMessage(List<TbUserEntity> userEntityList){
        String exchange = rabbitMqProperties.getCommonExchange();
        String routingKey = rabbitMqProperties.getUserRegistryRoutingkey();
        int tmp = 0;
        for (TbUserEntity tb : userEntityList) {
            tmp ++;
            rabbitTemplate.convertAndSend(exchange, routingKey, JsonUtils.serializable(tb));
        }
        log.info(userEntityList.size() + "-------tbUser save mq size:" + tmp);
    }

    /**
     * 2.发送 用户登录
     * @param userLoginList
     */
    public void sendTbUserLoginMessage(List<TbUserLoginEntity> userLoginList){
        String exchange = rabbitMqProperties.getCommonExchange();
        String routingKey = rabbitMqProperties.getUserLoginRoutingkey();
        int tmp = 0;
        for (TbUserLoginEntity tl : userLoginList) {
            tmp ++;
            rabbitTemplate.convertAndSend(exchange, routingKey, JsonUtils.serializable(tl));
        }
        log.info(userLoginList.size() + "-------tbLogin save mq size:" + tmp);
    }

    /**
     * 3.发送 用户充值数据
     * @param userRechargeList
     */
    public void sendTbUserRechargeMessage(List<TbRechargeEntity> userRechargeList){
        String exchange = rabbitMqProperties.getCommonExchange();
        String routingKey = rabbitMqProperties.getUserRechargeRoutingkey();
        int tmp = 0;
        for (TbRechargeEntity tr : userRechargeList) {
            tmp ++;
            rabbitTemplate.convertAndSend(exchange, routingKey, JsonUtils.serializable(tr));
        }
        log.info(userRechargeList.size() + "-------tbRecharge save mq size:" + tmp);
    }

    /**
     * 4. 发送 用户提现数据
     * @param userWithdrawalList
     */
    public void sendTbUserWithdrawalMessage(List<TbWithdrawalEntity> userWithdrawalList){
        String exchange = rabbitMqProperties.getCommonExchange();
        String routingKey = rabbitMqProperties.getUserWithdrawalRoutingkey();
        int tmp = 0;
        for (TbWithdrawalEntity tw : userWithdrawalList) {
            tmp ++;
            rabbitTemplate.convertAndSend(exchange, routingKey, JsonUtils.serializable(tw));
        }
        log.info(userWithdrawalList.size() + "-------tbWithdrawal save mq size:" + tmp);
    }
}
