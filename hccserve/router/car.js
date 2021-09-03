//引入express模块
const express = require('express');
//引入连接池模块
const pool = require('../pool.js');
//创建路由器对象
const r = express.Router();


//添加路由
//1.传递订单详情(post /reg)
//http://127.0.0.1:6060/cars/info
r.post('/info',(req,res,next)=>{
  //1.1获取post请求的数据
  console.log(req);
  let obj = req.body;
  console.log(obj);
  // 1.2验证各项数据是否为空
  if(!obj.user_id){
	//json方法将js对象转为json对象
	//json和send作用一样的
    res.send({code: 401, msg: 'user_id不能为空'});
	//阻止往后执行
	//这是函数内，使用return
	return;
  }
  //练习：完成其它各项的验证
  if(!obj.product_id){
    res.send({code: 402,msg: 'product_id不能为空'});
	return;
  }
  
  if(!obj.style){
    res.send({code: 403,msg: 'style不能为空'});
	return;
  }
  if(!obj.size){
    res.send({code: 404,msg: 'size不能为空'});
	return;
  }
  if(!obj.goodsprice){
    res.send({code: 405,msg: 'goodsprice不能为空'});
	return;
  }
  if(!obj.goodsSum){
    res.send({code: 406,msg: 'goodsSum不能为空'});
	return;
  }
  
  //1.3执行SQL命令
  pool.query('insert into orderr set ?',[obj],(err,result)=>{
    if(err){       
	  //如果数据库执行出现错了，交给下一个错误处理的中间件
	  next(err);
	  //阻止往后执行
	  return;
	}
	console.log(result);
	//表示插入成功
	res.send({code: 200,msg: '发送成功',data:result});
  });
});


//2.传递订单详情(get /reg)
//http://127.0.0.1:6060/cars/getinfo
r.get('/getinfo',(req,res,next)=>{
  //1.1获取post请求的数据
  console.log(req);
  let obj = req.query;
  console.log(obj); 
  //1.3执行SQL命令
  pool.query('select * from orderr',(err,result)=>{
    if(err){       
	  //如果数据库执行出现错了，交给下一个错误处理的中间件
	  next(err);
	  //阻止往后执行
	  return;
	}
	console.log(result);
	//表示获取成功
	res.send({code: 200,msg: '获取成功',data:result});
  });
});



//导出路由器对象
module.exports = r;