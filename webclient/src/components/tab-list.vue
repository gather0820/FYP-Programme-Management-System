<template>
<div class="show">
    <base-header></base-header>
    <el-tabs v-model="tabActivedName" tab-position="left" type="card" class="tab" @tab-click="handleClick">

        <el-tab-pane class="tab-panes" v-for="(item, index) in componentList" :key="index" :label="item.tabLabel" :name="item.tabName">
            <el-badge slot="label" value="new" v-if="item.tabLabel=='Receive'">Receive</el-badge>
            <component :is="item.compoName" v-if="tabActivedName===item.tabName"></component>
        </el-tab-pane>
        <!-- <el-tab-pane >
            <el-badge slot="label" value="12">分享</el-badge>
        </el-tab-pane> -->
        
    </el-tabs>
</div>
</template>

<script>
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
                    tabName:'fifth',
                    compoName:'receive',
                    tabLabel:'Receive'
                }
            ]
        }
    },
    methods: {
        handleClick(tab, event) {
            console.log(tab, event)
        }
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
