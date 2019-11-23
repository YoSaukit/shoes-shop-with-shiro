package cn.tycoding.system.entity;

import java.util.Date;
import javax.persistence.*;

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
    private Integer sum;

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

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return time
     */
    public Date getTime() {
        return time;
    }

    /**
     * @param time
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * 获取件数
     *
     * @return nums - 件数
     */
    public Integer getNums() {
        return nums;
    }

    /**
     * 设置件数
     *
     * @param nums 件数
     */
    public void setNums(Integer nums) {
        this.nums = nums;
    }

    /**
     * 获取总金额
     *
     * @return sum - 总金额
     */
    public Integer getSum() {
        return sum;
    }

    /**
     * 设置总金额
     *
     * @param sum 总金额
     */
    public void setSum(Integer sum) {
        this.sum = sum;
    }

    /**
     * 获取支付方式
     *
     * @return pay_mode - 支付方式
     */
    public Integer getPayMode() {
        return payMode;
    }

    /**
     * 设置支付方式
     *
     * @param payMode 支付方式
     */
    public void setPayMode(Integer payMode) {
        this.payMode = payMode;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 获取会员号
     *
     * @return member_id - 会员号
     */
    public Integer getMemberId() {
        return memberId;
    }

    /**
     * 设置会员号
     *
     * @param memberId 会员号
     */
    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }
}