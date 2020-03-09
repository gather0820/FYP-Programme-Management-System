# cloud-disk
  文件云服务

## 技术栈&&环境

```
    react 16        // mvvm 的一种主流框架能更便捷的开发前后端分离项目(ui和数据关联)
    react-router 4  // 控制react中路由的跳转功能,如A页面跳转B页面，思考为啥不用a标签
    webpack 3       // 启动静态开发server动态打包项目将项目依赖根据各种babel进行分类，以及压缩功能，*babel
    node-sass/ness  // css预编译器，就是写css，思考主要优势
    koa2            // 基于node的一个编写api轻量级框架，思考不用这样第三方框架如何写node,为啥要用
    jsonwebtoken    // nodejs最流行的跨域鉴权的方案，场景主要是生成用户token
    mysql           // 在node中使用mysql数据库

```

koa2
'use strict';
var http = require('http');
var ejs = require('ejs');

var server = http.createServer();
server.on('request', function(request, response) {
    var url = request.url;
    //这里可以根据url的不同使用不同的方法来处理

    response.end(ejs.render('<html><body><h1>Hello, <%= name %>!</h1></body></html>', {
        name: 'World'
    }));
});

server.listen(8080);


## 说明

```
    如果在Windows中node-sass使用npm安装失败，使用cnpm安装
    该项目在chrome规则下设计，其他浏览器不保证正常使用，后面再逐步处理兼容问题
```


## 项目开发进度记录
  03-04: 初始化项目结构
  可以使用初始化工具  create-react-app 初始一个简单项目
  模块的概念： module.exports/export 暴露；require 引用 