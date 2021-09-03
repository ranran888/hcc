import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
// axios.defaults.baseURL="http://127.0.0.1:6060"
Vue.prototype.axios=axios
// 引入vant组件
import Vant from 'vant';
import 'vant/lib/index.css';
// 引入vant的less组件样式
// import 'vant/lib/index.less';
//引入mint-ui组件
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
Vue.use(MintUI)

Vue.use(Vant);





Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
