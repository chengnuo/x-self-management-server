'use strict';

const Controller = require('egg').Controller;

function toInt(str) {
  if (typeof str === 'number') return str;
  if (!str) return str;
  return parseInt(str, 10) || 0;
}

class HomeController extends Controller {
  async index() {
    const ctx = this.ctx;
    const query = {
      limit: toInt(ctx.query.limit),
      offset: toInt(ctx.query.offset),
    };
    ctx.body = await ctx.model.User.findAll(query);
    // ctx.body = 'hi, egg';
  }
  
  // 登录
  async signIn() {
    const ctx = this.ctx;
    const query = {
      limit: toInt(ctx.query.limit),
      offset: toInt(ctx.query.offset),
    };
    const resData = await ctx.model.User.findAll(query);

    ctx.body = {
      data: resData,
      status: 200,
      message: '登录成功',
      token: 'jiade',
    };
    // ctx.body = 'hi, egg';
  }

  // 登出
  async signOut() {
    const ctx = this.ctx;
    const query = {
      limit: toInt(ctx.query.limit),
      offset: toInt(ctx.query.offset),
    };
    ctx.body = await ctx.model.User.findAll(query);
    // ctx.body = 'hi, egg';
  }

  // 用户信息
  async userInfo() {
    const ctx = this.ctx;
    const query = {
     
    };
    ctx.body = await ctx.model.User.findByPk(toInt(ctx.params.id));
    // ctx.body = 'hi, egg';
  }

}

module.exports = HomeController;
