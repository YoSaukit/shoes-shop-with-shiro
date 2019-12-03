package cn.tycoding.system.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import javax.persistence.*;

@Data
@ToString
@Table(name = "tb_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

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

    public Order() {
    }

    public Order(Integer nums, Double sum, Integer payMode, String remark, Integer memberId, String address) {
        this.nums = nums;
        this.sum = sum;
        this.payMode = payMode;
        this.remark = remark;
        this.memberId = memberId;
        this.address = address;
    }
}