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
    const resData = await ctx.model.SoftwareTest.findAndCountAll(query);
    ctx.body = {
      data: {
        list: resData.rows,
        total: resData.count,
      },
      status: 200,
      message: '获取列表成功',
    };
  }
  // 详情
  async show() {
    const ctx = this.ctx;
    const resDataFindByPk = await ctx.model.SoftwareTest.findByPk(ctx.params.id);
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


    const resName = await ctx.model.SoftwareTest.findOne({
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
      const resData = await ctx.model.SoftwareTest.create({
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
    const resDataFindByPk = await ctx.model.SoftwareTest.findByPk(id);
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
    const resDataFindByPk = await ctx.model.SoftwareTest.findByPk(id);
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