const db = require('../config/db.config.js');
const User = db.user; //  引入表模型
const Verification = db.verification;
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const svgCaptcha = require('svg-captcha');//登录验证码 login verification code
const CryptoJS = require('crypto-js');
const nodeOutlook = require('nodejs-nodemailer-outlook');//邮箱验证码 email verification code

const crypto = require('crypto');
var fs = require('fs');


//  新增用户  add user
exports.create = (req, res) => {
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
          username: req.body.username,
          password: decrypt(req.body.password)
        })
          .then(user => {
            let msg = {};
            if (user) {
              msg = {
                flag: 1,
                msg: 'Registration complete!',
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

//  验证用户名和密码  Verify username and password
exports.validate = (req, res) => {
  let code = req.session;
  //console.log(code);
  if (req.body.checkcode.toLowerCase() != req.session.checkCode.toLowerCase()) {
    res.status(200).json({
      flag: 0,
      msg: 'Please input check code correctly!'
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
            //duration: 0 ,	
            msg: 'Please check your username or password!If you forget your username or password please contact the administrator!'
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
 * 根据用户名查询该用户ID  Query the user ID based on the user name.
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
            info: "This username is registered!",
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

//  修改密码 Change Password
exports.updatePassWord = (req, res) => {
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
          msg: 'Change succeed!'
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
 * 发送邮箱验证码 Send email verification code
 */
exports.verifyEmail = async (req, res) => {
  let token = ''
  try {
    let buf = crypto.randomBytes(4);
    token = buf.toString('hex');
    console.log('randomcode: %s', token);
    req.session.randomcode = token;
  } catch (ex) {
    console.log(ex)
  }

  //用于单元测试 unit test
  //writeToTestDatas("verCode", token)

  let email = req.body.username;
  let user = await User.findOne({
    where: {
      username: email
    }
  });
  if (user) {
    res.send({
      flag: 0,
      info: 'This username is registered!'
    })
    return;
  } else {
    let oldVerCode = await Verification.findOne({
      where: {
        username: email
      }
    });
    if (oldVerCode) {
      let oldVerCodeTime = oldVerCode.create_time.getTime();
      let now = new Date().getTime();
      let interval = parseInt((now - oldVerCodeTime) / 1000);
      if (interval < 60) {
        res.send({
          flag: 0,
          info: 'Please wait a minute!'
        });
        return;
      }
      await Verification.update(
        {
          code: token
        },
        {
          where: {
            username: email
          }
        }
      );
      res.send({
        flag: 1,
        info: 'Verification code has been sent to your e-mail!'
      })

    } else {
      let verInfo = {
        username: email,
        code: token,
        create_time: new Date()
      }
      let newVer = await Verification.create(verInfo);
      if (newVer) {
        res.send({
          flag: 1,
          info: 'Verification code has been sent to your e-mail!'
        })
      }
    }
  }

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

    onError: (e) => {
      console.log(e)
    },
    onSuccess: (i) => {
      console.log(i)
    }
  });

}
/**
 * 登录校验码,Node自带的模块
 * Login checksum, Node's own module
 */
exports.checkCode = (req, res) => {
  let newCheckCode = svgCaptcha.create({
    size: 4,  //验证码显示个数 Number of captcha displays
    width: 200, //svg宽度
    height: 100, //svg高度
    // background: "#eee",//svg背景色
    noise: 3, //干扰线条数
    fontSize: 45, //字体大小
    ignoreChars: 'Iiluv1O0o',   //验证码字符中排除 Exclusion of captcha characters
    color: false // 验证码的字符是否有颜色，默认没有，如果设定了背景，则默认有           
  });
    req.session.checkCode = newCheckCode.text;
    
    //用于单元测试  unit test
    //writeToTestDatas("checkCode", newCheckCode.text);

;




  console.log(req.session)
  res.type('svg');
  res.status(200).send(newCheckCode.data)

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

//用于单元测试  unit test

// writeToTestDatas = (key, value) => {
//   fs.readFile('./test/testDatas.json', function (err, data) {
//     if (err) {
//       console.log(err)
//     }
//     let testData = JSON.parse(data);
//     testData[key] = value;
//     let newData = JSON.stringify(testData);
//     fs.writeFileSync('./test/testDatas.json', newData)
//   })
// }
