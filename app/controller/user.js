'use strict';

const Controller = require('egg').Controller;
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

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
    const limit = Number(ctx.request.body.limit) || 10; // 第几页
    const offset = Number(ctx.request.body.offset - 1) * Number(ctx.request.body.limit) || 0; // 每页几个
    const queryName = ctx.request.body.name || '';
    const query = {
      limit,
      offset,
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

  // 用户创建
  async create() {
    const ctx = this.ctx;
    const {
      name,
      phone,
      avatarUrl,
    } = ctx.request.body;
        
    const resName = await ctx.model.User.findOne({
      where: {
        name,
      },
    });
    const resPhone = await ctx.model.User.findOne({
      where: {
        phone,
      },
    });

    if (resName && resName.id) {
      console.log('用户名已存在')
      ctx.body = {
        status: 500,
        message: '用户名已存在',
      };
    } else if (resPhone && resPhone.id) {
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
        resName,
      };
    }
  }


  // 用户更新
  async update() {
    const ctx = this.ctx;
    const {
      name,
      phone,
      avatarUrl,
      id,
    } = ctx.request.body;

    const resName = await ctx.model.User.findOne({
      where: {
        name,
      },
    });
    const resPhone = await ctx.model.User.findOne({
      where: {
        phone,
      },
    });

    if (resName && resName.id) {
      console.log('用户名已存在')
      ctx.body = {
        status: 500,
        message: '用户名已存在',
      };
    } else if (resPhone && resPhone.id) {
      ctx.body = {
        status: 500,
        message: '电话号码已存在',
      };
    } else {
      const resDataFindByPk = await ctx.model.User.findByPk(id);
      if (!resDataFindByPk) {
        ctx.status = 404;
        return;
      }
      const resData = await resDataFindByPk.update({
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
  }

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
    const resData = await resDataFindByPk.update({
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
