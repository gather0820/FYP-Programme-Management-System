<template>
    <el-tabs  style="height: 500px;margin-left:30px;">
    <el-tab-pane label="Change password">
        <user-set></user-set>
    </el-tab-pane>
    <el-tab-pane label="Storage space">Storage space</el-tab-pane>
    <el-tab-pane label="XXX">XXX</el-tab-pane>
    <el-tab-pane label="XXX">XXX</el-tab-pane>
  </el-tabs>
</template>

<script>
import userSet from './user-set';
export default {
    name:"settings",
    components: {
        userSet,
    },
    data(){
        return{
            
        };
    },

    
}
</script>