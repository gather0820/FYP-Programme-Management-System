<template>
  <el-upload
    ref="upload"
    class="upload"
    drag
    multiple
    :file-list="fileList"
    :before-upload="beforeUpload"
    action="http://localhost:8081/file/add"
    :data="userInfo"
    :on-success="dealSuccess"
    :on-error="dealError"
  >
    <i class="el-icon-upload"></i>
    <div class="el-upload__text">
      You can drag files here, or
      <em>click to upload</em>
    </div>
  </el-upload>
</template>
<script>
export default {
  data() {
    return {
      userInfo: {
        uid: sessionStorage.getItem("uid")
      },
      fileList: [],
      fileData: []
    };
  },
  methods: {
    getAllFileData() {
      let params = {
        uid: sessionStorage.getItem("uid")
      };
      this.$http
        .post("/file/list", params)
        .then(res => {
          if (res.data.code === 0) {
            this.$message.error(res.data.msg);
          } else {
            this.fileData = res.data;
          }
        })
        .then(() => {
          this.reorganizeData();
        })
        .catch(err => {
          console.log(err);
        });
    },

    getFreeSpace() {
      //用户的总容量 Total capacity of users
      let diskSpace = 1024 * 1024 * 1024 * 5;
      let datas = this.fileData;
      //已用容量 Used capacity
      let spaceUsage = 0; 
      datas.forEach(e => {
       let size = parseInt(e.size);
       spaceUsage += size;
      });
      return diskSpace - spaceUsage;
    },

    dealSuccess() {
      this.$message.success("Uploaded success!");
    },
    dealError() {
      this.$message.error("Please try again...");
    },

    //对上传文件的限制 Restrictions on uploading files
    beforeUpload(file) {
      String.prototype.endWith = function(endStr) {
        var d = this.length - endStr.length;
        return d >= 0 && this.lastIndexOf(endStr) == d;
      };

      //限制单文件大小2GB Limit single file size to 2GB
      let limit = 1024*1024*1024*2;
      if(file.size > limit ){
        this.$message.error('Each Files should be no bigger then 2GB !')
        return false;
      }
      //如果文件大小大于剩余空间,禁止上传 If the file size is larger than the remaining space, the upload is prohibited
      if(file.size > this.getFreeSpace()){
        this.$message.error('Your storage space is full! ')
        return false;
      }

      //禁止上传exe Prevent viruses and disable exe uploads
      if (file.name.endWith(".exe")) {
        this.$message.error("Please do not upload '.exe' files for security");
        return false;
      }
    }
  },
  mounted(){
    this.getAllFileData();
  }
};
</script>
<style scoped>
.upload {
  margin-top: 50px;
}
</style>
