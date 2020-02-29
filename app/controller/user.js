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

  // 用户列表
  async getList() {
    const ctx = this.ctx;


    //  let limit = (ctx.request.body.limit-1) || 0;
    //  let offset = limit * ctx.request.body.offset || 10;

    const limit = Number(ctx.request.body.limit) || 10; // 第几页
    const offset = Number(ctx.request.body.offset - 1) * Number(ctx.request.body.limit) || 0; // 每页几个


    const query = {
      limit,
      offset,
    };
    // console.log('query', query)
    // const resItems = await ctx.model.User.findAll(query);

    // console.log('resItems', resItems);
    const resData = await ctx.model.User.findAndCountAll(query);
    // console.log('resData', resData)
    ctx.body = {
      data: resData.rows,
      status: 200,
      message: '获取列表成功',
      total: resData.count,
    };
    // ctx.body = 'hi, egg';
  }

}

module.exports = HomeController;
