//引入express模块
const express = require('express');
//引入连接池模块
const pool = require('../pool.js');
//创建路由器对象
const r = express.Router();


//添加路由
//1查询导航分类表 (get /nav)
////http://127.0.0.1:6060/products/nav
r.get('/nav', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from nav_family', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '该信息不存在'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});
//1.1通过导航类别的 nclass 来查询导航详细分类表 (get /nav)
////http://127.0.0.1:6060/products/nclass
r.get('/nclass', (req, res, next) => {
  //4.1获取传递的参数
  let nclass = req.query.nclass;
  console.log(nclass);
  //4.2执行SQL语句
  pool.query('select * from nav_family_family where nav_class=?', [nclass], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '该信息不存在'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});


//2查询商品信息表 (get /details)
////http://127.0.0.1:6060/products/details
r.get('/details', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from details', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '未查询到商品信息'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});
//2.1通过导航类别查询首页拼团等商品信息表 (get /nav_class)
////http://127.0.0.1:6060/products/nav_class
r.get('/nav_class', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query.dclass;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from details where dclass=?', [obj], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '未查询到商品信息'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});
//2.2通过导航类别查询商品信息表 (get /nav_class)
////http://127.0.0.1:6060/products/nclass
r.get('/nclass', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query.nclass;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from details where dclass=?', [obj], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '未查询到商品信息'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});
//2.3通过商品id查询单个商品信息 (get /detail)
////http://127.0.0.1:6060/products/detail
r.get('/detail', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query.product_id;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from details where product_id=?', [obj], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '未查询到商品信息'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});
//2.4通过商品id查询单个商品款式 (get /detail)
////http://127.0.0.1:6060/products/pattern
r.get('/pattern', (req, res, next) => {
  //4.1获取传递的参数
  let obj = req.query.product_id;
  console.log(obj);
  //4.2执行SQL语句
  pool.query('select * from pattern where pproduct_id=?', [obj], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length === 0) {
      res.send({
        code: 201,
        msg: '未查询到商品信息'
      });
    } else {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
    }

    console.log(result);

  });
});




// 3搜索栏的模糊查询
////http://127.0.0.1:6060/products/search
r.get('/search', (req, res, next) => {
  //4.1获取传递的参数
  let kw = req.query.kw;
  console.log(kw);
  //4.2执行SQL语句
  var sql1 = `select * from details where d_brind=(select bid from brind where btitle like '%${kw}%')`;
  var sql2 = `select * from details where dclass=(select nclass from nav_family where title like '%${kw}%')`;
  pool.query(sql1, [], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    //结果是数组，如果是空数组说明该用户不存在，否则查找成功
    if (result.length !== 0) {
      res.send({
        code: 200,
        msg: '查询成功',
        data: result
      });
      // res.send({
      //   code: 201,
      //   msg: '未查询到商品信息'
      // });
    } else {
      pool.query(sql2, [], (err, result) => {
        if (err) {
          next(err);
          return;
        }
        if (result.length !== 0) {
          res.send({
            code: 200,
            msg: '查询成功',
            data: result
          });
        } else {
          res.send({
            code: 201,
            msg: '未查询到商品信息'
          });
        }
      })

    }

    console.log(result);

  });
});




module.exports = r;