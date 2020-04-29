//  用户
module.exports = function(app) {
  const user = require('../controller/user.controller');

  //  新增用户
  app.post('/user/add', user.create);

  //  根据用户名和密码查询用户
  app.post('/user/validate', user.validate);

  //  修改密码
  app.put('/user/update/:userId', user.updatePassWord);

  //  根据用户名查询ID
  app.get('/user/id/:name',user.getUserIdByName)

  app.post('/user/verify',user.verifyEmail)

  app.get('/user/checkcode',user.checkCode)
  //测试前后端交互
  app.get("/user/test",(req,res)=>{

    res.send({
      "status":'OK'
    })
  })
};
