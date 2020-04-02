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
  // 用户列表
  async index() {
    const ctx = this.ctx;
    const limit = Number(ctx.query.limit) || 10; // 第几页
    const offset = Number(ctx.query.offset - 1) * Number(ctx.query.limit) || 0; // 每页几个
    const queryName = ctx.query.name || '';


    console.log(`token================`, ctx.request.header.authorization.split(' ')[1])
    if (ctx.request.header.authorization) {
      const userToken = await ctx.model.User.findOne({
        where: {
          token: ctx.request.header.authorization.split(' ')[1],
        },
      });

      console.log(`userToken================`, userToken.id)

      const query = {
        limit,
        offset,
        attributes: {
          exclude: [`password`],
        },
        where: {
          user_id: `${userToken.id}`,
          name: {
            [Op.like]: `%${queryName}%`,
          },
        },
      };
      const resData = await ctx.model.Npmjs.findAndCountAll(query);
      ctx.body = {
        data: {
          list: resData.rows,
          total: resData.count,
        },
        status: 200,
        message: '获取列表成功',
      };
    } else {
      ctx.body = {
        status: 401,
        message: '没有可用的token',
      };
    }
  }
  // 详情
  async show() {
    const ctx = this.ctx;
    const resDataFindByPk = await ctx.model.Npmjs.findByPk(ctx.params.id);
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
      description,
      url,
    } = ctx.request.body;


    const resName = await ctx.model.Npmjs.findOne({
      where: {
        name,
      },
    });
    if (resName && resName.id) {
      ctx.body = {
        status: 500,
        message: 'npmjs名称已存在',
      };
    } else {
      const resData = await ctx.model.Npmjs.create({
        name,
        description,
        url,
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
      description,
      url,
      id,
    } = ctx.request.body;
    const resDataFindByPk = await ctx.model.Npmjs.findByPk(id);
    if (!resDataFindByPk) {
      ctx.status = 404;
      return;
    }
    await resDataFindByPk.update({
      id,
      name,
      description,
      url,
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
    const resDataFindByPk = await ctx.model.Npmjs.findByPk(id);
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