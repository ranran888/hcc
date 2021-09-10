<template>
  <div class="order">
    <!-- 订单界面 -->
    <div class="frame" style="position:relative">
      <div class="ic" style="position:absolute;
       z-index:1000;top:0;left:0;width:10vw;height:5vh;">
        <van-icon name="arrow-left" color="#8888" size="1.7rem" @click="push"/>
      </div>
      <ul id="ul" @click="del">
        <li v-for="(order,o) of order" :key="o">
          <!-- 左边选择框 -->
          <input type="checkbox" id="input" v-model="order.ischeck">
          <!-- 右边 -->
          <div class="right">
            <!-- 图片 -->
            <img :src="order.pimg" alt="">
            <!-- 商品详情 -->
            <div class="pdetail">
               <p class="title">{{order.iintroduc}}</p>
               <p class="price">￥{{(order.goodsSum*order.cost).toFixed(2)}}</p>
               <div class="btn">
                 <button :data-o="o" :data-n="-1">-</button>
                 <input type="text" v-model="order.goodsSum">
                 <button  :data-o="o" :data-n="+1">+</button>
               </div>
               
            </div> 
          </div>
          <!-- 删除图标 -->
          <button class="del" :data-i="order.id" :data-o="o">x</button>
        </li>
      </ul>
    </div>
    <!--底部提交订单栏  -->
    <div class="floor">
      <van-submit-bar :price="total" button-text="提交订单">
        <!-- <van-checkbox
          v-model="checked"
          checked-color="#ff6699"
          @click="checkAll"
          >全选</van-checkbox
        > -->
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
      // value: [], //步进器的值
      checked: false, //卡片头的选择框
      result: [], //卡片的复选框
      resultCard: [], //商品内容的复选框
    };
  },
  methods: {
    push(){
      
        history.go(-1)
      
    
   },
    // change(n,o){
    //   this.order[o].goodsSum+=n;
    //   // console.log(this.order[o].goodsSum)
    //   if(this.order[o].goodsSum==0){
    //     this.order.splice(o,1)
    //   }
    // },

    // 删除数据
    del(e){
      // var ul=document.getElementById("ul");
      // var del=ul.querySelectorAll("li>.del")
      console.log(e)
      if(e.target.nodeName=="BUTTON"){
        var i=e.target.dataset.i;
        var o=e.target.dataset.o;
        console.log(i)
        if(e.target.innerHTML=="x"){
           this.order.splice(o,1)
        this.axios.get('/cars/del',{params:{id:i}}).then((res)=>{
          console.log(res)

        })  
      
        }else{
          var o=e.target.dataset.o;
          console.log(o)
          this.order[o].goodsSum+=parseInt(e.target.dataset.n);
          // console.log(this.value)
          if(this.order[o].goodsSum==0){
            this.order.splice(o,1)
          }
        }
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
        console.log(this.order)
        // var count=0
        // for (var i=0;i<this.order.length;i++){
        //   count+=1;
        // }
        // console.log(count)
        // this.count=count
        // 遍历得到的数据，把每个商品购买的数量push到value中
        // for (var key of res.data.data) {
        //   this.value.push(key.goodsSum);
        //   console.log(this.value)
        // }
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
        if(p.ischeck){
        total+=p.goodsSum*p.cost*100
        }
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
    margin-bottom: 9vh;
    ul{
      li{
        margin-bottom: 2vh;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 19vh;
        background-color:white ;
        #input{
          width:5vw;
          height: 2.6vh;
          border-radius: 50%;
          border:1px solid #555;
          border:none;
          margin-left: 2vw;
        }
        .right{
          margin-left: 2vw;
          width:81vw;
          height:15vh ;
          // background-color: lightcoral;
          display: flex;
          justify-content: space-between;
          img{
            width: 20vw;
            height: 13wh;
            // background-color: lightgreen;
           
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