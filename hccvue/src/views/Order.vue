<template>
  <div class="order">
    <!-- 订单界面 -->
    <div class="frame">
      <!-- 卡片的复选框 -->
      <van-checkbox-group
        v-model="result"
        ref="checkboxGroup"
        checked-color="#ff6699"
      >
        <!-- 第一个卡片 -->
        <div class="cards" v-for="(order, o) of order" :key="o">
          <div class="card-detail">
            <!-- 绑定自定义扩展属性data-i -->
            <van-swipe-cell :before-close="beforeClose">
              <van-checkbox :name="order.id" checked>
                <div class="product-card">
                  <van-card
                    :price="
                      value[o] == order.goodsSum
                        ? order.goodsprice
                        : value[o] * order.cost
                    "
                    :title="order.iintroduc"
                    :thumb="order.pimg"
                  >
                    <template #tags>
                      <van-tag plain type="danger"
                        >样式:{{ order.style }}</van-tag
                      >
                      <van-tag plain type="danger"
                        >尺码:{{ order.size }}</van-tag
                      >
                    </template>
                    <template #footer>
                      <div @click.stop>
                        <van-stepper v-model="value[o]" integer/>
                      </div>
                    </template>
                  </van-card>
                </div>
              </van-checkbox>
              <template #right>
                <van-button
                  square
                  type="danger"
                  text="删除"
                  class="delete-button"
                />
              </template>
            </van-swipe-cell>
          </div>
        </div>

        <!-- 第二张卡片 -->
        <!-- <van-swipe-cell>
          <van-card
            num="2"
            price="2.00"
            desc="描述信息"
            title="商品标题"
            class="goods-card"
            thumb="https://img01.yzcdn.cn/vant/cat.jpeg"
          />
          <template #right>
            <van-button
              square
              text="删除"
              type="danger"
              class="delete-button"
            />
          </template>
        </van-swipe-cell> -->
        <!-- <div class="cards">
          <div class="card-detail">
            <van-checkbox name="2">
              <div class="product-card">
                <van-card
                  num="2"
                  price="2.00"
                  desc="描述信息"
                  title="商品标题"
                  thumb="https://img01.yzcdn.cn/vant/ipad.jpeg"
                />
              </div>
            </van-checkbox>
          </div>
        </div> -->
      </van-checkbox-group>
    </div>
    <!--底部提交订单栏  -->
    <div class="floor">
      <van-submit-bar :price="3050" button-text="提交订单">
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
};
</script>
<style lang="scss">
.goods-card {
  margin: 0;
  // background-color: @white;
}

.delete-button {
  height: 100%;
}

.order {
  // 订单界面
  .frame {
    // padding-left: 3vw;
    .cards {
      background-color: white;
      padding-left: 4vw;
      margin-bottom: 2vh;
      //  卡片复选框的头
      .tou {
        padding: 2vh 0;
        //  复选框圈圈
        .van-checkbox__icon {
          // 复选框文本
          & .van-checkbox__label {
            color: #555;
            width: 80vw;
          }
        }
      }
    }
    //  复选框圈圈
    .van-checkbox__icon {
      margin-right: 3vw;
      // 复选框文本
      .van-checkbox__label {
        color: #555;
      }
    }
    // 卡片商品的内容
    .card-detail {
      .van-card {
        width: 88vw;
      }
    }
  }
}
</style>