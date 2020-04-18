//  数据库连接参数
const env = {
  database: 'SDMS',
  username: 'root',
  //password: '123456',
  //host: '192.168.31.236',
  password: '19980820.John',
  host: 'localhost',
  dialect: 'mysql',
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
module.exports = env;
