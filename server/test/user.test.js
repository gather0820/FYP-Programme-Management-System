// let app = require('../server')
// let user = require('../controller/user.controller');
// let chai = require('chai');
// let chaiHttp = require('chai-http');
// let should = chai.should();
// chai.use(chaiHttp);
// let urlHearder = 'http://localhost:8081'

// const request = require('supertest');
// const agent = request.agent(app);
// agent.timeout(5000);
// let checkCode = '';
// var fs = require('fs');
// /**
//  * 测试user相关接口
//  */
// describe('Test User API', function () {
//     describe('Get Check Code', function () {
//         it('should respond status 200', function (done) {
//             agent.get('/user/checkcode').withCredentials().end(function (err, res) {       
//                 res.should.have.status(200);
//                 done()               
//             });            
//         });        
//     });

//     describe('Register', function () {
//         it("should respond 'User exists!'",function (done) {
//             agent.post('/user/verify').send({
//                 username:'1427200904@qq.com'
//             }).end(function (err,res) {
//                 res.body.info.should.equal("User exists!");
//                 done()
//             });
//         });
//         it("should respond 'Verification code has been sent to your e-mail!'",function (done) {
//             agent.post('/user/verify').send({
//                 username:'lywdeol@outlook.com'
//             }).end(function (err,res) {
//                 res.body.info.should.equal('Verification code has been sent to your e-mail!');
//                 done()
//             });
//         });
//         it("should respond 'Please check your verification code!'",function (done) {
//             agent.post('/user/add').send({
//                 username:'lywdeol@outlook.com',
//                 password:"naC+m4Y8utKcwbRj/UPiSQ==",
//                 vercode:"ERROR VERCODE"
//             }).end(function (err,res) {
//                 res.body.msg.should.equal('Please check your verification code!');
//                 done()
//             });
//         });
//         it("should respond 'succeed!'",function (done) {
//             agent.post('/user/add').send({
//                 username:'lywdeol@outlook.com',
//                 password:"naC+m4Y8utKcwbRj/UPiSQ==",
//                 vercode:readFromTestDatas("verCode")
//             }).end(function (err,res) {
//                 res.body.msg.should.equal('succeed!');
//                 done()
//             });
//         });
//     });


//     describe('User Login', function () {
//         it("should respond 'Please input check code correctly!'", function (done) {
//             agent.post('/user/validate').send({
//                 username:'s',
//                 password:'naC+m4Y8utKcwbRj/UPiSQ==',
//                 checkcode:'ERROR CHECKCODE'
//             }).end(function (err, res) {
//                 res.body.msg.should.equal('Please input check code correctly!')              
//                 done()
//             });
//         });
//         it("should respond 'Please check your username or password!'", function (done) {
//             agent.post('/user/validate').send({
//                 username:'USER',
//                 password:'PASSWORD',
//                 checkcode:readFromTestDatas("checkCode")
//             }).end(function (err, res) {
//                 res.body.msg.should.equal('Please check your username or password!')              
//                 done()
//             });
//         });
//         it("should respond 'Welcome back!'", function (done) {
//             agent.post('/user/validate').send({
//                 username:'s',
//                 password:'naC+m4Y8utKcwbRj/UPiSQ==',
//                 checkcode:readFromTestDatas("checkCode")
//             }).end(function (err, res) {
//                 res.body.msg.should.equal('Welcome back!')              
//                 done()
//             });
//         });
        
//     });

// });

// /**
//  * 从json里面读数据，用于获取邮箱校验码、登录验证码等
//  */
// readFromTestDatas = (key) => {
//     let data = fs.readFileSync(__dirname+'/testDatas.json')
//     let testDatas = JSON.parse(data);
//     console.log(key+":"+testDatas[key]);
//     return testDatas[key];
// }