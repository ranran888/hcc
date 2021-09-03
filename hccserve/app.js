//引入express模块
const express=require('express');
//引入用户路由器模块
const userRouter = require('./router/user.js');
//引入商品路由器模块
const productRouter = require('./router/product.js');
//引入轮播动画路由器模块
const carouselRouter =require('./router/carousel.js');
//引入购物车路由器模块
const carRouter =require('./router/car.js');
//引入body-parser中间件
const bodyParser = require('body-parser');
//创建web服务器
const app=express();
// //设置端口
// app.listen(6060);


// // 加载CORS模块
// const cors = require('cors');
// // 使用CORS中间件
// app.use(function(req,res,next){
// 	res.header('Access-Control-Allow-Origin', '*');
// 	next();
// })
// 加载CORS模块
// const cors = require('cors');
// // 使用CORS中间件
// app.use(cors({
//   origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
// }));


//使用body-parser中间件将所有post请求的数据解析为对象
app.use( bodyParser.urlencoded({
  extended: false //是否使用第三方模块解析为对象
}) );

//挂载路由器
//挂载用户路由器，添加前缀/users
app.use('/users',userRouter);
//挂载商品路由器，添加前缀/products
app.use('/products',productRouter);
//挂载轮播动画路由器，添加前缀/carousels
app.use('/carousel',carouselRouter);
//挂载购物车路由器，添加前缀/cars
app.use('/cars',carRouter);


//托管静态资源
app.use(express.static('./public'));

//添加错误处理中间件，拦截所有产生的错误
app.use( (err,req,res,next)=>{
  //err 拦截到的错误
  console.log(err);
  //一旦出现响应500，服务器端错误
  res.send({code: 500, msg:'服务器端错误'});
} )

// 指定服务器对象监听的端口号
app.listen(6060, () => {
  console.log('server is running...');
});