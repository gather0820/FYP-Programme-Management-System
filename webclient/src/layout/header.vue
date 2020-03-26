<template>
  <div class="header">
    <div class="title">
      SDMS
      <span class="label">version.1</span>
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
.header {
  text-align: center;
  font-size: 18px;
  margin-top: 20px;
  box-shadow: 0 5px 15px -10px #ccc;
  padding: 20px;
}
.title {
  font-size: 34px;
  text-align: left;
  margin-left: 40px;
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
