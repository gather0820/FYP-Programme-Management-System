<template>
  <div class="header">
    <div class="left">
      <div id="logo">
      </div>
    <div class="title">
      SDMS
      <span class="label">version.6</span>
    </div>
    </div>
    
    <div class="user">
      User: {{username}}&nbsp;&nbsp;
      <a href="#" @click="signOut">&nbsp;&nbsp;&nbsp;&nbsp;Log out</a>
    </div>
  </div>
</template>

<script>
export default {
  name: "base-header",
  data() {
    return {
      username: sessionStorage.getItem("username")
    };
  },
  methods: {
    signOut() {
      this.$router.push({ path: "/" });
      sessionStorage.clear();
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.left{
  width: 500px;
  padding: 0;
  margin-left: 20px;
}
#logo {
  background-image: url('../../static/logo.png');
  background-repeat:no-repeat;
  background-size: auto 100%;
  position: fixed;
  margin-bottom: 0em;
  width: 100px;
  height: 90px;

  margin-left: 20px;
}
.header {
  text-align: center;
  font-size: 18px;
  margin-top: 20px;
  box-shadow: 0 5px 15px -10px #ccc;
  padding-bottom: 20px;
}
.title {
  font-size: 34px;
  height: 80px;
  text-align: left;
  
  margin-left: 130px;
  padding-bottom: 0;
  line-height: 130px;
}
.label {
  font-size: 25px;
}
.user {
  top: 20px;
  right: 40px;
  position: absolute;
}
a {
  text-decoration: none;
}
</style>
