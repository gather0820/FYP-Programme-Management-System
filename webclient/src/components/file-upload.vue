<template>
  <el-upload 
    class="upload"
    drag
    multiple
    
    action="http://localhost:8081/file/add"
    :data="userInfo"
    :on-success="dealSuccess"
    :on-error="dealError">
    <i class="el-icon-upload"></i>
    <div class="el-upload__text">You can drag files here, or <em>click to upload</em></div>
  </el-upload>
</template>
<script>
export default {
  data () {
    return {
      userInfo: {
        uid: sessionStorage.getItem('uid')
      }
    }
  },
  methods: {
    dealSuccess () {
      this.$message.success('Uploaded successfully!')
    },
    dealError () {
      this.$message.error('Failed!try again!')
    }
  }
}
</script>
<style scoped>
.upload{
  margin-top: 50px;
}

</style>
