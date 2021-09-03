<template>
  <div class="home">
    <!-- 页头 -->
    <div class="myheader">
      <!-- 登录 -->
      <router-link to="/logon">
        <div class="log"></div>
      </router-link>
      <!-- 搜索框 -->
      <van-search
        class="ss"
        v-model="value"
        placeholder="请输入搜索关键词"
        @search="onSearch"
        shape="round"
        background="#f4f4f4"
      />
      <!-- 购物车 -->
      <router-link to="/order">
        <div class="car"></div>
      </router-link>
    </div>
    <!-- 轮播图 -->
    <div class="canousel">
      <van-swipe class="my-swipe" :autoplay="5000" indicator-color="white">
        <van-swipe-item v-for="(banner, i) of banner" :key="i">
          <img :src="banner.img" alt="" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <!-- 选项卡 -->
    <ul>
      <li v-for="(nav, i) of nav" :key="i">
        <router-link :to="`/classify?nclass=${nav.nclass}`">
          <img :src="`${nav.nimg}`" alt="" />
          <p>{{ nav.title }}</p>
        </router-link>
      </li>
    </ul>
    <!-- 拼团 -->
    <div class="collage">
      <!-- 标题 -->
      <div class="title">
        <h3>小荟拼团</h3>
        <span>拼团下单，更多优惠</span>
        <router-link to=""
          >更多拼团<img src="/img/one/icon_arrow_right.png" alt=""
        /></router-link>
      </div>
      <!-- 图片 -->
      <ul class="content">
        <li v-for="(group,g) of group" :key="g">
          <router-link :to="`/detail?product_id=${group.product_id}`">
            <img :src="group.iimg" alt="" />
            <p>￥{{group.iprice}}</p>
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 限时抢购 -->
    <div class="limit">
      <!-- 标题 -->
      <div class="title">
        <h3>限时闪购</h3>
        <span>
          <!-- 倒计时 -->
          <van-count-down :time="time">
            <template #default="timeData">
              <span class="block">{{ timeData.hours }}</span>
              <span class="colon">:</span>
              <span class="block">{{ timeData.minutes }}</span>
              <span class="colon">:</span>
              <span class="block">{{ timeData.seconds }}</span>
            </template>
          </van-count-down>
        </span>
        <router-link to=""
          >即将开始<img src="/img/one/icon_arrow_right.png" alt=""
        /></router-link>
      </div>
      <!-- 图片 -->
      <div class="k">
         <ul class="content">
        <li v-for="(iflash,i) of iflashbuy" :key="i">
          <router-link :to="`/detail?product_id=${iflash.product_id}`">
            <img :src="iflash.iimg" alt="" />
            <p>￥{{iflash.iprice}}</p>
            <p>￥{{iflash.oldprice}}</p>
          </router-link>
        </li>
       
      </ul>
      </div>
     
    </div>
    <!-- 初秋 -->
    <div class="autumn">
      <div class="bg"></div>
      <!-- 横拉框 -->
      <div class="kuang">
        <div class="nei">
          <div class="one" v-for="(autumn,a) of autumn" :key="a">
            <router-link :to="`/detail?product_id=${autumn.product_id}`">
              <img :src="autumn.iimg" alt="" />
            <p>￥{{autumn.iprice}}</p>
            </router-link>
          </div>
        </div>
      </div>
      <!-- 往期专题 -->
      <div class="pre">
        <router-link to=""
          >往期专题<img src="/img/style/icon_arrow_right_red.png" alt=""
        /></router-link>
      </div>
    </div>
    <!-- 商品成列 -->
    <div class="ondisplay">
      <!-- 一个商品 -->
      <div v-for="(detail,d) of details" :key="d">
        <router-link :to="`/detail?product_id=${detail.product_id}`">
          <img :src="detail.iimg" alt="" />
        <p class="title">
          {{detail.iintroduc}}
        </p>
        <p class="type">重回汉唐汉服店</p>
        <p class="price">
          <strong>￥{{detail.iprice}}</strong>
          <span>{{detail.iseeding}}人种草</span>
        </p>
        </router-link>
      </div>
      
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      value: "",
      time: 100 * 60 * 60 * 1000, //倒计时
      nav: [],
      banner: [], //轮播图
      details:[],//商品列表
      iflashbuy:[],//获取闪购的商品数据
      group:[],//获取拼团的商品数据
      autumn:[],//获取初秋的商品数据
    };
  },
  methods: {
    onSearch(val) {
      // alert(val);
      this.$router.push(`/search?kw=${val}`)
    },
    // 查询导航分类
    navAxios() {
      this.axios.get("/products/nav").then((res) => {
        this.nav = res.data.data;
        console.log(res.data.data);
      });
    },
    // 发送请求查找轮播图
    bannerAxios() {
      this.axios.get("/carousel/banner").then((res) => {
        this.banner = res.data.data;
        console.log(res.data.data);
      });
    },
    // 发送请求查询商品信息
    productAxios(){
       this.axios.get("/products/details").then((res) => {
        this.details = res.data.data;
        console.log(res.data.data);
      });
      
    },
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
  mounted() {
    this.navAxios();
    this.bannerAxios();
    this.productAxios();
    // 获取拼团的商品数据
    this.dclassAxios(200).then((group)=>{
      console.log(group);
      this.group=group;
    });
    // 获取闪购的商品数据
    this.dclassAxios(100).then((iflashbuy)=>{
      console.log(iflashbuy);
      this.iflashbuy=iflashbuy;
    });
    // 获取初秋的商品数据
    this.dclassAxios(300).then((autumn)=>{
      console.log(autumn);
      this.autumn=autumn;
    });


  },
};
</script>
<style lang="scss">
.home {
  background: #f4f4f4;
  // 导航栏
  .myheader {
    width: 100%;
    height: 7vh;
    overflow: hidden;
    display: flex;
    justify-content: space-around;
    // 登录
    .log {
      background-image: url(/img/banner/inx_user.png);
      background-repeat: no-repeat;
      background-size: 9vw 5vh;
      width: 9vw;
      height: 5vh;
      margin: 1vh 0 1vh 1vw;
      border-radius: 50%;
    }
    .ss {
      .van-search__content {
        background-color: white;
        width: 65vw;
      }
    }
    // 购物车
    .car {
      background-image: url(/img/banner/inx_cart.png);
      background-repeat: no-repeat;
      background-size: 9vw 5vh;
      width: 9vw;
      height: 5vh;
      margin: 1vh 0 1vh 1vw;
      border-radius: 50%;
    }
  }
  // 轮播图
  .canousel {
    margin-top: 1.5vh;
    img {
      width: 100%;
    }
  }
  // 选项卡
  ul {
    overflow: hidden;
    margin-bottom: 3vh;
    li {
      width: 20vw;
      //  background-color: wheat;
      margin-top: 2vh;
      float: left;
      img {
        width: 12vw;
        height: 7vh;
        border-radius: 50%;
        display: block;
        margin: 0 auto;
      }
      p {
        width: 20vw;
        margin: 0;
        margin-top: 2vh;
        text-align: center;
        color: #555;
        font-size: 0.9em;
      }
    }
  }
  // 拼团
  .collage {
    width: 92vw;
    height: 23vh;
    background-color: white;
    margin: 0 auto 2vh;
    // 标题
    .title {
      overflow: hidden;
      height: 6vh;
      h3 {
        color: #555;
        font-size: 1.1em;
        float: left;
        margin: 0;
        line-height: 6vh;
        margin-left: 4vw;
      }
      span {
        color: #999;
        font-size: 0.8em;
        float: left;
        line-height: 6vh;
        margin-left: 2vw;
      }
      a {
        color: #999;
        font-size: 0.6em;
        float: right;
        line-height: 6vh;
        margin-right: 4vw;
        img {
          width: 2vw;
          height: 3vw;
          margin-left: 1vw;
        }
      }
    }
    // 图片
    .content {
      margin: 0 4vw;
      overflow: hidden;
      display: flex;
      justify-content: space-between;
      li {
        margin-top: 0;
        float: left;
        img {
          width: 20vw;
          height: 12vh;
          // background-color: wheat;
          border-radius: 1.5vw;
        }
        p {
          color: #ff6699;
          font-size: 0.8em;
          margin-top: 1vh;
          font-weight: 600;
        }
      }
    }
  }
  // 限时抢购
  .limit {
    width: 92vw;
    height: 27vh;
    background-color: white;
    margin: 0 auto 2vh;
    // 标题
    .title {
      overflow: hidden;
      height: 6vh;
      h3 {
        color: #555;
        font-size: 1.1em;
        float: left;
        margin: 0;
        line-height: 6vh;
        margin-left: 4vw;
      }
      span {
        color: #999;
        font-size: 0.8em;
        float: left;
        // line-height: 6vh;
        margin-left: 2vw;
        // padding-top: 1vh;
        .van-count-down{
          padding-top: 1.6vh;
          .colon {
          display: inline-block;
          margin: 0 4px;
          color: #ff6699;
          font-weight: 700;
        }
        .block {
          display: inline-block;
          width: 22px;
          color: #fff;
          font-size: 12px;
          text-align: center;
          background-color: #ff6699;
          border-radius: 1.5vw;
        }
        }
        
      }
      a {
        color: #999;
        font-size: 0.6em;
        float: right;
        line-height: 6vh;
        margin-right: 4vw;
        img {
          width: 2vw;
          height: 3vw;
          margin-left: 1vw;
        }
      }
    }
    // 图片
    .k{
      width: 92vw;
      // height: 19vh;
      // background-color: #ff6699;
      overflow: hidden;
      overflow: auto;
      .content {
        height: 20vh;
      width:213vw;
      margin: 0 4vw;
      overflow: hidden;
      display: flex;
      justify-content: space-between;
      li {
        margin-top: 0;
        float: left;
        // margin-right: 0.1vw;
        img {
          width: 19.5vw;
          height: 12vh;
          // background-color: wheat;
          border-radius: 1.5vw;
        }
        p {
          color: #ff6699;
          font-size: 0.8em;
          margin-top: 1vh;
          font-weight: 600;
        }
        p:nth-child(3){
          font-size: 0.6rem;
          color:#999;
          margin:0;
          text-decoration: line-through;
        }
      }
    }
    }
    
  }
  // 初秋
  .autumn {
    width: 92vw;
    height: 40vh;
    background-color: white;
    margin: 0 auto 2vh;
    .bg {
      background-image: url(/img/three/banner.jpg);
      width: 92vw;
      height: 16vh;
      background-repeat: no-repeat;
      background-size: cover;
      margin-bottom: 2vw;
    }
    // 横拉框
    .kuang {
      width: 92vw;
      height: 19vh;
      // background-color: #ff6699;
      overflow: hidden;
      overflow: auto;
      .nei {
        width: 184vw;
        height: 18vh;
        // background-color: aqua;
        display: flex;
        justify-content: space-around;
        .one {
          width: 23vw;
          img {
            width: 22vw;
            height: 13vh;
            border-radius: 1.5vw;
          }
          p {
            margin: 1vh 0 0 0;
            text-align: center;
            color: #ff6699;
            font-size: 0.9rem;
            font-weight: 700;
          }
        }
      }
    }
    // 往期专题
    .pre {
      text-align: center;
      border-top: 2px solid #f4f4f4;
      padding-top: 1vh;
      border-bottom-right-radius: 2vw;
      border-bottom-left-radius: 2vw;
      a {
        color: #ff6699;
        font-size: 0.9rem;
        img {
          height: 1.5vh;
          width: 3vw;
        }
      }
    }
  }
  // 商品成列
  .ondisplay {
    width: 92vw;
    margin: 0 auto 2vw;
    // background-color: aqua;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    // 一个商品
    > div {
      background-color: white;
      width: 45vw;
      border-radius: 1vw;
      margin-bottom: 2vw;
      img {
        width: 100%;
        height: 33vh;
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
