'use strict';

const Controller = require('egg').Controller;
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const jwt = require('jsonwebtoken');

function toInt(str) {
  if (typeof str === 'number') return str;
  if (!str) return str;
  return parseInt(str, 10) || 0;
}

class HomeController extends Controller {
  // 登录
  async signIn() {
    const ctx = this.ctx;
    const {
      username,
      password,
    } = ctx.request.body;

    const query = {
      attributes: {
        exclude: ['password'],
      },
      where: {
        name: username,
        password,
      },
    }
    const resData = await ctx.model.User.findOne(query);

    const token = jwt.sign({
      userId: resData.id,
      username: resData.name,
    }, ctx.app.config.jwt.secret, {
      expiresIn: '60s', // 时间根据自己定，具体可参考jsonwebtoken插件官方说明
    });
    const resDataUpdate = await resData.update({
      id: resData.id,
      token,
    });
    this.ctx.cookies.set('token', token, {
      maxAge: 60 * 1000,
      httpOnly: false,
      overwrite: true,
      signed: false,
    });

    ctx.body = {
      data: resData,
      status: 200,
      message: '登录成功',
      token,
    };
  }
  // 登出
  async signOut() {
    const ctx = this.ctx;
    if (ctx.request.header.authorization) {
      let token = ctx.request.header.authorization.split(' ')[1];
      const query = {
        attributes: {
          exclude: ['password'],
        },
        where: {
          token,
        },
      }
      const resData = await ctx.model.User.findOne(query);
      const resDataUpdate = await resData.update({
        id: resData.id,
        token: '',
      });
      ctx.body = {
        status: 200,
        message: '登出成功',
      };
    } else {
      ctx.body = {
        status: 401,
        message: '没有可用的token',
      };
    }
  }
  // 用户列表
  async index() {
    const ctx = this.ctx;
    const limit = Number(ctx.query.limit) || 10; // 第几页
    const offset = Number(ctx.query.offset - 1) * Number(ctx.query.limit) || 0; // 每页几个
    const queryName = ctx.query.name || '';
    const query = {
      limit,
      offset,
      attributes: {
        exclude: ['password'],
      },
      where: {
        name: {
          [Op.like]: `%${queryName}%`,
        },
      },
    };
    const resData = await ctx.model.User.findAndCountAll(query);
    ctx.body = {
      data: resData.rows,
      status: 200,
      message: '获取列表成功',
      total: resData.count,
    };
  }
  // 详情
  async show() {
    const ctx = this.ctx;
    const resDataFindByPk = await ctx.model.User.findByPk(ctx.params.id);
    ctx.body = {
      data: resDataFindByPk,
      status: 200,
      message: '获取详情成功',
    };
  }
  // 创建
  async create() {
    const ctx = this.ctx;
    const {
      name,
      phone,
      avatarUrl,
    } = ctx.request.body;
    const resPhone = await ctx.model.User.findOne({
      where: {
        phone,
      },
    });
    if (resPhone && resPhone.id) {
      ctx.body = {
        status: 500,
        message: '电话号码已存在',
      };
    } else {
      const resData = await ctx.model.User.create({
        name,
        phone,
        avatarUrl,
      });
      ctx.body = {
        data: resData,
        status: 200,
        message: '创建成功',
      };
    }
  }
  // 更新
  async update() {
    const ctx = this.ctx;
    const {
      name,
      phone,
      avatarUrl,
      id,
    } = ctx.request.body;
    const resDataFindByPk = await ctx.model.User.findByPk(id);
    if (!resDataFindByPk) {
      ctx.status = 404;
      return;
    }
    await resDataFindByPk.update({
      id,
      name,
      phone,
      avatarUrl,
    });

    ctx.body = {
      status: 200,
      message: '更新成功',
    };

  }
  // 删除，逻辑更新
  async destroy() {
    const ctx = this.ctx;
    const {
      id,
      deletedAt,
    } = ctx.request.body;
    const resDataFindByPk = await ctx.model.User.findByPk(id);
    if (!resDataFindByPk) {
      ctx.status = 404;
      return;
    }
    await resDataFindByPk.update({
      id,
      deletedAt,
    });
    ctx.body = {
      status: 200,
      message: '删除成功',
    };
  }
}

module.exports = HomeController;