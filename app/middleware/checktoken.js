'use strict';

// 参考 https://blog.csdn.net/JiangYuXuan1994/article/details/80196090

module.exports = () => {
  const jwt = require('jsonwebtoken');
  return async (ctx, next) => {
    if (ctx.request.header.authorization) {
      let token = ctx.request.header.authorization.split(' ')[1];
      console.log(token);
      let decoded = {};
      // 解码token
      try {
        decoded = jwt.verify(token, ctx.app.config.jwt.secret);
        console.log('decoded', decoded);
      } catch (error) {
        if (error.name === 'TokenExpiredError') {
          console.log('时间到期');
          // 重新发放令牌
          const query = {
            attributes: {
              exclude: [ 'password' ],
            },
            where: {
              token,
            },
          }
          const resData = await ctx.model.User.findOne(query);
          token = jwt.sign({
            userId: resData.id,
            username: resData.name,
          }, ctx.app.config.jwt.secret, {
            expiresIn: '60s', // 过期时间设置为60妙。那么decode这个token的时候得到的过期时间为 : 创建token的时间 + 设置的值
          });
          ctx.cookies.set('token', token, {
            maxAge: 60 * 1000,
            httpOnly: false,
            overwrite: true,
            signed: false,
          });
        } else {
          ctx.status = 401;
          ctx.body = {
            message: 'token失效',
            status: 401,
          };
          return;
        }
      }
      // 重置cookie时间
      ctx.cookies.set('token', token, {
        maxAge: 60 * 1000,
        httpOnly: false,
        overwrite: true,
        signed: false,
      });
      await next();
    } else {
      ctx.status = 401;
      ctx.body = {
        message: '没有token',
        status: 401,
      };
      return;
    }
  };
};
