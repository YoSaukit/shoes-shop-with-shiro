package cn.shoes.system.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_order")
public class Order {
    @Id
    private Integer id;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    /**
     * 件数
     */
    private Integer nums;

    /**
     * 总金额
     */
    private Double sum;

    /**
     * 支付方式
     */
    @Column(name = "pay_mode")
    private Integer payMode;

    /**
     * 备注
     */
    private String remark;

    /**
     * 会员号
     */
    @Column(name = "member_id")
    private Integer memberId;

    private String address;

    private Integer deliver;

    @Transient
    private List<OrderDetail> orderDetails;

    public Order() {
    }

    public Order(Integer id, Integer deliver) {
        this.id = id;
        this.deliver = deliver;
    }

    public Order(Integer id, Integer nums, Double sum, Integer payMode, String remark, Integer memberId, String address, Integer deliver) {
        this.id = id;
        this.nums = nums;
        this.sum = sum;
        this.payMode = payMode;
        this.remark = remark;
        this.memberId = memberId;
        this.address = address;
        this.deliver = deliver;
    }

    public Order(Integer id, Date time, Integer nums, Double sum, Integer payMode, String remark, Integer memberId, String address, Integer deliver, List<OrderDetail> orderDetails) {
        this.id = id;
        this.time = time;
        this.nums = nums;
        this.sum = sum;
        this.payMode = payMode;
        this.remark = remark;
        this.memberId = memberId;
        this.address = address;
        this.deliver = deliver;
        this.orderDetails = orderDetails;
    }
}