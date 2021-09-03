import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    islogin:false,
    name:''
  },
  mutations: {
    loginOk(state,name){
      state.islogin=true;
      state.name=name;
    }
  },
  actions: {
  },
  modules: {
  }
})
