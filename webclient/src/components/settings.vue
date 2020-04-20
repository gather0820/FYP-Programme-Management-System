<template>
<el-tabs style="height: 500px;margin-left:30px;" v-model="tabActivedName">
    <el-tab-pane v-for="(item, index) in componentList" :key="index" :label="item.tabLabel" :name="item.tabName">
        <component :is="item.compoName" v-if="tabActivedName===item.tabName"></component>
    </el-tab-pane>
</el-tabs>
</template>

<script>
import userSet from './user-set';
import storage from './storage';
export default {
    name: "settings",
    components: {
        userSet,
        storage
    },
    data() {
        return {
            tabActivedName: 'first',
            componentList: [{
                    tabName: 'first',
                    compoName: 'user-set',
                    tabLabel: 'Change Password'
                },
                {
                    tabName: 'second',
                    compoName: 'storage',
                    tabLabel: 'Storage Space'
                },
            ],
        };
    },

}
</script>
