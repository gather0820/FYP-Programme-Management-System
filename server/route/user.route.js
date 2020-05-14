//  用户
module.exports = function(app) {
  const user = require('../controller/user.controller');

  //  新增用户 add user
  app.post('/user/add', user.create);

  //  根据用户名和密码查询用户 Query users by username and password
  app.post('/user/validate', user.validate);

  //  修改密码 change password
  app.put('/user/update/:userId', user.updatePassWord);

  //  根据用户名查询ID  Query ID by user name
  app.get('/user/id/:name',user.getUserIdByName)

  app.post('/user/verify',user.verifyEmail)

  app.get('/user/checkcode',user.checkCode)
  //测试前后端交互  test
  app.get("/user/test",(req,res)=>{

    res.send({
      "status":'OK'
    })
  })
};
