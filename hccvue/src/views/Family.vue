<template>
  <div class="family">
     <van-tree-select height="100vh" style="text-align:center" :items="items" :main-active-index.sync="active">
  <template #content>
    <van-image
      v-if="active === 0"
      src="https://img01.yzcdn.cn/vant/apple-1.jpg"
    />
    <van-image
      v-if="active === 1"
      src="https://img01.yzcdn.cn/vant/apple-2.jpg"
    />
  </template>
</van-tree-select>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: 0,
      items: [{ text: '热门品牌' }, { text: '女装' }, { text: '男装' }, { text: '汉元素' }, { text: '童装' }, { text: '内衣' }, { text: '配饰' }, { text: '美妆' }, { text: '文玩' }, { text: '文创' }],
    };
  },
}
</script>
<style lang="scss">
.family .van-tree-select__nav{
    width:50vw;
}
   .family{
     .van-tree-select__nav{
        a{
          font-size: 0.7rem;
        }
         a:active{
          color:#ff6699
        }
         a::before{
          color:#ff6699
        }
        .van-sidebar-item--select::before{
          background-color: #ff6699;
          color: #ff6699;
          height: 3.125rem;
        }
     }
   }
</style>