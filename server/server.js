const express = require('express');
const app = express();

const path = require('path');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


// app.all('*', function(req, res, next) {
//   res.header("Access-Control-Allow-Origin", "http://localhost:8081/user/add");
//   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//   res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
//   res.header("X-Powered-By",' 3.2.1')
//   res.header("Content-Type", "application/json;charset=utf-8");
//   next();
// });

/**
 * 解决跨域
 */
const cors = require('cors');
const corsOptions = {
  origin: '*',
  optionSuccessStatus: 200
};
app.use(cors(corsOptions));

const morgan = require('morgan');
app.use(morgan('combined'));

const md5 = require('md5');

const multer = require('multer');
const storage = multer.diskStorage({
  destination(req, res, cb) {
    cb(null, './resource');
  },
  filename(req, file, cb) {//获取文件名和扩展名
    const fileNameArr = file.originalname.split('.');
    const fileName = `${md5(fileNameArr[0])}.${fileNameArr[1]}`;
    cb(null, fileName);
  }
});
app.use(multer({ storage }).any());

const db = require('./config/db.config');

const cookie = require('cookie-parser');

/* db.sequelize.sync({ force: true }).then(() => {
  console.log('重建表');
}); */
require('./route/user.route')(app);
require('./route/file.route')(app);

//  创建服务器
let server = app.listen(process.env.PORT || 8081, () => {
  //let host = server.address().address;
  let host = '0.0.0.0';
  let port = server.address().port;
  console.log('started at: http://%s:%s', host, port);
});
