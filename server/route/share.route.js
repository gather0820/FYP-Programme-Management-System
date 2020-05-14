module.exports = function(app) {
    const share = require('../controller/share.controller');

    //创建一次分享 share once
    app.post('/share',share.create);

    //是否有未处理的分享信息 Check for unprocessed shared information. 
    app.get('/share/new/:uid',share.receiveNew);

    //获取到当前用户未处理的分享信息（通过连接user表和share表，获得发送者username，连接share表和file表获得filename整合到一条share记录中）
    /**
     * Get the share information not processed by the current user 
     * (Get sender username by connecting the user table and the share table
     * Connect the share table and the file table to get filename integrated into one share record)
     */
    app.get('/share/receive/all/:uid',share.getReceiveData);

    //接收所有后，将改分享状态设为Accepted,接收部分文件后，将改分享状态设为接收列表,拒收所有文件后将状态设为Rejected
    /**
     * After receiving all the files, set the resharing status to Accepted, 
     * after receiving some files, set the resharing status to receive list, 
     * after rejecting all files, set the status to Rejected
     */
    app.put('/share/handle',share.handle);

}
