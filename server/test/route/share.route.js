module.exports = function(app) {
    const share = require('../controller/share.controller');

    //创建一次分享
    app.post('/share',share.create);

    //是否有未处理的分享信息
    app.get('/share/new/:uid',share.receiveNew);

    //获取到当前用户未处理的分享信息（通过连接user表和share表，获得发送者username，连接share表和file表获得filename整合到一条share记录中）
    app.get('/share/receive/all/:uid',share.getReceiveData);

    //接收所有后，将改分享状态设为Accepted,接收部分文件后，将改分享状态设为接收列表,拒收所有文件后将状态设为Rejected
    app.put('/share/handle',share.handle);

}
