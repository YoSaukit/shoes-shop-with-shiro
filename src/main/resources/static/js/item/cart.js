let app = new Vue({
    el: '#app',
    data() {
        var validateName = (rule, value, callback) => {
            if (!value) {
                return callback(new Error('名称不能为空'))
            }
            this.$http.get(api.system.user.checkName(value, this.form.id)).then(response => {
                if (response.body.code !== 200) {
                callback(new Error(response.body.msg))
            } else {
                callback();
            }
        })
        }
        return {
            defaultActive: '商品列表',
            info: JSON.parse(window.localStorage.getItem("info")), //从localStorage中获取登录用户数据
            tree: '', //菜单Tree
            list: [], //用户列表数据
            searchEntity: {}, //查询实体类
            loading: true,
            //模态框状态标识
            dialogVisible: false,
            dialogBuyVisible: false,
            avatarDialog: false,
            avatarList: [],
            order: {
                id: '',
                itemId: '',
                title: '',
                picture: '',
                color: '',
                size: '',
                price: '',
                num: ''
            },
            form: {
                remark:'',
                address: '',
            },
            buyEntity: {},
            orderList: [],
            options: [{
                value: '1',
                label: '银行卡',
            },{
                value: '2',
                label: '支付宝',
            },{
                value: '3',
                label: '微信',
            },{
                value: '4',
                label: '他人代付',
            }],
            payMode:'',
            //分页选项
            pageConf: {
                //设置一些初始值(会被覆盖)
                pageCode: 1, //当前页
                pageSize: 10, //每页显示的记录数
                totalPage: 12, //总记录数
                pageOption: [10, 10, 20], //分页选项
            },
            selectIds: [], //Table选中行ID
            checkForm: {
                username: [{ validator: validateName, trigger: 'blur' }]
            },
            loading: true,
            mobileStatus: false, //是否是移动端
            sidebarStatus: true, //侧边栏状态，true：打开，false：关闭
            sidebarFlag: ' openSidebar ', //侧边栏标志
            newpass: {
                password: ''
            }
        }
    },
    created() {
        window.onload = function () {
            app.changeDiv();
        };
        window.onresize = function () {
            app.changeDiv();
        };

        this.init(); //初始化
        this.search(this.pageConf.pageCode, this.pageConf.pageSize);
    },
    mounted() {
        this.$refs.loader.style.display = 'none';
    },
    methods: {
        _notify(message, type) {
            this.$message({
                message: message,
                type: type
            })
        },
        /**
         * 初始化
         */
        init() {
            //获取Tree
            this.$http.get(api.common.tree(this.info.username)).then(response => {
                if (response.body.code === 200) {
                this.tree = response.body.data;
            }
        })
        },
        //修改密码
        updatePass(form) {
            this.$refs[form].validate((valid) => {
                if (valid) {
                    this.$http.get(api.common.updatePassword(this.newpass.password)).then(response => {
                        window.location.href = '/logout';
                })
                }
            })
        },

        //获取购物车列表
        search(pageCode, pageSize) {
            this.loading = true;
            this.searchEntity.mumberId = this.info.id;
            this.$http.post(api.order.cart.list(pageCode, pageSize),JSON.stringify({memberId:this.info.id})).then(response => {
                this.list = response.body.data.rows;
            this.pageConf.totalPage = response.body.data.total;
            this.loading = false;
        })
        },

        //pageSize改变时触发的函数
        handleSizeChange(val) {
            this.search(this.pageConf.pageCode, val);
        },
        //当前页改变时触发的函数
        handleCurrentChange(val) {
            this.pageConf.pageCode = val; //为了保证刷新列表后页面还是在当前页，而不是跳转到第一页
            this.search(val, this.pageConf.pageSize);
        },

        //触发关闭按钮
        handleClose() {
            this.dialogSaveVisible = false; //关闭模态框
        },

        //Table选中触发事件
        selectChange(val) {
            this.selectIds = [];
            val.forEach(row => {
                this.selectIds.push(row.id)
        })
        },
        buy(id) {
            if (id != undefined) {
                this.selectIds = [id];
            }
            this.$http.post(api.order.cart.findByIds,JSON.stringify(this.selectIds)).then(response =>{
                this.orderList = response.body.data;
            })
            this.dialogBuyVisible = true;
        },
        commit() {
            this.buyEntity.orderList = this.orderList;
            this.buyEntity.memberId = this.info.id;
            this.buyEntity.address = this.form.address;
            this.buyEntity.remark = this.form.remark;
            this.buyEntity.payMode = this.payMode;
            this.$http.post(api.order.cart.buy, JSON.stringify(this.buyEntity)).then(response => {
                if (response.body.code === 200) {
                this._notify('购买成功', 'success')
                this.dialogBuyVisible = false;
            } else {
                this._notify(response.body.msg, 'error')
            }
        })
        },
        //触发删除按钮
        handleDelete(id) {
            if (id != undefined) {
                this.selectIds = [id];
            }
            this.$confirm('你确定删除此商品？是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                this.$http.post(api.order.cart.delete, JSON.stringify(this.selectIds)).then(response => {
                if (response.body.code === 200) {
                this._notify('删除成功', 'success')
            } else {
                this._notify(response.body.msg, 'error')
            }
            this.$refs.table.clearSelection();
            this.selectIds = [];
            this.search(this.pageConf.pageCode, this.pageConf.pageSize)
        })
        }).catch(() => {
                this._notify('已取消删除', 'info')
        })
        },


        /**
         * 监听窗口改变UI样式（区别PC和Phone）
         */
        changeDiv() {
            let isMobile = this.isMobile();
            if (isMobile) {
                //手机访问
                this.sidebarFlag = ' hideSidebar mobile ';
                this.sidebarStatus = false;
                this.mobileStatus = true;
            } else {
                this.sidebarFlag = ' openSidebar';
                this.sidebarStatus = true;
                this.mobileStatus = false;
            }
        },
        isMobile() {
            let rect = body.getBoundingClientRect();
            return rect.width - RATIO < WIDTH
        },
        handleSidebar() {
            if (this.sidebarStatus) {
                this.sidebarFlag = ' hideSidebar ';
                this.sidebarStatus = false;

            } else {
                this.sidebarFlag = ' openSidebar ';
                this.sidebarStatus = true;
            }
            let isMobile = this.isMobile();
            if (isMobile) {
                this.sidebarFlag += ' mobile ';
                this.mobileStatus = true;
            }
        },
        //蒙版
        drawerClick() {
            this.sidebarStatus = false;
            this.sidebarFlag = ' hideSidebar mobile '
        }
    },
});
