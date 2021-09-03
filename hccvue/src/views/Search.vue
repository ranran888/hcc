<template>
  <div class="search">
    <van-tabs v-model="active">
      <van-tab title="综合" class="v1">
        <!-- 综合商品 -->
        <!-- 一个商品 -->
        <div class="ondisplay" >
          <div v-for="(summary,s) of summary" :key="s">
            <router-link :to="`/detail?product_id=${summary.product_id}`">
              <img :src="summary.iimg" alt="" />
              <p class="title">
               {{summary.iintroduc}}
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥{{summary.iprice}}</strong>
                <span>{{summary.iseeding}}人种草</span>
              </p>
              </router-link>
          </div>
        </div>
      </van-tab>
      <van-tab title="最新" class="v2">
         <!-- 综合商品 -->
        <!-- 一个商品 -->
        <div class="ondisplay">
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy7.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
         
        </div>
      </van-tab>
      <van-tab title="种草" class="v3">
         <!-- 综合商品 -->
        <!-- 一个商品 -->
        <div class="ondisplay">
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
        </div>
      </van-tab>
      <van-tab title="价格↑" class="v4">
         <!-- 综合商品 -->
        <!-- 一个商品 -->
        <div class="ondisplay">
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy9.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
         
        </div>
      </van-tab>
      <van-tab title="价格↓" class="v5">
         <!-- 综合商品 -->
        <!-- 一个商品 -->
        <div class="ondisplay">
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy2.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
          <div>
            <router-link to="">
              <img src="/img/one/iflashbuy8.jpg" alt="" />
              <p class="title">
                重回汉唐汉服女【酉阳杂俎】脍蝶正品原创唐制中国风古风齐胸襦裙
              </p>
              <p class="type">重回汉唐汉服店</p>
              <p class="price">
                <strong>￥189.00</strong>
                <span>470人种草</span>
              </p>
              </router-link>
          </div>
         
        </div>
      </van-tab>
    </van-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: 0,
      summary:[]//综合
    };
  },
  methods:{
    // 发送请求，获取搜索框传来的关键字
    searchAxios(){
      let kw=this.$route.query.kw;
      // console.log(kw)
      this.axios.get(`/products/search?kw=`+kw).then((res)=>{
        console.log(res.data.data);
        this.summary=res.data.data;
      
      })
    },
  },
  mounted(){
    // this.dclassAxios();
    this.searchAxios();
  },

};
</script>
<style lang="scss">
.search {
  background-color: #f4f4f4;
  .van-tabs__content {
    // 商品成列
    .ondisplay {
      width: 92vw;
      margin: 2vw auto 2vw;
      // background-color: aqua;
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      // 一个商品
      > div {
        background-color: white;
        width: 45vw;
        border-radius: 1vw;
        margin-bottom: 3vw;
        img {
          width: 100%;
          height: 29vh;
        }
        .title {
          color: #555;
          font-size: 0.8rem;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
          text-overflow: ellipsis;
          word-wrap: break-word;
          word-break: break-all;
          overflow: hidden;
          margin: 1vw 0;
        }
        .type {
          color: #bcbcbc;
          font-size: 0.5rem;
          margin: 0;
          height: 3vh;
          line-height: 3vh;
        }
        .price {
          overflow: hidden;
          width: 45vw;
          margin: 0;
          height: 3vh;
          strong {
            color: #ff6699;
            font-size: 1.1rem;
            line-height: 3vh;
          }
          span {
            color: #bcbcbc;
            font-size: 0.5rem;
            float: right;
            line-height: 3vh;
          }
        }
      }
    }
  }
}
</style>