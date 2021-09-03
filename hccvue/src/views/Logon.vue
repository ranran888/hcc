<template>
  <div class="logon">
    <!-- 背景 -->
    <div class="bg">
      <img src="/img/login/logo_white.png" alt="" />
    </div>
    <!-- 表单 -->
    <div class="dl">
      <van-form @submit="onSubmit" :validate-first="true"
      :scroll-to-error="true" error-message-align="center">
        <van-field
          v-model="username"
          name="lname"
          label="用户名"
          placeholder="用户名"
          :rules="[{ required: true,message: '请输入6-15位的数字或大小写英文字母' ,pattern}]"
        />
        <van-field
          v-model="password"
          type="密码"
          name="lpwd"
          label="密码"
          placeholder="密码"
          :rules="[{ required: true, message: '请输入6-15位的数字或大小写英文字母' ,pattern }]"
        />
        <div style="margin: 16px">
          <van-button round block type="info" native-type="submit"
            >提交</van-button
          >
        </div>
      </van-form>
      <router-link to="/reg">注册</router-link>
    </div>
    <!-- 其他地方登录 -->
    <div class="it">
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
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      pattern:/^\w{6,15}$/
    };
  },
  methods: {
    onSubmit(values) {
      console.log('submit', values);
      this.axios.post('/users/login',
       `lname=${values.lname}&lpwd=${values.lpwd}`
      ).then((res)=>{
        console.log(res.data);
          if(res.data.code==200){//登录成功
            alert("登录成功");
            this.$store.commit('loginOk',this.username);
            //把islogin和name存入sessionStorage
            sessionStorage.setItem('islogin',true);
            sessionStorage.setItem('name',this.username);
            this.$router.push('/'); 
          }else if(res.data.code==201){//登录失败
           alert("账号或密码错误");
          }
      })
    },
  },
};
</script>
<style lang="scss">
.logon {
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
    height: 40vh;
    border:1px solid #ddd;
    background-color: white;
    border-radius: 2vw;
    position:absolute;
    left:4vw;
    top:28vh;
    .van-form{
      margin:6vh 0 0;
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
  .it{
    width:100%;
    position:fixed;
    bottom:10vh;
    .itnet{
      width:92vw;
      margin:0 auto;
      display:flex;
      justify-content: space-around;
      img{
      width:30vw;
      height: 1.5vh;
    }
    span{
      color:#ff6699;
      font-size: 0.8rem;
      text-align: center;
    }
   }
    .others{
       width:92vw;
      margin:2vh auto 0;
      display:flex;
      justify-content: space-around;
      img{
        width:10vw;
        height: 6vh;
      
      }
    }
  }
}
</style>