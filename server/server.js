const express = require('express');
const app = express();
app.set('trust proxy', 1)
const path = require('path');
const bodyParser = require('body-parser');

let cookieParser = require('cookie-parser');
let session = require('express-session');
//app.use(cookieParser());

app.use(session({
  secret: 'secret', // 对session id 相关的cookie 进行签名 Signature of session ID-related cookies
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

/**
 * 解决跨域 cross-domain
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
  filename(req, file, cb) {//获取文件名和扩展名 Get file name and extension. Encryption using MD5
    const fileNameArr = file.originalname.split('.');
    const fileName = `${md5(fileNameArr[0])}.${fileNameArr[fileNameArr.length - 1]}`; 
    cb(null, fileName);
  }
});
app.use(multer({ storage }).any());

const db = require('./config/db.config');

require('./route/user.route')(app);
require('./route/file.route')(app);
require('./route/share.route')(app);

//创建服务器 server creation
module.exports = app.listen(process.env.PORT || 8081, () => {
});
