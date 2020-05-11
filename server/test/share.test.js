// let app = require('../server')
// let user = require('../controller/user.controller');
// let expect = require('chai').expect;
// //let chaiHttp = require('chai-http');

// //chai.use(chaiHttp);

// //let agent = chai.request.agent(app);
// const request = require('supertest');
// const agent = request.agent(app);
// agent.timeout(5000);
// let should = require('should/should.js');

// let checkCode = '';
// var fs = require('fs');

// describe('Test Share API',function(){
//     describe("Create Share",function(){
//         it("should respond 'Share -- Success!'",function(done){
//             agent.post('/share').send({
//                 senderId: '6',
//                 receiverId: '38',
//                 fileIdList: '38,40',
//             }).end(function(err,res){
//                 expect(res.body.flag).equal(1);
//                 done();
//             })
//         })
//     });

//     describe("Have New Share Message",function(){
//         it("should respond flag 0",function(done){
//             agent.get('/share/new/66').end(function(err,res){
//                 expect(res.body.flag).equal(0);
//                 done();
//             });
//         });
//         it("should respond flag 1",function(done){
//             agent.get('/share/new/6').end(function(err,res){
//                 expect(res.body.flag).equal(1);
//                 done();
//             });
//         });
//     });

//     describe("Handle Share Message",function(){
//         it("should respond 'updated'",function(done){
//             agent.put('/share/handle').send({
//                 task_id:'68',
//                 status:"Rejected"
//             }).end(function(err,res){
//                 expect(res.body.msg).equal('updated');
//                 done()
//             })
//         })
//     })
// })
