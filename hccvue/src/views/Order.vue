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
        <div class="cards">
          <div class="card-detail">
            <van-swipe-cell>
              <van-checkbox name="1">
                <div class="product-card">
                  <van-card
                    price="2.00"
                    desc="描述信息"
                    title="商品标题"
                    thumb="https://img01.yzcdn.cn/vant/ipad.jpeg"
                  >
                    <template #tags>
                      <van-tag plain type="danger">标签</van-tag>
                      <van-tag plain type="danger">标签</van-tag>
                    </template>
                    <template #footer>
                      <van-stepper v-model="value" integer />
                    </template>
                  </van-card>
                </div>
              </van-checkbox>
              <template #right>
                <van-button square type="danger" text="删除" />
              </template>
            </van-swipe-cell>
          </div>
        </div>

        <!-- 第二张卡片 -->
        <van-swipe-cell>
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
        </van-swipe-cell>
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
export default {
  data() {
    return {
      value: 1, //步进器的值
      checked: false, //卡片头的选择框
      result: [], //卡片的复选框
      resultCard: [], //商品内容的复选框
    };
  },
  methods: {
    // 点击全选
    checkAll() {
      this.$refs.checkboxGroup.toggleAll();
    },
  },
};
</script>
<style lang="scss">
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