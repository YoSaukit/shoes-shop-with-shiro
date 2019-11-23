// Vue实例
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
        tree: [], //Menu菜单的Tree集合
        info: JSON.parse(window.localStorage.getItem("info")), //从localStorage中获取登录用户数据
        defaultActive: '品牌新闻',
        newsList: [],
        //模态框状态标识
        dialogVisible: false,
        dialogTitle: '',
        dialogNewsVisible: false,
        news: {
            title: '',
            time: '',
            content: '',
        },
        dialogSaveTitle: '',
        dialogSaveVisible: false,
        form: {
            id: null,
            title: '',
            content: '',
            picture: '',
        },
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
        window.onload = function() {
            app.changeDiv();
        };
        window.onresize = function() {
            app.changeDiv();
        };
        this.init(); //初始化
        this.search();
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
                let $this = response.body;
            if ($this.code === 200) {
                this.tree = $this.data;
            }
        })
        },
        search(){
            this.loading = true;
            this.$http.get(api.shop.news.list).then(response => {
                this.newsList = response.body.data;
            this.loading = false;
        })
        },
        // 修改密码
        updatePass(form) {
            this.$refs[form].validate((valid) => {
                if (valid) {
                    this.$http.get(api.common.updatePassword(this.newpass.password)).then(response => {
                        window.location.href = '/logout';
                })
                }
            })
        },
        //详细信息
        detail(id) {
            this.dialogTitle = '查看新闻';
            this.$http.get(api.shop.news.findById(id)).then(response => {
                let $this = response.body;
            this.news = $this.data;
        })
            this.dialogNewsVisible = true;
        },
        //触发关闭按钮
        handleClose() {
            this.dialogNewsVisible = false; //关闭模态框
        },
        handleClose() {
            this.dialogVisible = false; //关闭模态框
        },
        //触发保存按钮：添加、更新
        handleSave(id) {
            this.clearForm();

            if (id == null) {
                this.dialogSaveTitle = '新增新闻'
            } else {
                this.dialogSaveTitle = '修改新闻';
                this.$http.get(api.shop.news.findById(id)).then(response => {
                    let $this = response.body;
                this.form = $this.data;
            })
            }
            this.dialogSaveVisible = true;
        },
        clearForm() {
            if (this.$refs.form !== undefined) {
                this.$refs.form.resetFields();
            }
            this.form.title = '';
            this.form.content = '';
            this.form.picture = '';

        },
        //保存
        save(form) {
            this.$refs[form].validate((valid) => {
                if (valid) {
                    this.dialogSaveVisible = false;
                    if (this.form.id == null || this.form.id === 0) {
                        //添加
                        this.$http.post(api.shop.news.add, JSON.stringify(this.form)).then(response => {
                            if (response.body.code === 200) {
                            this._notify(response.body.msg, 'success')
                        } else {
                            this._notify(response.body.msg, 'error')
                        }
                        this.clearForm();
                        this.search()
                    })
                    } else {
                        //修改
                        this.$http.post(api.shop.news.update, JSON.stringify(this.form)).then(response => {
                            if (response.body.code === 200) {
                            this._notify(response.body.msg, 'success')
                        } else {
                            this._notify(response.body.msg, 'error')
                        }
                        this.clearForm();
                        this.search()
                    })
                    }
                } else {
                    return false;
        }
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
