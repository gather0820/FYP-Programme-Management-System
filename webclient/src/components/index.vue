<template>
<div class="index">
    <div class="title">SDMS</div>
    <div class="label">A Document Managerment System for Students</div>
    <div class="btn">
        <el-button type="danger" @click="dialogFormVisible = true">Log in / Register</el-button>
    </div>
    <el-dialog title="Log in" :visible.sync="dialogFormVisible" width="400px" :close-on-click-modal="false">
        <el-form :model="form">
            <el-form-item label="User" :label-width="formLabelWidth">
                <el-input v-model="form.username" autocomplete="off" placeholder="Pleace input your E-mail address"></el-input>
            </el-form-item>
            <el-form-item label="Password" :label-width="formLabelWidth">
                <el-input v-model="form.password" autocomplete="off" type="password"></el-input>
            </el-form-item>
            <el-form-item label="Check Code" :label-width="formLabelWidth">
                <el-input v-model="form.checkcode" autocomplete="off" placeholder="Click the CODE to refresh"></el-input>
                <div v-html="svgData" @click="refreshCheckCode" style="padding-top: 20px;"></div>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="signIn">Log in</el-button>
            <el-button @click="tosignUp">Register</el-button>
        </div>
    </el-dialog>
    <el-dialog title="Register" :visible.sync="dialog2FormVisible" width="520px" :close-on-click-modal="false">
        <el-form :model="form">
            <el-form-item label="User name" :label-width="formLabelWidth">
                <el-input v-model="form.username" autocomplete="off" placeholder="Pleace input your E-mail address" :disabled="emailDisabled">
                    <el-button slot="append" type="success" @click="sendVerifyCode" :disabled="emailDisabled">Verify</el-button>
                </el-input>
            </el-form-item>
            <el-form-item label="Verification Code" :label-width="formLabelWidth">
                <el-input v-model="form.vercode" autocomplete="off" placeholder="Click 'Verify' and check your E-mail"></el-input>
            </el-form-item>
            <el-form-item label="Password" :label-width="formLabelWidth">
                <el-input v-model="form.password" autocomplete="off" type="password"></el-input>
            </el-form-item>
            <el-form-item label="Confirm password" :label-width="formLabelWidth">
                <el-input v-model="form.confirmPassword" autocomplete="off" type="password"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="signUp">Register</el-button>
        </div>
    </el-dialog>
</div>
</template>

<script>
import CryptoJS from "crypto-js";
export default {
    name: "index",
    data() {
        return {
            dialogFormVisible: false,
            dialog2FormVisible: false,
            form: {
                username: "",
                password: "",
                checkcode: "",
                vercode: "",
                confirmPassword: ""
            },
            formLabelWidth: "140px",
            emailDisabled: false,
            svgData: 'width="200"'
        };
    },
    methods: {
        /**
         * 2020-4-11校验密码格式
         */
        checkPasswordStrength(password) {
            const pass = password;

            const reg_length = /^.{8,18}$/;//校验的长度8-18 Length of checksum 8-18
            const reg_num = /[0-9]/im; //判断是否有数字 Determine if there are numbers.
            const reg_az = /[a-z]/; //判断是否有小写字母 Determine if there are lowercase letters.
            const reg_AZ = /[A-Z]/; //判断是否有大写字母 Determine if there are capital letters.

            let resultMsg = {};
            if (pass == '' || pass == undefined || pass == null) {
                resultMsg.message = 'Please input password!';
                resultMsg.result = false;
            }else if(!reg_length.test(pass)){
                resultMsg.message = 'Password is too short or too long!';
                resultMsg.result = false;
            }else if (!reg_num.test(pass) || !reg_az.test(pass) || !reg_AZ.test(pass)){
                resultMsg.message = 'Your password should contain numbers,upper and lower case letters';
                resultMsg.result = false;
            }else{
                resultMsg.result = true;
            }

            return resultMsg;

        },
        // 登录
        signIn() {
            this.dialogFormVisible = false;
            this.$http
                .post("/user/validate", {
                    username: this.form.username,
                    password: this.encrypt(this.form.password),
                    checkcode: this.form.checkcode
                })
                .then(res => {
                    if (res.data.flag === 0) {
                        this.$message.error(res.data.msg + "!!");
                        this.getCheckCode();
                    } else {
                        this.$message.success(res.data.msg);
                        sessionStorage.setItem("uid", res.data.uid);
                        sessionStorage.setItem("username", res.data.username);
                        this.hasNew();
                        //  跳转到其他页面 Jump to this page
                        this.$router.push("tab-list");
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        },

        async hasNew() {
            let res = await this.$http.get(`/share/new/${sessionStorage.uid}`);

        },

        tosignUp() {
            this.dialogFormVisible = false;
            this.dialog2FormVisible = true;
        },
        sendVerifyCode() {
            let email = this.form.username;
            var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!reg.test(email)) {
                this.$message.error("Username should be an e-mail address!");
                return;
            }
            this.$http
                .post("/user/verify", {
                    username: email
                })
                .then(res => {
                    if (res.data.flag == 0) {
                        this.$message.error(res.data.info);
                    } else {
                        this.$message.success(res.data.info);
                        this.emailDisabled = true;
                    }
                });
        },
        //  注册
        signUp() {
            const msg = this.checkPasswordStrength(this.form.password);
            if(!msg.result){
                this.$message.error(msg.message);
                return;
            }
            if (this.form.confirmPassword != this.form.password) {
                this.$message.error("Two passwords you input should be identical!");
                return;
            }
            //this.dialogFormVisible = false;
            this.$http
                .post("/user/add", {
                    vercode: this.form.vercode,
                    username: this.form.username,
                    password: this.encrypt(this.form.password)
                })
                .then(res => {
                    if (res.data.flag === 0) {
                        this.$message.error(res.data.msg);
                    } else {
                        this.$message.success(res.data.msg);
                        setTimeout(() => {
                            this.dialog2FormVisible = false;
                            this.dialogFormVisible = true;
                        }, 2000);
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        },
        //通过AJAX请求验证码
        getCheckCode() {
            this.$http.get("/user/checkcode").then(res => {
                this.svgData = res.data;
            });
        },
        refreshCheckCode() {
            this.getCheckCode();
        },

        /**
         * 密码加密，防止抓包 Password encryption to prevent packet capture
         */
        encrypt(word, keyStr) {
            keyStr = keyStr ? keyStr : "sdms123456SDMS654321";
            let key = CryptoJS.enc.Utf8.parse(keyStr);
            let srcs = CryptoJS.enc.Utf8.parse(word);
            let encrypted = CryptoJS.AES.encrypt(srcs, key, {
                mode: CryptoJS.mode.ECB,
                padding: CryptoJS.pad.Pkcs7
            });
            return encrypted.toString();
        }
    },
    //在此生命周期函数里调用，页面装在完成会自动调用
    //Called in this lifecycle function, the page is automatically called at completion.
    mounted() {
        this.hasNew();
        this.getCheckCode();
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.index {
    /** margin-top: 140px;*/

    height: 700px;
    text-align: center;
    background: url("/static/bg.png") center no-repeat;
}

.title {
    padding-top: 100px;
    font-size: 80px;
    font-weight: bolder;
}

.label {
    font-size: 40px;
    margin-top: 60px;
    margin-bottom: 40px;
    font-weight: bold;
}

.btn {
    margin-top: 10px;
}

.dialog-footer {
    text-align: center;
}
</style>
