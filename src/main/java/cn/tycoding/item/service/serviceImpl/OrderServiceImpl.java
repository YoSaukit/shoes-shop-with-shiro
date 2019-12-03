package cn.tycoding.item.service.serviceImpl;

import cn.tycoding.common.service.impl.BaseServiceImpl;
import cn.tycoding.item.controller.Model.CartModel;
import cn.tycoding.item.mapper.ItemMapper;
import cn.tycoding.item.mapper.system.OrderDetailMapper;
import cn.tycoding.item.mapper.system.OrderMapper;
import cn.tycoding.item.mapper.system.OrderTempMapper;
import cn.tycoding.item.service.OrderService;
import cn.tycoding.system.entity.*;
import cn.tycoding.system.mapper.UserRoleMapper;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

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
            Order order = new Order(nums,sum,payMode,remark,memberId,address);
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

}
