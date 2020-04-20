<template>
<div>
    <el-container>
        <el-aside class="share-aside" width="450px">
            <span>To share files, input your friend' s username</span>
            <el-row type="flex">
                <el-col :span="16" justify="center">
                    <el-input v-model="receiver"></el-input>
                    <!-- <el-button type="primary" class="send" @click="handleCheck">Check</el-button> -->
                    <el-button type="primary" class="send" @click="handleSend">Send</el-button>
                </el-col>
            </el-row>
        </el-aside>
        <el-main class="share-main">
            <el-table ref="multipleTable" empty-text="No data" @selection-change="handleSelectionChange" class="list" stripe height="500" :data="tableData.filter(data =>  !search || data.file_name.toLowerCase().includes(search.toLowerCase()))" :header-cell-style="{background:'#d0f1f6',color:'#606276','text-align':'center'}" :cell-style="{'text-align':'center'}" :style="labelStyle">
                <el-table-column type="selection"></el-table-column>
                <el-table-column type="index" width="80px"></el-table-column>
                <el-table-column prop="file_name" label="File Name" width="350px"></el-table-column>
                <el-table-column prop="size" label="Size" width="100px" :formatter="dealSize"></el-table-column>
                <el-table-column prop="type" label="Type" width="100px"></el-table-column>
                <el-table-column>
                    <template slot="header">
                        <el-input v-model="search" placeholder="Search file" style="width:100%">
                            <i slot="prefix" style="margin-left:10px;" class="el-input__icon el-icon-search"></i>
                        </el-input>
                    </template>
                </el-table-column>
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
            search: "",
            labelStyle: {},
            receiver: "",
            rid: "",
            multipleSelection: [] //多选中的数据
        };
    },
    methods: {
        /**
         * 获得选中的数据(数组)
         */
        handleSelectionChange() {
            this.multipleSelection = this.$refs.multipleTable.selection;
        },
        dealSize(row, column) {
            let fileSize = (row.size / 1024).toFixed(2);
            if (fileSize >= 1024) {
                fileSize = (fileSize / 1024).toFixed(2)
                return `${fileSize}MB`;
            }
            return `${fileSize}KB`;
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
        /**
         *
         */
        getReceiverId() {
            this.$http
                .get(`/user/id/${this.receiver}`)
                .then(res => {
                    if (res.data.flag === 1) {
                        //this.$message.success(res.data.rid.toString());
                        this.rid = res.data.rid;
                        //sessionStorage.setItem('rid', this.id);
                    } else {
                        this.$message.error(res.data.info);
                        this.receiver = "";
                    }
                })
                .then(() => {
                    if (this.receiver != "") {
                        this.handleShare();
                    }
                });
        },

        /**
         * 获取已经选择的文件id数组
         */
        getSharedFileId() {
            let arr = this.multipleSelection.map(e => e.id);
            return arr;
        },
        handleCheck() {
            if (!this.receiver) {
                this.$message.error("Input a Receiver");
            } else {
                //this.getReceiverId();
                this.getReceiverId();
                //this.$message.success(this.receiverId);
            }
        },

        /**
         * 处理按下send按钮
         */
        handleSend() {
            if (!this.receiver) {
                this.$message.error("Input a Receiver");
            } else {
                if (this.getSharedFileId().length != 0) {
                    this.getReceiverId();
                } else {
                    this.$message.error("Choose at least one file!");
                }

                //this.handleShare();
            }
        },
        handleShare() {
            let params = {
                senderId: sessionStorage.getItem("uid"),
                receiverId: this.rid,
                fileIdList: this.getSharedFileId().join(",")
            };
            this.$http
                .post("/share", params)
                .then(res => {
                    if (res.data.flag == 1) {
                        this.$message.success(res.data.msg);
                    } else {
                        this.$message.error(res.data.msg);
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        }
    },
    mounted() {
        this.getFileList();
    }
};
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

.send {
    margin-top: 25px;
    margin-left: 90px;
}
</style>
