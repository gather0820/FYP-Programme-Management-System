const env = require('./env.js');
const Sequelize = require('sequelize');

const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,
  define:{
    timestamps: false
  },

  pool: {
    max: env.max,
    min: env.pool.min,
    acquire: env.pool.acquire,
    idle: env.pool.idle
  }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

// 引入表模型,数据库表将根据表模型生成
//Table model is introduced and database tables will be generated from the table model
db.user = require('../model/user.model')(sequelize, Sequelize);
db.file = require('../model/file.model')(sequelize, Sequelize);
db.share = require('../model/share.model')(sequelize, Sequelize);
db.verification = require('../model/verification.model')(sequelize, Sequelize);

module.exports = db;
