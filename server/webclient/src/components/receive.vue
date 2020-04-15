<template>
<el-tabs v-model="tabActivedName" style="margin-left:30px;" closable @tab-remove="removeTab">

    <el-tab-pane v-for="(item) in receiveTabs" :key="item.name" :label="item.sender" :name="item.name" type="card">
        <transition name="el-zoom-in-center">
            <el-table height="450" :data="item.fileList" align="center" empty-text="No data" stripe @selection-change="handleSelectionChange" ref="multipleTable">
                <el-table-column>
                    <template slot="header">
                        <div style="display:flex;justify-content:space-around;">
                            <el-tag style="font-size:20px;" type="success">Sender: {{item.sender}}</el-tag>
                            <el-tag style="font-size:20px;">Time: {{formatTime(item.create_time)}}</el-tag>
                            <el-tag style="font-size:20px;" type="warning">Total: {{item.fileList.length}} file{{item.fileList.length > 1?'s':''}}</el-tag>
                        </div>
                    </template>

                    <el-table-column type="selection" width="80px" align="center"></el-table-column>
                    <el-table-column type="index" width="80px"></el-table-column>
                    <el-table-column prop="file_name" label="File Name" width="500px"></el-table-column>
                    <el-table-column prop="size" label="Size" width="150px" :formatter="dealSize"></el-table-column>
                    <el-table-column prop="type" label="Type" width="150px"></el-table-column>
                    <el-table-column width="180px" align="center">
                        <template slot-scope="">

                            <a href="#">
                                <el-button size="small" type="warning">&nbsp;Preview&nbsp;&nbsp;</el-button>
                            </a>
                        </template>
                    </el-table-column>

                </el-table-column>
            </el-table>
        </transition>
    </el-tab-pane>
    <el-row v-if="receiveTabs.length > 0" style="margin-top:30px">
        <el-button type="primary" @click="handleAcceptAll">Accept all</el-button>
        <el-button type="success" @click="handleAcceptSelected">Accept selected</el-button>
        <el-button type="danger" @click="handleRejectAll">Reject all</el-button>
    </el-row>
    <el-row v-if="receiveTabs.length == 0">
        <span>Nothing to do</span>
    </el-row>
</el-tabs>
</template>

<script>
export default {
    data() {
        return {
            tabActivedName: 0,
            receiveTabs: [],
            tableData: [],
            tabIndex: 1,
            multipleSelection: []
        };
    },
    methods: {
        /**
         * 获取当前用户所有未处理的分享
         */
        getUnhandledShare() {
            this.$http.get(`/share/receive/all/${sessionStorage.uid}`).then(res => {
                if (res.data.flag == 1) {
                    this.receiveTabs = res.data.msg;
                    this.receiveTabs.map((t, index) => {
                        t.name = index + '';
                    })
                }

            });
        },
        removeTab(targetName) {
            let tabs = this.receiveTabs;
            let activeName = this.tabActivedName;
            if (activeName === targetName) {
                tabs.forEach((tab, index) => {
                    if (tab.name === targetName) {
                        let nextTab = tabs[index - 1] || tabs[index + 1];
                        if (nextTab) {
                            activeName = nextTab.name;
                        }
                    }
                });
            }
            this.tabActivedName = activeName;
            this.receiveTabs = tabs.filter(tab => tab.name !== targetName);
            console.log(this.tabActivedName)
        },
        /**
         * 获得选中的数据(数组)
         */
        handleSelectionChange() {
            this.multipleSelection = this.$refs.multipleTable[this.tabActivedName].selection;
            console.log(this.multipleSelection);
            console.log(this.receiveTabs[this.tabActivedName].fileList)
        },
        dealSize(row, column) {
            let fileSize = (row.size / 1024).toFixed(2);
            return `${fileSize}kb`;
        },
        /**
         * 格式化时间
         */
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
        handleAccept(files, status) {
            let params = {
                fileList: files
            }
            this.$http.post(`/file/share/save/${sessionStorage.uid}`, params)
                .then(res => {
                    if (res.data.flag === 1) {
                        this.$message.success(res.data.msg);
                    } else {
                        this.$message.error(res.data.msg);
                    }
                }).then(() => {
                    //this.$root.$children[0].$children[0].$forceUpdate()
                    //let fileString = files.map(e => e.file_name).join(" , ");
                    this.changeStatus(status);
                })
        },
        handleAcceptSelected() {
            if (this.multipleSelection.length == this.receiveTabs[this.tabActivedName].fileList.length) {
                this.handleAcceptAll();
            } else {
                let fileString = this.multipleSelection.map(e => e.file_name).join(" , ")
                this.handleAccept(this.multipleSelection, fileString);
            }

        },
        handleAcceptAll() {
            console.log(this.receiveTabs)
            // console.log(this.receiveTabs[this.tabActivedName])
            this.handleAccept(this.receiveTabs[this.tabActivedName].fileList, "Accepted");
        },
        handleRejectAll() {
            this.changeStatus("Rejected");
        },
        changeStatus(status) {
            let params = {
                task_id: this.receiveTabs[this.tabActivedName].task_id,
                status: status
            }
            this.$http.put(`/share/handle`, params).then(res => {
                console.log(res.data.msg)
            }).then(() => {
                this.getUnhandledShare();
            }).then(() => {
                this.removeTab(this.tabActivedName);
            })
        }
    },
    mounted() {
        this.getUnhandledShare();

    }
};
</script>

<style scoped>

</style>
