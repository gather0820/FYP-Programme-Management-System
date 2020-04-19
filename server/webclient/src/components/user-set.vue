<template>
<div>
    <div>
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="change-password">
            <el-form-item label="Old:" prop="oldPass">
                <el-input type="password" v-model="ruleForm.oldPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="New:" prop="newPass">
                <el-input type="password" v-model="ruleForm.newPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="Confirm:" prop="checkNewPass">
                <el-input type="password" v-model="ruleForm.checkNewPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">Submit</el-button>
                <el-button @click="resetForm('ruleForm')">Reset</el-button>
            </el-form-item>
        </el-form>

    </div>

</div>
</template>

<script>
export default {
    data() {
        //  验证原密码
        let validateOldPass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('Input your old password!'))
            } else {
                if (this.ruleForm.oldPass !== '') {
                    this.$refs.ruleForm.validateField('newPass')
                }
                callback()
            }
        }
        //  验证新密码
        var validateNewPass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('Input a new password!'))
            } else if (value === this.ruleForm.oldPass) {
                callback(new Error('Your input a new password!'))
            } else {
                callback()
            }
        }
        //  验证再次输入密码

        var validateCheckNewPass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('input again to confirm!'))
            } else if (value !== this.ruleForm.newPass) {
                callback(new Error('The two passwords you typed do not match!!'))
            } else {
                callback()
            }
        }

        return {
            ruleForm: {
                oldPass: '',
                newPass: '',
                checkNewPass: ''
            },
            rules: {
                oldPass: [{
                    validator: validateOldPass,
                    trigger: 'blur'
                }],
                newPass: [{
                    validator: validateNewPass,
                    trigger: 'blur'
                }],
                checkNewPass: [{
                    validator: validateCheckNewPass,
                    trigger: 'blur'
                }]
            }
        }
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate(valid => {
                if (valid) {
                    let params = {
                        oldPassword: this.ruleForm.oldPass,
                        newPassword: this.ruleForm.newPass
                    }
                    this.$http
                        .put(`/user/update/${sessionStorage.uid}`, params)
                        .then(res => {
                            if(res.data.flag == 1){
                                this.$message.success('Password changed successfully! Please log in again')
                            sessionStorage.clear()
                            setTimeout(() => {
                                this.$router.push({
                                    path: '/'
                                })
                            }, 1500)
                            }else{
                                this.$message.error('Failed to modify, the original password is wrong!')
                            }
                            
                        })
                        .catch(err => {
                            console.log('Error=>', err)
                        })
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
        },
        resetForm(formName) {
            this.$refs[formName].resetFields()
        }
    }
}
</script>

<style scoped>
.change-password {
    width: 400px;
    margin: auto;
}
</style>
