<!-- 承载所有功能的父组件，其他都是子组件 .跳转到此页面，AJAX从后台请求各种数据，例如文件列表-->
<template>
<div class="show" ref="show">
    <base-header></base-header>
    <el-tabs v-model="tabActivedName" type="card" class="tab" @tab-click="cancelBadge">
        <el-tab-pane class="tab-panes" v-for="(item, index) in componentList" :key="index" :label="item.tabLabel" :name="item.tabName">
            <span ref="badge" slot="label" v-if="item.tabLabel=='Receive'&& showBadge">

                <el-badge >Receive</el-badge>
            </span>
            <component :is="item.compoName" v-if="tabActivedName===item.tabName"></component>
        </el-tab-pane>
    </el-tabs>
</div>
</template>

<script>
//把其他组件import进tab-list这个页面
import BaseHeader from '../layout/header';
import BaseFooter from '../layout/footer';
import UploadFile from './file-upload';
import FileList from './file-list';
import Settings from './settings';
import userSet from './user-set';
import Share from './share';
import Receive from './receive'
export default {
    name: 'show',
    components: {
        BaseHeader,
        BaseFooter,
        UploadFile,
        FileList,
        userSet,
        Share,
        Receive,
        Settings
    },


    data() {
        return {
            tabActivedName: 'second',
            componentList: [{
                    tabName: 'first',
                    compoName: 'upload-file',
                    tabLabel: 'Upload'
                },
                {
                    tabName: 'second',
                    compoName: 'file-list',
                    tabLabel: 'Files'
                },
                {
                    tabName: 'third',
                    compoName: 'settings',
                    tabLabel: 'Settings'
                },
                {
                    tabName: 'fourth',
                    compoName: 'share',
                    tabLabel: 'Share'
                },
                {
                    tabName: 'fifth',
                    compoName: 'receive',
                    tabLabel: 'Receive'
                }
            ],
            showBadge: 0,
        }
    },
    methods: {
        cancelBadge(){
            if(this.tabActivedName === 'fifth'){
                this.showBadge = 0
            }
        },

        /**
         * 进入页面时,向后台发起请求,查询是否有当前用户未处理的分享，如果有则改变showBadge的值
         */
        hasNew() {
            this.$http.get(`/share/new/${sessionStorage.uid}`).then(res => {
                if (res.data.flag == 1) {
                    this.showBadge = res.data.data.length;
                    this.$children[1].$children[0].$forceUpdate()//手动更新视图，时Receive标签显示New
                }
            });
        }
    },
    mounted() {
        this.hasNew();
        console.log(this.$children[1].$children[0])
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style>
.tab {
    padding: 30px 40px;
}

.el-tabs__item {
    font-size: 18px;

    height: 55px;
}

.el-tabs--left .el-tabs__item.is-left {
    text-align: justify;
    line-height: 55px;

}
</style>
