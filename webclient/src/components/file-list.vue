<template>
<div>
    <el-table class="list" empty-text="No data" stripe height="500" :data="tableData.filter(data =>  !search || data.file_name.toLowerCase().includes(search.toLowerCase()))" :header-cell-style="{background:'#d0f1f6',color:'#606276','text-align':'center'}" :cell-style="{'text-align':'center'}" :style="labelStyle" v-loading="tableData.length < 0" element-loading-text="Loading..." element-loading-spinner="el-icon-loading" :default-sort = "{prop: 'upload_time', order: 'descending'}">
        <el-table-column type="index"></el-table-column>
        <el-table-column prop="file_name" label="File Name" width="250px"></el-table-column>
        <el-table-column prop="size" label="Size" width="180px" :formatter="dealSize" :sortable="true" :sort-method="sortBySize"></el-table-column>
        <el-table-column prop="upload_time" label="Upload Date" width="180px" :formatter="dealTime" sortable></el-table-column>
        <el-table-column prop="download" label="Download Times" width="180px" :sortable="true" :sort-method='sortByDownloadTimes'></el-table-column>
        <el-table-column prop="type" label="Type" width="180px"></el-table-column>
        <el-table-column>
            <template slot="header">
                <el-input v-model="search" placeholder="Search file" style="width:100%">
                    <i slot="prefix" class="el-input__icon el-icon-search"></i>
                </el-input>
            </template>
            <template slot-scope="scope">
                <a :href="getFile2(scope.row)">
                    <el-button size="small" type="info" @click="handleDownload(scope.row)">Download</el-button>
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

            <el-row slot="footer" class="dialog-footer" style="text-align:center">
                <!-- <el-button @click="centerDialogVisible = false"></el-button> -->
                <el-button type="primary" @click="centerDialogVisible = false">OK</el-button>
            </el-row>
        </div>
    </el-dialog>
    <el-dialog :visible.sync="chooseDownloadType" width="40%" top="10%" :close-on-click-modal="false" :before-close="handleClose">
        <div slot="title" style="padding-right:30px;padding-left:30px;">
            {{downloadItem.file_name}}
        </div>
        <span v-if="transcoding == false">Download it directly or trancode to PDF</span>
        <div v-if="transcoding == true && pdfURL == ''" v-loading="pdfURL == ''" element-loading-text="transcoding..." element-loading-spinner="el-icon-loading"></div>
        <el-row slot="footer" class="dialog-footer" style="text-align:center">
            <a :href="getOriginal(downloadItem)">
                <el-button @click="chooseDownloadType = false">Original</el-button>
            </a>
            <a href="#">
                <el-button type="primary" @click="getPDF(downloadItem)" v-if=" pdfURL == '' ">Convert to PDF</el-button>
            </a>
            <a :href="pdfURL" v-if="pdfURL!='' ">
                <el-button type="primary" @click="chooseDownloadType = false;transcoding = false">Download PDF</el-button>
            </a>
        </el-row>
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
            chooseDownloadType: false,
            pdfURL: '',
            downloadItem: "",
            transcoding: false,

            //2020-04-27 支持转pdf的文件
            convertible:['.doc','.docx','.ppt','.pptx','.md','.txt','.xls','.xlsx','.csv','.png','.jpg','.jpeg','.java','.js','.c','.cpp','.py','.go','.cs','.json']
        };
    },
    methods: {
        preview(row) {
            this.pdfURL = '';
            this.previewItem = row.fileName;
            this.centerDialogVisible = true;
            if (row.type == '.pdf') {
                this.pdfURL = `http://localhost:8081/file/download/${row.hash_name}/${row.file_name}/${row.id}`;
                //this.previewItem = row.fileName;
            } else {
                //2020-04-27 在格式列表里则转换，否则提升不支持预览
                if (this.convertible.includes(row.type)) {
                    this.transcode(row.hash_name, row.file_name, row.type);
                } else {
                    this.centerDialogVisible = false;
                    this.$message.info('Unsupported file');
                }
                
            }

        },
        transcode(hash_name, file_name, type) {
            let params = {
                hash_name,
                file_name,
                type
            }
            this.$http.post(`/file/transcode`, params).then(res => {
                    if (res.data.flag === 1) {

                        this.pdfURL = res.data.url
                        this.transcoding = false;

                        // this.pdfURL = res.data.url
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
        handleDownload(data) {
            this.pdfURL = '';
            this.transcoding = false;
            this.downloadItem = data;
            let typeList = ['.doc', '.docx', '.ppt', '.pptx','.xls','.xlsx'];
            if (typeList.includes(data.type)) {
                this.chooseDownloadType = true;
            }
            // setTimeout(() => {
            //     this.refreshFileList();
            // }, 1500);
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
        getOriginal(data) {
            let url = `http://localhost:8081/file/download/${data.hash_name}/${data.file_name}/${data.id}`;
            //this.$http.get(url);
            return url;
        },
        getPDF(data) {
            this.transcoding = true;
            this.transcode(data.hash_name, data.file_name, data.type);
            //this.$http.get(url);
            let url = this.pdfURL;
            // this.transcoding = false;
            //this.chooseDownloadType = false
            return url;
        },
        handleClose() {
            if (this.transcoding == true) {
                this.$message({
                    message: 'Transcoding, wait please',
                    type: 'warning'
                });
            } else {
                this.chooseDownloadType = false;
            }

        },
        getFile2(data) {
            let url = `http://localhost:8081/file/download/${data.hash_name}/${data.file_name}/${data.id}`;
            let pdfURL = '';
            let typeList = ['.doc', '.docx', '.ppt', '.pptx','.xls','.xlsx'];
            if (!typeList.includes(data.type)) {
                return url;
            }

        },
        getRealName(data) {
            let realName = data.file_name + data.type;
        },
        dealSize(row, column) {
            let fileSize = (row.size / 1024).toFixed(2);
            if (fileSize >= 1024) {
                fileSize = (fileSize / 1024).toFixed(2)
                return `${fileSize}MB`;
            }
            return `${fileSize}KB`;
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
        },
        sortBySize(a,b){
            //console.log(a,b)
            let num1 = parseInt(a.size);
            let num2 = parseInt(b.size);
            if (num1 > num2) {
                return -1;
            }else{
                return 1;
            }
        },
        sortByDownloadTimes(a,b){
            //console.log(a,b)
            let num1 = parseInt(a.download);
            let num2 = parseInt(b.download);
            if (num1 > num2) {
                return -1;
            }else{
                return 1;
            }
        },
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
