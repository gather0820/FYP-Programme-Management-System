const express = require('express');
const app = express();
app.set('trust proxy', 1)
const path = require('path');

const bodyParser = require('body-parser');

let cookieParser = require('cookie-parser');
let session = require('express-session');
//app.use(cookieParser());
app.use(session({
  secret: 'secret', // 对session id 相关的cookie 进行签名
  resave: true,
  rolling:true,
  saveUninitialized: false, // 是否保存未初始化的会话
  cookie: {
    maxAge: 1000 * 60 * 3, // 设置 session 的有效时间，单位毫秒
  },
  saveUninitialized: false,
}));
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
  origin: 'http://localhost:8080',
  optionSuccessStatus: 200,
  credentials: true,
  maxAge: '1728000'
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
    const fileName = `${md5(fileNameArr[0])}.${fileNameArr[fileNameArr.length - 1]}`;//2020-03-25-v3
    cb(null, fileName);
  }
});
app.use(multer({ storage }).any());

const db = require('./config/db.config');




/* db.sequelize.sync({ force: true }).then(() => {
  console.log('重建表');
}); */
require('./route/user.route')(app);
require('./route/file.route')(app);
require('./route/share.route')(app);

//  创建服务器
let server = app.listen(process.env.PORT || 8081, () => {
  //let host = server.address().address;
  let host = '127.0.0.1';
  let port = server.address().port;
  console.log('started at: http://%s:%s', host, port);
});
