<!-- 承载所有功能的父组件，其他都是子组件 .
跳转到此页面，AJAX从后台请求各种数据，例如文件列表-->
<!--The parent component that carries all the functionality, the others are children . 
Jump to this page, AJAX requests various data from the background, such as file lists-->
<template>
<div class="show" ref="show">
    <base-header></base-header>
    <el-tabs v-model="tabActivedName" type="card"  class="tab" @tab-click="cancelBadge">
        <el-tab-pane class="tab-panes" v-for="(item, index) in componentList" :key="index" :label="item.tabLabel" :name="item.tabName">
            <span class="badge_span" ref="badge" slot="label" v-if="item.tabLabel=='Receive'&& showBadge">

                <el-badge class="badge" value="new">Receive</el-badge>
            </span>
            <component :is="item.compoName" v-if="tabActivedName===item.tabName"></component>
        </el-tab-pane>
    </el-tabs>
</div>
</template>

<script>
//把其他组件import进tab-list这个页面
//Import other components into the tab-list page.
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
         *  进入页面时,向后台发起请求.查询是否有当前用户未处理的分享，如果有则改变showBadge的值
         *  When you enter the page, make a request to the background.
         *  Query if there are any unprocessed shares by the current user, and if so, change the value of showBadge
         */
        hasNew() {
            this.$http.get(`/share/new/${sessionStorage.uid}`).then(res => {
                if (res.data.flag == 1) {
                    this.showBadge = res.data.data.length;
                    //When the view is updated manually, the Receive tab shows the New
                    //手动更新视图，时Receive标签显示New
                    this.$children[1].$children[0].$forceUpdate()
                }
            });
        }
    },
    mounted() {
        this.hasNew();
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.tab {
    padding: 20px 20px ;
    font-size: 20px;

}
.tab-panes{
    line-height: 30px;
    position: relative;
}
.badge_span{
    top: 0px;
    z-index: 2000;
}
.badge{
    position: relative;
    top: 1px;
    left: -10%;
    z-index: 2000;
}
</style>
