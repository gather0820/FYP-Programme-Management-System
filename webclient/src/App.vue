<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  // provide(){
  //   return{
  //     reload:this.reload
  //   }
  // },
  data(){
    return{
      isRouterAlive:true
    }
  },
  methods:{
  //   reload(){
  //     this.isRouterAlive = false;
  //     this.$nextTick(()=>{
  //       this.isRouterAlive = true;
  //     })
  //   }
  }
}
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  text-align: center;
}
</style>
