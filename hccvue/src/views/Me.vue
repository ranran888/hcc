<template>
  <div class="me">
    <!-- 登录 -->
    <div class="islog" v-if="$store.state.islogin">
      <img src="/img/me/icon1.jpg_100x100.jpg" alt="" />
      <span>{{$store.state.name}}</span>
      <router-link to=""><span></span></router-link>
    </div>
     <!-- 未登录（默认） -->
    <div class="islog" v-else>
      <img src="/img/me/icon1.jpg_100x100.jpg" alt="" />
      <router-link to=""> <span>请点击登录</span></router-link>
    </div>
    <!-- 单元格我的订单 -->
    <div class="myorder">
      <van-cell-group>
        <van-cell title="我的订单" value="查看全部订单" is-link />
      </van-cell-group>
      <!-- 订单列 -->
      <ul>
        <li>
          <router-link to="">
            <img src="/img/me/icon_orders_add.png" alt="" />
            <p>待支付</p>
          </router-link>
        </li>
        <li>
          <router-link to="">
            <img src="/img/me/icon_orders_advance.png" alt="" />
            <p>待成团</p>
          </router-link>
        </li>
        <li>
          <router-link to="">
            <img src="/img/me/icon_orders_pay.png" alt="" />
            <p>代发货</p>
          </router-link>
        </li>
        <li>
          <router-link to="">
            <img src="/img/me/icon_orders_ship.png" alt="" />
            <p>待收货</p>
          </router-link>
        </li>
        <li>
          <router-link to="">
            <img src="/img/me/icon_orders_waitcomment.png" alt="" />
            <p>待评价</p>
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 商城功能 -->
    <div class="myshop">
      <van-cell-group>
        <van-cell title="商城功能" />
      </van-cell-group>
      <!-- 列表 -->
      <van-grid :border="false">
        <van-grid-item icon="/img/me/icon_u_save.png" text="我的种草" />
        <van-grid-item icon="/img/me/icon_u_atte.png" text="关注店铺" />
        <van-grid-item icon="/img/me/icon_u_history.png" text="浏览记录" />
        <van-grid-item icon="/img/me/icon_orders_refund.png" text="退货售后" />
        <van-grid-item icon="/img/me/icon_u_cart.png" text="购物车" />
        <van-grid-item icon="/img/me/icon_u_fleas.png" text="我的二手" />
        <van-grid-item icon="/img/me/icon_mycomment.png" text="评价" />
        <van-grid-item icon="/img/me/icon_u_voucher.png" text="代金券" />
        <van-grid-item icon="/img/me/icon_u_address.png" text="收货地址" />
      </van-grid>
    </div>
    <!-- 为你推荐 -->
    <div class="you">
      <img src="/img/me/tit_pro_feed.png" alt="" />
    </div>
    <!-- 推荐商品 -->
    <!-- 综合商品 -->
    <!-- 一个商品 -->
    <div class="ondisplay">
      <div v-for="(summary, s) of summary" :key="s">
        <router-link :to="`/detail?product_id=${summary.product_id}`">
          <img :src="summary.iimg" alt="" />
          <p class="title">
            {{ summary.iintroduc }}
          </p>
          <p class="type">重回汉唐汉服店</p>
          <p class="price">
            <strong>￥{{ summary.iprice }}</strong>
            <span>{{ summary.iseeding }}人种草</span>
          </p>
        </router-link>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
     summary:[]
    }
  },
  methods:{
     // 发送请求通过导航分类查找响应商品
    dclassAxios(dclass){
      return new Promise ((resolve,reject)=>{
        this.axios.get("/products/nav_class?dclass="+dclass).then((res) => {
        // this.details_dclass = res.data.data;
        resolve(res.data.data)
        console.log(res.data.data);
        });
      })
    },
  },
  mounted(){
     // 获取初秋的商品数据
      this.dclassAxios(300).then((autumn)=>{
      console.log(autumn);
      this.summary=autumn;
    });
  }



}
</script>
<style lang="scss">
.me {
  //  登录
  .islog {
    display: flex;
    align-content: center;
    padding: 2vh 3vw;
    img {
      width: 10vw;
      height: 6vh;
      border-radius: 50%;
      border: 1px solid #ddd;
      margin-right: 4vw;
    }
    span {
      color: #555;
      font-size: 1rem;
      font-weight: 500;
      line-height: 7vh;
    }
  }
  // 订单列表
  .myorder {
    background-color: white;
    border-radius: 4vw;
    ul {
      display: flex;
      justify-content: space-around;
      margin: 3vh 0;
      padding-bottom: 2vh;
      li {
        width: 19vw;
        img {
          width: 7vw;
          height: 5vh;
          display: block;
          margin: 0 auto;
        }
        p {
          margin: 0;
          color: #555;
          font-size: 0.5rem;
          text-align: center;
        }
      }
    }
  }
  .myshop {
    background-color: white;
  }
  //为你推荐
  .you {
    margin: 3vh 0;
    img {
      width: 30vw;
      height: 3vh;
      display: block;
      margin: 0 auto;
    }
  }
  // 推荐商品
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
</style>