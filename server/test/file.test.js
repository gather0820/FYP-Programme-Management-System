// let app = require('../server')
// let user = require('../controller/user.controller');
// let expect = require('chai').expect;
// //let chaiHttp = require('chai-http');

// //chai.use(chaiHttp);
// let urlHearder = 'http://localhost:8081'
// //let agent = chai.request.agent(app);
// const request = require('supertest');
// const agent = request.agent(app);
// agent.timeout(5000);
// let should = require('should/should.js');

// let checkCode = '';
// var fs = require('fs');

// describe('Test File API',function(){
//     describe('Get file List',function(){
//         it("should respond a JSON",function(done){
//             agent.post('/file/list').send({
//                 uid:6
//             }).end(function(err,res){
//                 res.should.have.json;
//                 done();
//             })
//         })
//     });
//     describe('Delete File',function(){
//         it("should respond 'Failed!'",function(done){
//             agent.delete('/file/delete/nonexistent.pdf/0').end(function(err,res){
//                 expect(res.body.msg).equal('Failed!')
//                 done();
//             })
//         });
//         it("should respond 'success'",function(done){
//             agent.delete('/file/delete/b1ee680c3c0c4f3bbd7097b0465d930a.pptx/124').end(function(err,res){
//                 expect(res.body.msg).equal('Done!')
//                 done();
//             })
//         });
//     });
// })