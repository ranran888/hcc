<template>
  <div class="detail">
    <!-- 大图轮播-->
    <div class="limg">
      <van-swipe
        class="my-swipe"
        :autoplay="3000"
        indicator-color="white"
        :show-indicators="false"
      >
        <van-swipe-item
          ><img :src="product.iimg" alt=""
        /></van-swipe-item>
        <van-swipe-item
          ><img :src="product.iimg" alt=""
        /></van-swipe-item>
        <van-swipe-item
          ><img :src="product.iimg" alt=""
        /></van-swipe-item>
        <van-swipe-item
          ><img :src="product.iimg" alt=""
        /></van-swipe-item>
      </van-swipe>
    </div>
    <!-- 商品详情 -->
    <div class="pro-content">
      <div class="zhong">
        <p class="title">
          {{product.iintroduc}}
        </p>
        <p class="price">￥{{product.iprice}}</p>
        <p class="dd">
          <span>邮费：{{product.ipostage}}</span>
          <span>库存：{{product.istock}}</span>
          <span>{{product.iseeding}} 人种草</span>
        </p>
      </div>
      <!-- 品质保障 -->
      <div class="ensure">
        <div>
          <van-icon name="passed" color="#ff6699" />
          <span>30天内发货</span>
        </div>
        <div>
          <van-icon name="passed" color="#ff6699" />
          <span>正品保证</span>
        </div>
        <div>
          <van-icon name="passed" color="#ff6699" />
          <span>支持七天无理由退货</span>
        </div>
      </div>
    </div>
    <!-- 支付方式 -->
    <div class="pay">
      <div class="zhong">
        <span>支付</span>
        <span>
          <van-icon name="wechat" color="#36b34d" size="1.5rem" /><span
            >微信支付</span
          >
          <van-icon name="alipay" color="#00aaef" size="1.5rem" /><span
            >支付宝支付</span
          >
          <van-icon name="wechat-pay" color="#36b34d" size="1.5rem" /><span
            >微信支付</span
          >
        </span>
      </div>
    </div>
    <!-- 商品尺码 -->
    <div class="size">
      <p @click="isShow">
        <span>请选择商品尺码颜色</span>
        <van-icon name="arrow" />
      </p>
      <van-sku
        v-model="show"
        :sku="sku"
        :goods="goods"
        :goods-id="skuData.goodsId"
        :quota="customStepperConfig.quota"
        :quota-used="customStepperConfig.quotaUsed"
        :hide-stock="sku.hide_stock"
        @buy-clicked="onBuyClicked"
        @add-cart="onAddCartClicked"
        @stepper-change="stepperChange"
        @sku-prop-selected="sukPropSelected"
        @sku-selected="skuSelected"
      />
    </div>

    <!-- 商品简介 -->
    <div class="product-info">
      <div class="info">
        <!-- 产品描述 -->
        <p class="title">产品描述</p>
        <!-- 分类及面料 -->
        <div class="desc">
          <p>品牌：半生罗裳</p>
          <p>面料：天丝</p>
          <p>
            尺码：S（预售20天左右出货）,M（预售20天左右出货）,L（预售20天左右出货）
          </p>
          <p>颜色分类：荼蘼长衫</p>
          <p>成分含量：51%(含)-70%(含)</p>
          <p>上市年份季节：2021年秋季</p>
        </div>
      </div>
    </div>
    <!-- 商品展示 -->
    <div class="display-product">
      <div class="z">
        <p>商品展示</p>
        <div class="limg">
          <img src="/img/intro1.jpg" alt="" />
          <img src="/img/intro2.jpg" alt="" />
          <img src="/img/intro1.jpg" alt="" />
        </div>
      </div>
    </div>

    <!-- 商品导航 -->
    <div class="pnav">
      <van-goods-action>
        <van-goods-action-icon icon="chat-o" text="客服" color="#ee0a24" />
        <van-goods-action-icon icon="cart-o" text="购物车"  badge="5" to="/order"/>
        <van-goods-action-icon icon="star" text="已收藏" color="#ff5000" />
        <van-goods-action-button type="warning" text="加入购物车" @click="isShow"/>
        <van-goods-action-button type="danger" text="立即购买" @click="isShow"/>
      </van-goods-action>
    </div>
  </div>
</template>
<script>


export default {
  data() {
    return {
      iintroduc:'',//商品介绍
      username:'',//用户名
      product:[],//获取的商品信息
      show: false,
      sku: {
        tree: [
          {
            k: "尺码", // skuKeyName：规格类目名称
            k_s: "s1", // skuKeyStr：sku 组合列表（下方 list）中当前类目对应的 key 值，value 值会是从属于当前类目的一个规格值 id
            v: [
              {
                id: "1", // skuValueId：规格值 id
                name: "l", // skuValueName：规格值名称
               
              },
              {
                id: "2",
                name: "xl",
                
              },
              {
                id: "3",
                name: "xxl",
                
              },
            ],
            largeImageMode: false, //  是否展示大图模式
          },
          {
            k: "样式", // skuKeyName：规格类目名称
            k_s: "s2", // skuKeyStr：sku 组合列表（下方 list）中当前类目对应的 key 值，value 值会是从属于当前类目的一个规格值 id
            v: [
              {
                id: "4", // skuValueId：规格值 id
                name: "l", // skuValueName：规格值名称
               
              },
              {
                id: "5",
                name: "xl",
                
              },
              {
                id: "6",
                name: "xxl",
                
              },
            ],
            largeImageMode: false, //  是否展示大图模式
          },
        ],
        // 所有 sku 的组合列表，比如红色、M 码为一个 sku 组合，红色、S 码为另一个组合
        list: [
          {
            id: 2259, // skuId
            s1: "1", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "4", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2260, // skuId
            s1: "1", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "5", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2261, // skuId
            s1: "1", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "6", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2262, // skuId
            s1: "2", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "4", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2263, // skuId
            s1: "2", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "5", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2264, // skuId
            s1: "2", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "6", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2265, // skuId
            s1: "3", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "4", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2266, // skuId
            s1: "3", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "5", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
          {
            id: 2267, // skuId
            s1: "3", // 规格类目 k_s 为 s1 的对应规格值 id
            s2: "6", // 规格类目 k_s 为 s2 的对应规格值 id
            price: 100, // 价格（单位分）
            stock_num: 110, // 当前 sku 组合对应的库存
          },
        ],
        price: "100.00", // 默认价格（单位元）
        stock_num: 227, // 商品总库存
        collection_id: 2261, // 无规格商品 skuId 取 collection_id，否则取所选 sku 组合对应的 id
        none_sku: false, // 是否无规格商品
        // messages: [
        //   {
        //     // 商品留言
        //     datetime: "0", // 留言类型为 time 时，是否含日期。'1' 表示包含
        //     multiple: "0", // 留言类型为 text 时，是否多行文本。'1' 表示多行
        //     name: "留言", // 留言名称
        //     type: "text", // 留言类型，可选: id_no（身份证）, text, tel, date, time, email
        //     required: "1", // 是否必填 '1' 表示必填
        //     placeholder: "", // 可选值，占位文本
        //   },
        // ],
        hide_stock: false, // 是否隐藏剩余库存
      },
      goods: {
        // 数据结构见下方文档
        picture: "https://img01.yzcdn.cn/1.jpg",
      },
      customStepperConfig: {
        // 自定义限购文案
        quotaText: "每次限购xxx件",
        // 自定义步进器超过限制时的回调
        handleOverLimit: (data) => {
          const { action, limitType, quota, quotaUsed, startSaleNum } = data;

          if (action === "minus") {
            Toast(
              startSaleNum > 1 ? `${startSaleNum}件起售` : "至少选择一件商品"
            );
          } else if (action === "plus") {
            // const { LIMIT_TYPE } = Sku.skuConstants;
            if (limitType === LIMIT_TYPE.QUOTA_LIMIT) {
              let msg = `单次限购${quota}件`;
              if (quotaUsed > 0) msg += `，你已购买${quotaUsed}`;
              Toast(msg);
            } else {
              Toast("库存不够了");
            }
          }
        },
        // 步进器变化的回调
        handleStepperChange: (currentValue) => {},
        // 库存
        stockNum: 1999,
        // 格式化库存
        stockFormatter: (stockNum) => {},
      },
      skuData: {
        // 商品 id
        goodsId: "946755",
        // 选择的商品数量
        selectedNum: 1,
        // 选择的 sku 组合
        selectedSkuComb: {
          id: 2257,
          price: 100,
          s1: "1",
          s2: "6",
          stock_num: 111,
          property_price: 100,
        },
      },
    };
  },


  

  methods: {
  //  获取用户名
  getUser(){
    if(!sessionStorage.getItem('name')){
      // 如果获取的是空则跳转到登录页面
      this.$router.push('/logon');
    }else{
      let str = sessionStorage.getItem('name');
       this.username = str; 
       console.log(this.username)
    }
  },

    
  // 商品规格发生变化时触发
  skuSelected(data){
    console.log(data)
  },

  //  商品属性发生变化时触发
  sukPropSelected(data){
   console.log(data);
   this.skuData=data.selectedSkuComb;
  },

   //购买数量发生变化时触发
   stepperChange(data){
     
    console.log(data)
    this.skuData.selectedNum=data;
    console.log(this.skuData.selectedNum)
   },  

    // 点击购买回调
    onBuyClicked(data){
      console.log('点击购买',data)
      // 判断是否可以获取到用户名
      this.getUser()
    
    //  计算总价
      var buysum= (data.selectedNum*data.selectedSkuComb.price)/100;
      console.log(buysum)
      
      //参数解构data中的数据
      var {goodsId,selectedNum,selectedSkuComb}= this.skuData;                                                         console.log(goodsId,selectedNum,selectedSkuComb)
      //参数解构selectedSkuComb的变量
      var {id}=selectedSkuComb


    },
    // 点击加入购物车回调
    onAddCartClicked(data){
      console.log('点击加入购物车');
     this.getUser()
    
    //  计算总价
      var buysum= (data.selectedNum*data.selectedSkuComb.price)/100;
      console.log(buysum)
      
      //参数解构data中的数据
      var {goodsId,selectedNum,selectedSkuComb}= this.skuData;                                                                                                                          console.log(goodsId,selectedNum,selectedSkuComb)
      //参数解构selectedSkuComb的变量
      var {id}=selectedSkuComb;
      

      // 发送请求
      this.axios.post('/cars/info',`user_id=${this.username}&product_id=${this.skuData.goodsId}&style=${this.skuData.selectedSkuComb.s2}&size=${this.skuData.selectedSkuComb.s1}&goodsprice=${buysum}&cost=${(data.selectedSkuComb.price)/100}&goodsSum=${selectedNum}&pimg=${this.goods. picture}&iintroduc=${this.iintroduc}&ischeck=${false}`).then((res=>{
        console.log("发送成功")
        console.log(res)
        this.show=false;
      }))



    },
    // 发送请求获取商品规格
    patternAxios(){
      let product=this.$route.query.product_id;
      console.log(product)
      this.axios.get('/products/pattern',{params:{product_id:product}}).then((res)=>{
        console.log(res.data.data[0])

        var {bsize,msize,pid,pproduct_id,ssize,styh,styo,styt}=res.data.data[0]
        this.sku.tree[1].v[0].name=styo;
        this.sku.tree[1].v[1].name=styh;
        this.sku.tree[1].v[2].name=styt;
       
      })
    },
    // 发送请求获取商品详情
    detailAxios(){
      let product=this.$route.query.product_id;
      console.log(product);
      this.axios('/products/detail',{params:{product_id:product}}).then((res)=>{
        console.log(res.data);
        this.product=res.data.data[0];
        this.iintroduc=res.data.data[0].iintroduc;
        // console.log(this.iintroduc)
        console.log(this.product)
            var{d_brind,d_familyclass,dclass,iid,iimg,iintroduc,ipostage,iprice,iprice_range,iseeding,istock,oldprice,oprice_range,product_id}=this.product
            this.goods.picture=iimg;
            this.skuData.goodsId=product_id;
            this.sku.price=iprice;
            // 利用for循环给list列表绑定价格
            for(var i=0;i<this.sku.list.length;i++){
              this.sku.list[i].price=iprice*100;
            }
           
      
      })
    },

    // 点击是否显示商品样式
    isShow() {
      this.show = true;
    },
    onClickIcon() {
      // Toast("点击图标");
      this.show = true;
   
    },
    onClickButton() {
      Toast("点击按钮");
      this.show = true;
    },
  },
  mounted(){
    this.detailAxios();
    this.patternAxios();
    // 获取用户名
  },



};
</script>
<style lang="scss">
.detail {
  background-color: #f4f4f4;
  // 大图
  .limg {
    .van-swipe__track {
      height: 70vh;
      img {
        width: 100%;
        height: 70vh;
      }
    }
  }
  // 商品详情
  .pro-content {
    // height: 35vh;
    background-color: white;
    overflow: hidden;
    .zhong {
      width: 93vw;
      margin: 0 auto;
      // background-color: wheat;
      .title {
        font-size: 0.9rem;
        color: #555;
        margin: 1vh 0;
      }
      .price {
        color: #ff6699;
        font-size: 1.4rem;
        font-weight: 600;
        margin: 0;
      }
      .dd {
        font-size: 0.9rem;
        color: #aaa;
        display: flex;
        justify-content: space-between;
        margin: 1vh 0 3vh;
      }
    }
    // 正品保证
    .ensure {
      width: 93vw;
      margin: 0 auto;
      // background-color: yellowgreen;
      height: 6vh;
      display: flex;
      justify-content: space-around;

      line-height: 6vh;
      border-top: 1px solid #f3f3f3;
      div {
        height: 6vh;
        line-height: 6vh;
        i {
          vertical-align: middle;
        }
        span {
          color: #555;
          font-size: 0.9rem;
          padding-bottom: 2vh;
        }
      }
    }
  }
  // 支付方式
  .pay {
    background-color: white;
    margin-bottom: 2vh;
    .zhong {
      width: 93vw;
      margin: 2vh auto 0;
      height: 6vh;
      display: flex;
      justify-content: space-between;
      align-items: center;
      line-height: 6vh;
      span {
        color: #555;
        font-size: 0.9rem;
        line-height: 6vh;
        padding-top: 1vh;

        i {
          vertical-align: middle;
          margin-left: 2vw;
        }
      }
    }
  }
  // 商品尺码
  .size {
    background-color: white;
    margin-bottom: 2vh;
    p {
      width: 93vw;
      margin: 2vh auto 0;
      height: 6vh;
      line-height: 6vh;
      color: #555;
      font-size: 0.9rem;
      display: flex;
      justify-content: space-between;
      i {
        vertical-align: middle;
        line-height: 6vh;
      }
    }
  }
  // 商品简介
  .product-info {
    background-color: white;
    margin-bottom: 2vh;
    .info {
      // background-color: aqua;
      width: 93vw;
      margin: 2vh auto 0;

      line-height: 6vh;
      color: #555;
      .title {
        height: 6vh;
        margin: 0 0;
        color: #999;
        font-size: 0.9rem;
      }
      > .desc {
        p {
          color: #555;
          font-size: 0.9rem;
          margin: 0;
        }
      }
    }
  }

  // 商品展示
  .display-product {
    background-color: white;
    margin-bottom: 2vh;
    overflow: hidden;
    .z {
      width: 93vw;
      margin: 0 auto 0;

      p {
        color: #888;
        font-size: 0.9rem;
        height: 2vh;
      }
      .limg {
        img {
          width: 100%;
          height: 70vh;
          display: block;
        }
      }
    }
  }

  // 商品导航
  .pnav {
    margin-top: 11vh;
  }
}
</style>