import Vue from 'vue'
import Router from 'vue-router'
import index from '@/components/index'
import list from '@/components/tab-list'

//SPA?single-page application???????
//WebApp's link path management system
Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: '/tab-list',
      name: 'tab-list',
      component: list
    }
  ],
  mode: 'history'
})

//  ???? Verify login
router.beforeEach((to, from, next) => {
  if (to.name === 'tab-list') {
    if (!sessionStorage.username) {
      window.alert('Session timeout, please login again!')
      return window.location.replace('/')
    } else {
      next()
    }
  } else {
    next()
  }
})
export default router
