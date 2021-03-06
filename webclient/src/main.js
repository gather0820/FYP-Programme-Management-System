// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VCharts from 'v-charts'
import App from './App';
import router from './router';

import http from './utils/http';

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.prototype.$http = http;

Vue.config.productionTip = false;
Vue.use(VCharts);
Vue.use(ElementUI);

//Verification of cancelled codes
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
