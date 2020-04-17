<template>
<div>
    <el-table class="list" empty-text="No data" stripe height="500" :data="tableData.filter(data =>  !search || data.file_name.toLowerCase().includes(search.toLowerCase()))" :header-cell-style="{background:'#d0f1f6',color:'#606276','text-align':'center'}" :cell-style="{'text-align':'center'}" :style="labelStyle" v-loading="tableData.length < 0" element-loading-text="Loading..." element-loading-spinner="el-icon-loading">
        <el-table-column type="index"></el-table-column>
        <el-table-column prop="file_name" label="File Name" width="250px"></el-table-column>
        <el-table-column prop="size" label="Size" width="180px" :formatter="dealSize"></el-table-column>
        <el-table-column prop="upload_time" label="Upload Date" width="180px" :formatter="dealTime"></el-table-column>
        <el-table-column prop="download" label="Download Times" width="180px"></el-table-column>
        <el-table-column prop="type" label="Type" width="180px"></el-table-column>
        <el-table-column>
            <template slot="header">
                <el-input v-model="search" placeholder="Search via file name..." style="width:60%">
                    <i slot="prefix" style="margin-left:10px;" class="el-input__icon el-icon-search"></i>
                </el-input>
            </template>
            <template slot-scope="scope">
                <a :href="getFile(scope.row)" :download="getRealName(scope.row)">
                    <el-button size="small" type="info" @click="handleDownload()">Download</el-button>
                </a>
                <a href="#">
                    <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">&nbsp;&nbsp;Delete&nbsp;</el-button>
                </a>
                <a href="#">
                    <el-button size="small" type="warning" @click="preview(scope.row)">&nbsp;Preview&nbsp;&nbsp;</el-button>
                </a>
            </template>
        </el-table-column>
    </el-table>

    <el-dialog :title="previewItem" :visible.sync="centerDialogVisible" width="45%" center top="1%" :close-on-click-modal="false">
        <div style="height:auto" v-loading="pdfURL == ''" element-loading-text="transcoding..." element-loading-spinner="el-icon-loading">
            <preview :url="pdfURL" v-if="centerDialogVisible" />

            <el-row>
                <!-- <el-col>{{currentPage}}/{{pageCount}}</el-col> -->
            </el-row>

            <el-row slot="footer" class="dialog-footer" style="text-align:center">
                <!-- <el-button @click="centerDialogVisible = false"></el-button> -->
                <el-button type="primary" @click="centerDialogVisible = false">OK</el-button>
            </el-row>
        </div>
    </el-dialog>
</div>
</template>

<script>
import Preview from './preview';
export default {
    components: {
        Preview
    },
    data() {
        return {
            // currentPage,
            // pageCount,
            previewItem: '',
            loading: true,
            search: '',
            tableData: [],
            labelStyle: {},
            centerDialogVisible: false,
            pdfURL: '',
        };
    },
    methods: {
        preview(row) {
            this.pdfURL = '';
            this.previewItem = row.fileName;
            this.centerDialogVisible = true;
            if (row.type == '.pdf') {
                this.pdfURL = `http://localhost:8081/file/download/${row.hash_name}/${row.id}`;
                //this.previewItem = row.fileName;
            } else {
                this.transcode(row.hash_name, row.type);
            }

        },
        transcode(hash_name, type) {
            let params = {
                hash_name,
                type
            }
            this.$http.post(`/file/transcode`, params).then(res => {
                    if (res.data.flag === 1) {
                        //this.pdfURL = res.data.url
                        //this.centerDialogVisible = true;
                        //setTimeout(()=>{
                        this.pdfURL = res.data.url
                        // },1)
                    }
                })

                //this.pdfURL = res.data.url

                .catch(err => {
                    console.log("Error=>", err);
                })
        },
        handleDelete(index, row) {
            this.$http
                .delete(`/file/delete/${row.hash_name}/${row.id}`)
                .then(res => {
                    this.$message.success(res.data.msg);
                    this.refreshFileList();
                })
                .catch(err => {
                    console.log("Error=>", err);
                });
        },
        handleDownload() {
            //this.getFile(data);
            setTimeout(() => {
                this.refreshFileList();
            }, 500);
        },
        refreshFileList() {
            this.getFileList();
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
        getFile(data) {
            let url = `http://localhost:8081/file/download/${data.hash_name}/${data.id}`;
            //this.$http.get(url);
            return url;
        },
        getRealName(data) {
            let realName = data.file_name + data.type;
        },
        dealSize(row, column) {
            let fileSize = (row.size / 1024).toFixed(2);
            return `${fileSize}kb`;
        },
        dealTime(row, column) {
            return this.formatTime(row.upload_time);
        },
        formatTime(value) {
            var date = new Date(value);
            var Y = date.getFullYear();
            var M =
                date.getMonth() + 1 < 10 ?
                `0${date.getMonth() + 1}` :
                date.getMonth() + 1;
            var D = date.getDate() < 10 ? `0${date.getDate()}` : date.getDate();
            var h = date.getHours() < 10 ? `0${date.getHours()}` : date.getHours();
            var m =
                date.getMinutes() < 10 ? `0${date.getMinutes()}` : date.getMinutes();
            var s =
                date.getSeconds() < 10 ? `0${date.getSeconds()}` : date.getSeconds();
            return `${Y}-${M}-${D} ${h}:${m}:${s}`;
        }
    },
    mounted() {
        this.getFileList();
    },
};
</script>

<style>
/* .list /deep/ .el-table__column{
    color: aqua;
  } */
</style>
