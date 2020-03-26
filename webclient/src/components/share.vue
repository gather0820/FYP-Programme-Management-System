<template>
<div>
    <el-container>
        <el-aside class="share-aside" width="450px">
            <span>To share files, input your friend' s username</span>
            <el-row type="flex">
                <el-col :span="16" justify="center">
                     <el-input v-model="input"></el-input>
                     <el-button type="primary"  class="send" @click="handleSend">Send </el-button>
                </el-col>
            </el-row>
        </el-aside>
        <el-main class="share-main">
            <el-table class="list" stripe height="500" :data="tableData" :header-cell-style="{background:'#d0f1f6',color:'#606276','text-align':'center'}" :cell-style="{'text-align':'center'}" :style="labelStyle">
                <el-table-column type="selection"></el-table-column>
                <el-table-column type="index" width="80px"></el-table-column>
                <el-table-column prop="file_name" label="File Name" width="350px"></el-table-column>
                <el-table-column prop="size" label="Size" width="200px" :formatter="dealSize"></el-table-column>

                <el-table-column prop="type" label="Type" width="180px"></el-table-column>

            </el-table>
        </el-main>
    </el-container>
</div>
</template>

<script>
export default {
    data() {
        return {
            tableData: [],
            labelStyle: {},
            input:""
        };
    },
    methods: {
        dealSize(row, column) {
            let fileSize = (row.size / 1024).toFixed(2);
            return `${fileSize}kb`;
        },
        getFileList() {
            let params = {
                uid: sessionStorage.getItem("uid")
            };
            this.$http
                .post("/file/list", params)
                .then(res => {
                    if (res.data.code === 0) {
                        this.$message.error(res.data.msg);
                    } else {
                        this.tableData = res.data;
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        },
        handleSend(){
            console.log("OJBK")

        }
    },
    mounted() {
        this.getFileList();
        console.log("share!!!")
    }
}
</script>

<style>
.share-main {
    padding-top: 0;
    padding-right: 0;
    margin-right: 0;
}

.share-aside {
    text-align: left;
    line-height: 50px;
    padding-top: 20px;
    padding-left: 40px;
}
.send{
    margin-top: 25px;
    margin-left: 90px;
}
</style>
