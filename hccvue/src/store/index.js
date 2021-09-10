import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    islogin: sessionStorage.getItem("login"),
    name: sessionStorage.getItem("name"),
    count: sessionStorage.getItem("count"),
  },
  mutations: {
    loginOk(state, name) {
      state.islogin = true;
      state.name = name;
    },
    Axios(state, count) {
      // this.axios.get("/cars/getinfo").then((res) => {
      //   console.log(res.data.data);
      state.count = count;
    },
  },
  actions: {},
  modules: {},
});
