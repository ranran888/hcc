import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
// import Classify from '../views/Classify.vue'

Vue.use(VueRouter)

const routes = [
  {
    path:'/order',
    name:"order",
    component:()=>import(/* webpackChunkName: "order" */ '../views/Order.vue')
  },
  {
    path:'/me',
    name:"me",
    component:()=>import(/* webpackChunkName: "me" */ '../views/Me.vue')
  },
  {
    path:'/search',
    name:"search",
    component:()=>import(/* webpackChunkName: "search" */ '../views/Search.vue')
  },
  {
    path:'/detail',
    name:"detail",
    component:()=>import(/* webpackChunkName: "detail" */ '../views/Detail.vue')
  },
  {
    path:'/reg',
    name:"reg",
    component:()=>import(/* webpackChunkName: "reg" */ '../views/Reg.vue')
  },
  {
    path:'/logon',
    name:"logon",
    component:()=>import(/* webpackChunkName: "logon" */ '../views/Logon.vue')
  },
  {
    path:'/family',
    name:"family",
    component:()=>import(/* webpackChunkName: "family" */ '../views/Family.vue')
  },
  {
    path:'/classify',
    name:"classify",
    component:()=>import(/* webpackChunkName: "classify" */ '../views/Classify.vue')
  },
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
