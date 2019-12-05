package cn.shoes.item.service.serviceImpl;

import cn.shoes.common.service.impl.BaseServiceImpl;
import cn.shoes.item.controller.Model.CartModel;
import cn.shoes.item.mapper.ItemMapper;
import cn.shoes.item.mapper.system.OrderDetailMapper;
import cn.shoes.item.mapper.system.OrderMapper;
import cn.shoes.item.mapper.system.OrderTempMapper;
import cn.shoes.item.service.OrderService;
import cn.shoes.system.entity.*;
import cn.shoes.system.mapper.UserRoleMapper;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl extends BaseServiceImpl<OrderTemp> implements OrderService {

    @Autowired
    private OrderTempMapper orderTempMapper;

    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<CartModel> cartList(Integer memberId) {
        Example example = new Example(OrderTemp.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andCondition("member_id=",memberId);
        List<OrderTemp> orderTempList = this.selectByExample(example);
        List<CartModel> cartModelList = new ArrayList<>();
        for (OrderTemp ot : orderTempList) {
            Item item = itemMapper.selectByPrimaryKey(ot.getItemId());
            CartModel cartModel;
            if (!isMember(memberId)){
                cartModel = new CartModel(ot.getId(),item.getId(),item.getPicture(),item.getTitle(),item.getPrice(),ot.getColor(),ot.getSize(),ot.getNum(),item.getPrice());
            }else{
                cartModel = new CartModel(ot.getId(),item.getId(),item.getPicture(),item.getTitle(),item.getPrice(),ot.getColor(),ot.getSize(),ot.getNum(),item.getPrice()*0.88);

            }
            cartModelList.add(cartModel);
        }
        return cartModelList;
    }

    @Override
    public void add(OrderTemp orderTemp) {
        Example example = new Example(OrderTemp.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andCondition("member_id=",orderTemp.getMemberId());
        criteria.andCondition("item_id=",orderTemp.getItemId());
        criteria.andCondition("color=",orderTemp.getColor());
        criteria.andCondition("size=",orderTemp.getSize());
        List<OrderTemp> orderTempList = orderTempMapper.selectByExample(example);
        if (orderTempList!=null&&orderTempList.size()!=0){
            orderTemp.setNum(orderTempList.get(0).getNum()+1);
            orderTemp.setId(orderTempList.get(0).getId());
            orderTempMapper.updateByPrimaryKey(orderTemp);
        }else{
            orderTempMapper.insert(orderTemp);
        }
    }

    @Override
    public void delete(List<Integer> ids) {
        this.batchDeleteItem(ids, "id", OrderTemp.class);
    }


    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public void buy(Map<String, Object> param) {
        int memberId = Integer.parseInt(param.get("memberId").toString());
        String address = param.get("address").toString();
        String remark = param.get("remark").toString();
        int payMode = Integer.parseInt(param.get("payMode").toString());
        if (param.get("orderList")!=null){
            JSONArray jsonArray = JSONArray.parseArray(JSONObject.toJSONString(param.get("orderList")));
            List<CartModel> cartModelList = JSONArray.parseArray(jsonArray.toString(),CartModel.class);
            int nums = 0;
            double sum = 0.0;
            for (CartModel cartModel : cartModelList) {
                nums+=cartModel.getNum();
                sum+=cartModel.getPrice();
            }
            Order order = new Order(generateOrderNo(),nums,sum,payMode,remark,memberId,address,0);
            orderMapper.insert(order);
            for (CartModel cartModel :
                    cartModelList) {
                OrderDetail orderDetail = new OrderDetail(order.getId(),cartModel.getItemId(),cartModel.getColor(),cartModel.getSize(),
                        cartModel.getPrice(), cartModel.getNum(),0.0,cartModel.getDiscount());
                orderDetailMapper.insert(orderDetail);
                //从购物车中删除
                orderTempMapper.deleteByPrimaryKey(cartModel.getId());
            }
        }
        //是否满800变成会员身份
        Example example = new Example(Order.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andCondition("member_id=",memberId);
        List<Order> orderList = orderMapper.selectByExample(example);
        int total = 0;
        for (Order order :
                orderList) {
            total += order.getSum();
        }
        if (total >= 800) {
            UserRole ur = new UserRole(memberId,7);
            Example ex = new Example(UserRole.class);
            Example.Criteria cr = ex.createCriteria();
            cr.andCondition("user_id=",memberId);
            userRoleMapper.updateByExampleSelective(ur,ex);
        }
    }


    @Override
    public List<CartModel> findByIds(List<Integer> ids) {
        List<CartModel> cartModelList = new ArrayList<>();
        for (Integer id :
                ids) {
           OrderTemp ot = orderTempMapper.selectByPrimaryKey(id);
            Item item = itemMapper.selectByPrimaryKey(ot.getItemId());
            CartModel cartModel;
            if (!isMember(ot.getMemberId())){
                cartModel = new CartModel(ot.getId(),item.getId(),item.getPicture(),item.getTitle(),item.getPrice(),ot.getColor(),ot.getSize(),ot.getNum(),item.getPrice());
            }else{
                cartModel = new CartModel(ot.getId(),item.getId(),item.getPicture(),item.getTitle(),item.getPrice(),ot.getColor(),ot.getSize(),ot.getNum(),item.getPrice()*0.88);
            }
            cartModelList.add(cartModel);
        }
        return cartModelList;
    }

    @Override
    public List<Order> orderList(Integer memberId) {
        Example userRoleExample = new Example(UserRole.class);
        Example.Criteria urCriteria = userRoleExample.createCriteria();
        urCriteria.andCondition("user_id=",memberId);
        List<UserRole> userRoleList = userRoleMapper.selectByExample(userRoleExample);
        List<Order> orderList;
        if (userRoleList.get(0).getRoleId()==8){
            orderList = orderMapper.selectAll();
        }else{
            Example example = new Example(Order.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andCondition("member_id=",memberId);
            example.setOrderByClause("time desc");
            orderList = orderMapper.selectByExample(example);
        }
        if (orderList==null||orderList.size()==0)return new ArrayList<>();
        for (Order order :
                orderList) {
            Example example1 = new Example(OrderDetail.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andCondition("order_id=",order.getId());
            List<OrderDetail> orderDetailList = orderDetailMapper.selectByExample(example1);
            for (OrderDetail od :
                    orderDetailList) {
                Item item = itemMapper.selectByPrimaryKey(od.getItemId());
                od.setPicture(item.getPicture());
            }
            order.setOrderDetails(orderDetailList);
        }
        return orderList;
    }

    @Override
    public OrderDetail orderDetail(Integer id) {
        Example example = new Example(OrderDetail.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andCondition("order_id=",id);
        return orderDetailMapper.selectByExample(example).get(0);
    }

    @Override
    public void sent(List<Integer> ids) {
        for (Integer id :
                ids) {
            Order order = new Order(id,1);
            orderMapper.updateByPrimaryKeySelective(order);
        }
    }


    private boolean isMember(int memberId){
        Example example1 = new Example(UserRole.class);
        Example.Criteria criteria1 = example1.createCriteria();
        criteria1.andCondition("user_id=",memberId);
        List<UserRole> userRoleList = userRoleMapper.selectByExample(example1);
        if (userRoleList!=null&&userRoleList.get(0).getRoleId()==7){
            return true;
        }else{
            return false;
        }
    }
    private Integer generateOrderNo(){
        //订单号10位,前6位时间
        StringBuilder sb = new StringBuilder();
        LocalDateTime now = LocalDateTime.now();
        String nowDate = now.format(DateTimeFormatter.ISO_DATE).replace("-","").substring(2);
        sb.append(nowDate);
        int count = orderMapper.dailyCount(now.format(DateTimeFormatter.ISO_DATE)+"%");
        StringBuilder stringBuilder = new StringBuilder(String.valueOf(count));
        while(stringBuilder.length()<4){
            stringBuilder.insert(0,"0");
        }
        return Integer.parseInt(sb.append(stringBuilder).toString());

    }

}
