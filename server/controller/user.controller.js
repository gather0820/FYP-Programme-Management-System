const db = require('../config/db.config.js');
const User = db.user; //  引入表模型
const Verification = db.verification;
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const svgCaptcha = require('svg-captcha');
const CryptoJS = require('crypto-js')
const nodeOutlook = require('nodejs-nodemailer-outlook');

const crypto = require('crypto');
//  新增用户
exports.create = (req, res) => {
  //console.log(req.body.username)
  if (req.body.username && req.body.password && req.body.vercode) {
    Verification.findOne({
      where: {
        username: req.body.username,
        code: req.body.vercode
      }
    }).then(verification => {
      if (!verification) {
        res.send({
          flag: 0,
          msg: 'Please check your verification code!'
        });
      } else {
        User.create({
          username:req.body.username,
          password:decrypt(req.body.password)
        })
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
      }
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
  let code = req.session;
  console.log(code);
  if (req.body.checkcode.toLowerCase()!= req.session.checkCode.toLowerCase()) {
    res.status(200).json({
      flag:0,
      msg:'Please input check code correctly'
    })
    return;
  }
  if (req.body.username && req.body.password) {
    User.findOne({
      where: {
        [Op.and]: [
          {
            username: req.body.username
          },
          [
            {
              password: decrypt(req.body.password)
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

/**
 * 发送邮箱验证码  2020-04-07
 */
exports.verifyEmail = async (req, res) => {
  let email = req.body.username;
  let user = await User.findOne({
    where: {
      username: email
    }
  });
  if (user) {
    res.send({
      flag: 0,
      info: 'User exists!'
    })
    return;
  } else {
    res.send({
      flag: 1,
      info: 'Verification code has been sent to your e-mail!'
    })
  }

  let token = ''
  try {
    let buf = crypto.randomBytes(4);
    token = buf.toString('hex');
    console.log('randomcode: %s', token);
  } catch (ex) {
    console.log(ex)
  }
  // let verInfo = {
  //   username:email,
  //   code:token,
  //   create_time:new Date()
  // }
  // let newVer = await Verification.create(verInfo);
  // if (newVer) {
  //   console.log(newVer)
  // }

  nodeOutlook.sendEmail({
    auth: {
      user: "FYP-SDMS@outlook.com",
      pass: "123456John"
    },
    from: 'SDMS<FYP-SDMS@outlook.com>',
    to: email,
    subject: 'Welcome to SDMS!',
    html: `<b>Thank you for signing up! Here is your verification code:</b><br><br>
    <center><b style="font-size:30px;">${token}</b></center>`,
    //text: 'This is text version!',
    //replyTo: 'receiverXXX@gmail.com',

    onError: (e) => {
      // let msg = {
      //   flag:0,
      //   info:'Fail to send verification code!'
      // };
      // res.status(500).json(msg);
      console.log(e)
    },
    onSuccess: (i) => {
      console.log(i)
      // let msg = {
      //   flag:1,
      //   info:'Verification code has been sent to your e-mail'
      // };
      // res.status(200).json(msg);
    }
  });
  let verInfo = {
    username: email,
    code: token,
    create_time: new Date()
  }
  let newVer = await Verification.create(verInfo);
  if (newVer) {
    console.log(newVer)
  }
  // res.send({
  //   flag:1,
  //   code: token
  // })
}
/**
 * 登录校验码2020-4-11
 */
exports.checkCode = (req,res) => {
  let newCheckCode = svgCaptcha.create({
    size: 4,  //验证码长度
    width: 100, //svg宽度
    height: 50, //svg高度
    // background: "#eee",//svg背景色
    noise: 3, //干扰线条数
    fontSize: 35, //字体大小
    ignoreChars: 'Iiluv1O0o',   //验证码字符中排除
    color: false // 验证码的字符是否有颜色，默认没有，如果设定了背景，则默认有           
});
  req.session.checkCode = newCheckCode.text;

  console.log(req.session)
  res.type('svg');
  res.send(newCheckCode.data)

}

decrypt = (word, keyStr) => {
  keyStr = keyStr ? keyStr : "sdms123456SDMS654321";
  var key = CryptoJS.enc.Utf8.parse(keyStr);
  var decrypt = CryptoJS.AES.decrypt(word, key, {
    mode: CryptoJS.mode.ECB,
    padding: CryptoJS.pad.Pkcs7
  });
  return CryptoJS.enc.Utf8.stringify(decrypt).toString();
}

