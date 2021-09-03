//引入express模块
const express = require('express');
//引入连接池模块
const pool = require('../pool.js');
//创建路由器对象
const r = express.Router();



//添加路由
//1.用户注册(post /reg)
//http://127.0.0.1:6060/users/reg
r.post('/reg',(req,res,next)=>{
  //1.1获取post请求的数据
  console.log(req);
  let obj = req.body;
  console.log(obj);
  //1.2验证各项数据是否为空
  // if(!obj.lname){
	// //json方法将js对象转为json对象
	// //json和send作用一样的
  //   res.send({code: 401, msg: 'lname不能为空'});
	// //阻止往后执行
	// //这是函数内，使用return
	// return;
  // }
  // //练习：完成其它各项的验证
  // if(!obj.lpwd){
  //   res.send({code: 402,msg: 'lpwd不能为空'});
	// return;
  // }
  
  // if(!obj.lphone){
  //   res.send({code: 404,msg: 'lphone不能为空'});
	// return;
  // }
  //验证手机号码格式
  //正则表达式.test(手机号码)
  //如果手机号码格式不正确
  if( !/^1[3-9]\d{9}$/.test( obj.lphone ) ){
    res.send({code: 405,msg: '手机号码格式错误'});
	return;
  }
  //1.3执行SQL命令
  pool.query('insert into user set ?',[obj],(err,result)=>{
    if(err){       
	  //如果数据库执行出现错了，交给下一个错误处理的中间件
	  next(err);
	  //阻止往后执行
	  return;
	}
	console.log(result);
	//表示插入成功
	res.send({code: 200,msg: '注册成功'});
  });
});
//2.用户登录(post /login)
//http://127.0.0.1:6060/users/login
r.post('/login',(req,res,next)=>{
  //2.1获取post传递的数据
  let obj = req.body;
  console.log(obj);
  //2.2验证各项数据是否为空
  if(!obj.lname){
    res.send({code: 401,msg: 'lname不能为空'});
	return;
  }
  if(!obj.lpwd){
    res.send({code: 402,msg: 'lpwd不能为空'});
	return;
  }
  //2.3执行SQL命令
  pool.query('select * from user where lname=? and lpwd=?',[obj.lname,obj.lpwd],(err,result)=>{
    if(err){
	  //如果有错误交给下一个中间件处理
	  next(err);
	  return;
	}
	console.log(result);
	//查询的结果是数组，如果是空数组说明登录失败，否则登录成功
	if(result.length === 0){
	  res.send({code: 201,msg: '登录失败'});
	}else{
	  res.send({code: 200,msg: '登录成功'});
	}
  });  
});
//3.修改用户(put /)
//http://127.0.0.1:6060/users/
r.put('/',(req,res,next)=>{
  //3.1获取post传递的数据(lid、lphone、lname)
  let obj = req.body;
  console.log(obj);
  //3.2验证各项数据是否为空
  let i = 400;//记录状态码
  for(let k in obj){
	//每次遍历一个属性，状态码加1
	i++
    //k 属性名   obj[k]  属性值
	//console.log(k, obj[k]);
	//如果属性值为空，提示属性名这项不能为空
	if(!obj[k]){
	  res.send({code: i,msg: `${k}不能为空`});
	  return;
	}
  }
  //验证手机号码格式
  //正则表达式.test(手机号码)
  //如果手机号码格式不正确
  if( !/^1[3-9]\d{9}$/.test( obj.lphone ) ){
    res.send({code: 405,msg: '手机号码格式错误'});
	return;
  }
  //3.3执行SQL命令，修改用户的数据
  pool.query('update user set ? where lid=?',[obj,obj.lid],(err,result)=>{
    if(err){
	  //如果有错误，交给下一个错误处理中间件
	  next(err);
	  return;
	}
	console.log(result);
	//结果是对象，如果对象下的affectedRows的值是0说明修改失败，否则修改成功
	if(result.affectedRows === 0){
	  res.send({code: 201,msg: '修改失败'});
	}else{
	  res.send({code: 200, msg: '修改成功'});
	}
  });
});
//4、查询用户（get /编号）
//http://127.0.0.1:6060/v1/users/4
r.get('/:lid',(req,res,next)=>{
	//4.1获取传递的参数
   let obj =req.params;
   console.log(obj);
   //4.2执行SQL语句
  pool.query('select lid,lname,lphone from user where lid=?',[obj.lid],(err,result)=>{
     if(err){
	    next(err);
		return;
	 }
	 console.log(result);
	 //结果是数组，如果是空数组说明该用户不存在，否则查找成功
	 if(result.length===0){
	   res.send({code:201,msg:'该用户不存在'});
	 }else{
	   res.send({code:200,msg:'查询成功',data:result});
	 }
  });  
});


//5.删除用户（delete  /编号）
//http://127.0.0.1:6060/users/7
r.delete('/:lid',(req,res,next)=>{
  //5.1获取传递的参数（路由传参）
  let obj = req.params;
  console.log(obj);
  //5.2执行SQL语句
  pool.query('delete from user where lid=?',[obj.lid],(err,result)=>{
     if(err){
     next(err);
     return;
   }
   console.log(result);
   //结果是一个对象，如果对象下的affectedRows为0说明产出失败
   if(result.affectedRows===0){
      res.send({code:201,msg:'删除失败'});
   }else{
      res.send({code:200,msg:'删除成功'}); 
   }
  });   
});


//6用户列表（get  /）
//127.0.0.1:6060/users/
r.get('/',(req,res,next)=>{
  //6.1获取查询字符串
  let obj = req.query;
  //6.2验证是否为空，如果为空，设置默认值为第一页
  if(!obj.pno) obj.pno = 1;
  
  if(!obj.count) obj.count = 5;
  console.log(obj);
  //6.3计算开始查询的值
  let stat =(obj.pno-1)*obj.count;
  //6.4把每页的数据量转为数值型
  let size = parseInt(obj.count);
  //6.5执行SQ的分页查询
  pool.query('select lid,lname,lphone from user limit ?,?',[stat,size],(err,result)=>{
     if(err){
      next(err);
    return;
   }
   console.log(result);
   res.send({code:200,msg:'查找成功',data:result});//查询的结果是数组，把数组响应给浏览器  
  });
  
});

//导出路由器对象
module.exports = r;