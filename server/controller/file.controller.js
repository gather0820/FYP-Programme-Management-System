const db = require('../config/db.config.js');
const File = db.file; //  引入表模型
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const path = require('path');
const fs = require('fs');

//  添加文件
exports.create = (req, res) => {
  let params = {
    file_name: req.files[0].originalname,
    hash_name: req.files[0].filename,
    upload_time: new Date(),
    type: path.parse(req.files[0].originalname).ext,
    size: req.files[0].size,
    download: 0,
    uid: req.body.uid
  };
  File.create(params)
    .then(file => {
      if (file) {
        let msg = {
          flag: 1,
          msg: 'Uploaded successfully!'
        };
        res.status(200).json(msg);
      } else {
        let msg = {
          flag: 0,
          msg: 'Failed!try again!'
        };
        res.status(500).json(msg);
      }
    })
    .catch(err => {
      res.status(500).json('Error->' + err);
    });
};

//  删除文件
exports.delete = (req, res) => {
  const id = req.params.fileId;
  //  从数据库删除记录
  File.destroy({
    where: { id: id }
  })
    .then(_ => {
      //  从文件夹删除
      let fileName = req.params.fileName;
      let path = `${__dirname}/../resource/${fileName}`;
      fs.unlink(path, err => {
        if (err) {
          let msg = {
            flag: 0,
            msg: 'Failed!'
          };
          res.status(200).json(msg);
        } else {
          let msg = {
            flag: 1,
            msg: 'Done!'
          };
          res.status(200).json(msg);
        }
      });
    })
    .catch(err => {
      res.status(500).json('Error=>', err);
    });
};

//  下载文件
exports.download = (req, res) => {
  let fileId = req.params.fileId;
  //File.findByPrimary(fileId)
  File.findOne({
    where: {
      // [Op.and]: [
      //   {
          id: fileId
        }
      // ]
    // }
  })
    .then(file => {
      // file
      //   //.increment('download')
      //   .then(() => {
      file.increment('download').then(() => {
        let fileName = req.params.fileName;
        let path = `${__dirname}/../resource/${fileName}`;
        console.log(path);
      //   res.set({
      //     "Content-type":"application/octet-stream",
      //     "Content-Disposition":"attachment;filename="+file.file_name
      // });
      // console.log(file.file_name);
        res.download(path, fileName);
      });
      // let fileName = req.params.fileName;
      // let path = `${__dirname}/../resource/${fileName}`;
      // console.log(path);
      // res.download(path, fileName);
      // res.send({
      //   "status":"OK"
      // })
    })
    .catch(err => {
      res.status(500).json('Error=>', err);
      // });
    });
};

//  获取文件列表信息
exports.findAll = (req, res) => {
  File.findAll({
    where: { uid: req.body.uid }
  })
    .then(file => {
      res.status(200).json(file);
    })
    .catch(err => {
      res.status(500).json('Error=>', err);
    });
};
