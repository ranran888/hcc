//引入express模块
const express = require('express');
//引入连接池模块
const pool = require('../pool.js');
//创建路由器对象
const r = express.Router();



//添加路由
//1、查询首页轮播（get /编号）
//http://127.0.0.1:6060/carousel/banner
r.get('/banner',(req,res,next)=>{
	//4.1获取传递的参数
   let obj =req.query;
   console.log(obj);
   //4.2执行SQL语句
  pool.query('select img from carousel',(err,result)=>{
     if(err){
	    next(err);
		return;
	 }
	 console.log(result);
	 //结果是数组，如果是空数组说明该用户不存在，否则查找成功
	 if(result.length===0){
	   res.send({code:201,msg:'该图片不存在'});
	 }else{
	   res.send({code:200,msg:'查询成功',data:result});
	 }
  });  
});


//导出路由器对象
module.exports = r;