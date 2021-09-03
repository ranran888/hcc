<template>
  <div class="reg">
    <!-- 背景 -->
    <div class="bg">
      <img src="/img/login/logo_white.png" alt="" />
    </div>
    <!-- 表单 -->
    <div class="dl">
      <van-form @submit="onSubmit" :validate-first="true"
      :scroll-to-error="true" error-message-align="center"
      >
        <van-field
          v-model="username"
          name="lname"
          label="用户名"
          placeholder="用户名"
          :rules="[{ required: true, message: '请输入6-15位的数字或大小写英文字母' ,pattern}]"
         
        />
        <van-field
          v-model="password"
          type="password"
          name="lpwd"
          label="密码"
          placeholder="密码"
          :rules="[{ required: true, message: '请输入6-15位的数字或大小写英文字母' ,pattern}]"
          
        />
        <van-field
          v-model="phone"
          type="text"
          name="lphone"
          label="电话号码"
          placeholder="电话号码"
          :rules="[{ required: true, message: '电话号码格式错误' ,validator}]"
       
        />
        <div style="margin: 16px">
          <van-button round block type="info" native-type="submit"
            >快速注册</van-button
          >
        </div>
      </van-form>
      <router-link to="/logon">登录</router-link>
    </div>
    <!-- 其他地方登录 -->
    <!-- <div class="it">
      <div class="itnet">
        <img src="/img/login/left_side_line.png" alt="">
        <span>其他登录方式</span>
        <img src="/img/login/right_side_line.png" alt="">
      </div>
      <div class="others">
        <img src="/img/login/icon_qq.png" alt="">
        <img src="/img/login/icon_weibo.png" alt="">
        <img src="/img/login/icon_pass.png" alt="">
      </div>
    </div> -->
  </div>
</template>
<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      phone:'',
      pattern:/^\w{6,15}$/
    };
  },
  methods: {
    // 提交表单时触发
    onSubmit(values) {
      console.log('submit', values);
      console.log(values.lname)
      console.log(values.lpwd)
      console.log(values.lphone)
      this.axios.post('/users/reg',
       `lname=${values.lname}&lpwd=${values.lpwd}&lphone=${values.lphone}`
      ).then((res)=>{
        console.log(res.data)
      })
    },
    validator(val){
      return /^1[3-9]\d{9}$/.test(val);
    }
    // // 用户名验证
    // unameState(){
    //   let reg = /^\w{6,15}$/;
    //   if(reg.test(this.username)){
    //     return true;
    //   }else{
    //     return false;
    //   }
    // },
    // // 密码验证
    // pwdState(){
    //    let reg = /^\d{6}$/;
    //   if(reg.test(this.pwd)){
    //     return true;
    //   }else{
    //     return false;
    //   }
    // },
    // // 电话号码验证
    // phoneState(){
    //    let reg=/^1[3-9]\d{9}$/;
    //   if(reg.test(this.phone)){
    //     //符合
    //     return true;
    //   }else{  
    //     return false;
    //   }
    // },




  },
};
</script>
<style lang="scss">
.reg {
  position:relative;
  // 背景
  .bg {
    background-image: url(/img/login/login-bg.png);
    width: 100%;
    height: 40vh;
    overflow: hidden;
    img {
      width: 40vw;
      height: 10vh;
      display: block;
      margin: 10vh auto;
    }
  }
  // 登录
  .dl{
    width:92vw;
    height: 42vh;
    border:1px solid #ddd;
    border-radius: 2vw;
    background-color: white;
    position:absolute;
    left:4vw;
    top:30vh;
    .van-form{
      margin:5vh 0 0;
    }
    .van-button{
      background-color: #ff6699;
      border-radius: 0.5vw;
      border:none;
      font-size: 1.2rem;
    }
    a{
      text-align: center;
      color:#999;
      display: block;
    }
  }
  // 其他登录
  // .it{
  //   width:100%;
  //   position:fixed;
  //   bottom:5vh;
  //   .itnet{
  //     width:92vw;
  //     margin:0 auto;
  //     display:flex;
  //     justify-content: space-around;
  //     img{
  //     width:30vw;
  //     height: 1.5vh;
  //   }
  //   span{
  //     color:#ff6699;
  //     font-size: 0.8rem;
  //     text-align: center;
  //   }
  //  }
  //   .others{
  //      width:92vw;
  //     margin:2vh auto 0;
  //     display:flex;
  //     justify-content: space-around;
  //     img{
  //       width:10vw;
  //       height: 6vh;
      
  //     }
  //   }
  // }
}
</style>