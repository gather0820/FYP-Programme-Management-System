const db = require('../config/db.config.js');
const User = db.user; //  引入表模型
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const nodeOutlook = require('nodejs-nodemailer-outlook');

const crypto = require('crypto');
//  新增用户
exports.create = (req, res) => {
  //console.log(req.body.username)
  if (req.body.username && req.body.password) {
    User.create(req.body)
      .then(user => {
        let msg = {};
        if (user) {
          msg = {
            flag: 1,
            msg: 'succeed!',
            uid: user.uid,
            username: user.username
          };
        } else {
          msg = {
            flag: 0,
            msg: 'Failed!'
          };
        }
        res.status(200).json(msg);
      })
      .catch(err => {
        res.status(500).json('Error -> ' + err);
      });
  } else {
    let msg = {
      flag: 0,
      msg: 'Make sure you input username and password!'
    };
    res.status(200).json(msg);
  }
};

//  验证用户名和密码
exports.validate = (req, res) => {
  if (req.body.username && req.body.password) {
    User.findOne({
      where: {
        [Op.and]: [
          {
            username: req.body.username
          },
          [
            {
              password: req.body.password
            }
          ]
        ]
      },
      attributes: ['uid', 'username']
    })
      .then(user => {
        let msg = {};
        if (user) {
          msg = {
            flag: 1,
            msg: 'Welcome back!',
            uid: user.uid,
            username: user.username
          };
        } else {
          msg = {
            flag: 0,
            msg: 'Please check your username or password!'
          };
        }

        res.status(200).json(msg);
      })
      .catch(err => {
        res.status(500).json('Error -> ' + err);
      });
  } else {
    let msg = {
      flag: 0,
      msg: 'Make sure you input username and password!'
    };
    res.status(200).json(msg);
  }
};
/**
 * 根据用户名查询该用户ID
 */
exports.getUserIdByName = (req, res) => {
  if (req.params.name) {
    User.findOne({
      where: {
        username: req.params.name
      }
    })
      .then(user => {
        if (user) {
          let msg = {
            flag: 1,
            info: "User exists!",
            rid: user.uid
          };
          res.status(200).json(msg);
        } else {
          let msg = {
            flag: 0,
            info: "User do not exists!"
          };
          res.status(200).json(msg);
        }
      })
      .catch(err => {
        res.status(500).json('Error=>', err);
      });
  }

}

//  修改密码
exports.updatePassWord = (req, res) => {
  // console.log("old:" + req.body.oldPassword);
  // console.log("new:" + req.body.newPassword);
  User.findOne({
    where: {
      [Op.and]: [
        {
          uid: req.params.userId
        },
        [
          {
            password: req.body.oldPassword
          }
        ]
      ]
    }
  }).then(user => {

    if (user) {
      //console.log(user.password)
      // console.log(req.body.newPassword);
      //console.log(req.body.uid);
      User.update(
        {
          password: req.body.newPassword
        },
        {
          where: {
            uid: req.params.userId
          }
        }
      ).then(() => {
        let msg = {
          flag: 1,
          msg: 'succeed!'
        };
        res.status(200).json(msg);
      });
    } else {
      let msg = {
        flag: 0,
        msg: 'Failed!'
      };
      res.status(200).json(msg);
    }
  });
};


exports.verifyEmail = (req, res) => {
  let token = ''
  try {
    let buf = crypto.randomBytes(4); 
    token = buf.toString('hex');
    console.log('randomcode: %s', token);
  } catch (ex) {
    console.log(ex)
  }
  nodeOutlook.sendEmail({
    auth: {
      user: "lywdeol@outlook.com",
      pass: "Hnhk2018"
    },
    from: 'SDMS<lywdeol@outlook.com>',
    to: '1427200904@qq.com',
    subject: 'Welcome to SDMS!',
    html: `<b>Thank you for signing up! Here is your verification code:</b><br><br>
    <center><b style="font-size:30px;">${token}</b></center>`,
    //text: 'This is text version!',
    //replyTo: 'receiverXXX@gmail.com',

    onError: (e) => console.log(e),
    onSuccess: (i) => console.log(i)
  });
  res.send({
    status: 'OK'
  })
}