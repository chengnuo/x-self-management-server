# self-management

self-management

## QuickStart

<!-- add docs here for user -->

see [egg docs][egg] for more detail.

### Development

```bash
$ npm i
$ npm run dev
$ open http://localhost:7001/
```

### Deploy

```bash
$ npm start
$ npm stop
```

### npm scripts

- Use `npm run lint` to check code style.
- Use `npm test` to run unit test.
- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.


[egg]: https://eggjs.org




组件 | 描述 | 链接
---|---|---
egg | egg核心组建
egg-scripts | egg项目部署工具
moment | JavaScript 日期处理类库 | [momentjs](http://momentjs.cn/)
egg-mysql | egg-mysql 数据库 | [egg-mysql](https://github.com/eggjs/egg-mysql)
egg-sequelize | Sequelize for Egg.js | [egg-sequelize](https://github.com/eggjs/egg-sequelize)
egg-security | 解决 invalid csrf token | egg-security
egg-cors | 解决黑白名单 | egg-cors




# 问题汇总

问题 | 描述 | 解决
---|---|---
使用sequelize操作数据库 时间格式化 | 用sequelize去取数据库中date类型的时间，得到的是：2019-04-24T08:57:58.000Z | [参考链接](https://segmentfault.com/a/1190000020009630)


