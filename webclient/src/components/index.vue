<template>
<div class="index">
    <div class="title">
        SDMS
    </div>
    <div class="label">
        A Document Managerment System for Students
    </div>
    <div class="btn">
        <el-button type="danger" @click="dialogFormVisible = true">Log in / Register</el-button>
    </div>
    <el-dialog title="Log in / Register" :visible.sync="dialogFormVisible" width="400px">
        <el-form :model="form">
            <el-form-item label="User" :label-width="formLabelWidth">
                <el-input v-model="form.username" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="Password" :label-width="formLabelWidth">
                <el-input v-model="form.password" autocomplete="off" type="password"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="signUp">Register</el-button>
            <el-button type="primary" @click="signIn">Log in</el-button>
        </div>
    </el-dialog>
</div>
</template>

<script>
export default {
    name: 'index',
    data() {
        return {
            dialogFormVisible: false,
            form: {
                username: '',
                password: ''
            },
            formLabelWidth: '120px'
        }
    },
    methods: {
        // 登录
        signIn() {
            this.dialogFormVisible = false
            this.$http
                .post('http://localhost:8081/user/validate', this.form)
                .then(res => {
                    if (res.data.flag === 0) {
                        this.$message.error(res.data.msg + '!!')
                    } else {
                        this.$message.success(res.data.msg)
                        sessionStorage.setItem('uid', res.data.uid)
                        sessionStorage.setItem('username', res.data.username)

                        //  跳转到其他页面
                        this.$router.push('tab-list')
                    }
                })
                .catch(err => {
                    console.log(err)
                })
        },
        //  注册
        signUp() {
            this.dialogFormVisible = false
            this.$http
                .post('http://localhost:8081/user/add', this.form)
                .then(res => {
                    if (res.data.flag === 0) {
                        this.$message.error(res.data.msg)
                    } else {
                        this.$message.success(res.data.msg)
                        this.$router.push('tab-list')
                    }
                })
                .catch(err => {
                    console.log(err)
                })
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.index {
    margin-top: 140px;

    height: 700px;
    text-align: center;
    background: url("/static/bg.png") center no-repeat;

}

.title {
    padding-top: 20px;
    font-size: 80px;
    font-weight: bolder;
}

.label {
    font-size: 40px;
    margin-top: 30px;
    margin-bottom: 20px;
    font-weight: bold;
}

.btn {
    margin-top: 10px;
}

.dialog-footer {
    text-align: center;
}
</style>
