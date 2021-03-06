//  文件接口，接收前端请求 File interface to receive front-end requests
//  url匹配上就会调用controller里的函数 The function in the controller will be called on the URL match.
module.exports = function(app) {
  const file = require('../controller/file.controller');

  //  新增文件
  app.post('/file/add', file.create);

  //  删除文件
  app.delete('/file/delete/:fileName/:fileId', file.delete);

  // 下载文件
  app.get('/file/download/:hashName/:fileName/:fileId', file.download);

  // 获取文件信息列表 Get a list of document information
  app.post('/file/list', file.findAll);

  app.post('/file/share/save/:uid',file.save);

  //文件预览
  app.get('/file/preview/:hashName/:fileName',file.preview);

  //转码
  app.post('/file/transcode', file.transcode)
};
