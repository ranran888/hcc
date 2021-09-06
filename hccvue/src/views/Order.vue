<template>
  <div class="order">
    <!-- 订单界面 -->
    <div class="frame">
      <ul id="ul" @click="del">
        <li v-for="(order,o) of order" :key="o">
          <!-- 左边选择框 -->
          <button></button>
          <!-- 右边 -->
          <div class="right">
            <!-- 图片 -->
            <img :src="order.pimg" alt="">
            <!-- 商品详情 -->
            <div class="pdetail">
               <p class="title">{{order.iintroduc}}</p>
               <p class="price">￥{{order.goodsprice}}</p>
               <div class="btn">
                 <button >-</button>
                 <input type="text" v-model="value[o]">
                 <button>+</button>
               </div>
               
            </div> 
          </div>
          <!-- 删除图标 -->
          <button class="del" :data-i="o">x</button>
        </li>
      </ul>
    </div>
    <!--底部提交订单栏  -->
    <div class="floor">
      <van-submit-bar :price="total" button-text="提交订单">
        <van-checkbox
          v-model="checked"
          checked-color="#ff6699"
          @click="checkAll"
          >全选</van-checkbox
        >
      </van-submit-bar>
    </div>
  </div>
</template>
<script>
import { Dialog } from "vant";
export default {
  data() {
    return {

      order: [], //获取的数据库中所有的订单信息
      value: [], //步进器的值
      checked: false, //卡片头的选择框
      result: [], //卡片的复选框
      resultCard: [], //商品内容的复选框
    };
  },
  methods: {

    // 删除数据
    del(e){
      // var ul=document.getElementById("ul");
      // var del=ul.querySelectorAll("li>.del")
      console.log(e)
      if(e.target.button.innerHTML=='X'){
        var o=e.target.dataset.i;
        console.log(o)
        this.order.splice(o,1);
      }
    },

    // position 为关闭时点击的位置
    // instance 为对应的 SwipeCell 实例
    beforeClose({ position, instance }) {
      switch (position) {
        case "left":
        case "Checkbox":
        case "outside":
          instance.close();
          break;
        case "right":
          Dialog.confirm({
            message: "确定删除改商品吗？",
          })
            .then(() => {
              // instance.close();
              
              console.log("确定");
            })
            .catch(() => {
              // on cancel
            });
          break;
      }
    },

    // 发送请求获取订单详情信息
    getOrder() {
      this.axios.get("/cars/getinfo").then((res) => {
        console.log(res.data.data);
        this.order = res.data.data;
        // 遍历得到的数据，把每个商品购买的数量push到value中
        for (var key of res.data.data) {
          this.value.push(key.goodsSum);
        }
      });
    },

    // 点击全选
    checkAll() {
      this.$refs.checkboxGroup.toggleAll();
    },
  },
  mounted() {
    this.getOrder();
  },
  computed:{
    // 计算总和
    total(){
      var total=0;
      for(var p of this.order){
        total+=p.goodsSum*p.cost*100
    
      }
      return total;
    }
  }
};
</script>
<style lang="scss">
.order {
  // 订单界面
  .frame {
    ul{
      li{
        margin-bottom: 2vh;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 19vh;
        background-color:white ;
        button{
          width:5vw;
          height: 2.6vh;
          border-radius: 50%;
          border:1px solid #555;
          margin-left: 2vw;
        }
        .right{
          margin-left: 2vw;
          width:81vw;
          height:15vh ;
          background-color: lightcoral;
          display: flex;
          justify-content: space-between;
          img{
            width: 20vw;
            height: 13wh;
            background-color: lightgreen;
           
          }
          .pdetail{
            width: 60vw;
            p{
              margin:0;
            }
            .title{
              color:#555;
              font-size: 0.9em;
            }
            .price{
              color:#ff6699;
              font-size: 1.1em;
              font-weight: 600;
              margin:0.9vh 0;
            }
            .btn{
              display: flex;
               button{
              width:6vw;
              height: 4vh;
              border-radius: 1vw;
              border: 0;
              font-size: 1.4em;
              color: #555;
              text-align: center;
              margin:0;
            }
            input{
              width:5vw;
              height: 3.5vh;
              border:none;
              text-align: center;
            }
            }
           
          }
        }
        .del{
          border-radius: 0;
          width:7vw;
          height: 10vh;
         font-size: 1.5em;
         color:#555;
         text-align: center;
         border:none;
         background-color: transparent;
        //  margin-right: 3vw;
     
        }
      }
    }
  }
}
</style>