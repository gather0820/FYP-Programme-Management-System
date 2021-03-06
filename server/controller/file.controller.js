const db = require('../config/db.config.js');
const File = db.file; //  引入表模型 Introduction of the table model
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const path = require('path');
const fs = require('fs');
const childProcess = require('child_process');
//var toPdf = require("office-to-pdf")
const libre = require('libreoffice-convert');



/**
 * 文件转码：
 * 调用了Libreoffice将office文档、txt、java、python、cpp等文本文件转成pdf，存入临时文件夹，返回给前端显示
 * Called Libreoffice will office documents, txt, java, python, cpp and other text files into pdf, 
 * deposit temporary folder, return to the front-end display
 */
exports.transcode = (req, res) => {
  const sourceFileName = req.body.hash_name;
  const fileName = req.body.file_name;
  const arr = sourceFileName.split('.');
  const sourceFileExt = '.'+arr[arr.length-1]
  const outputExtend = '.pdf'
  const enterPath = path.join(__dirname, `../resource/${sourceFileName}`);
  const outputPath = path.join(__dirname, `../convertPDF/${sourceFileName.replace(sourceFileExt,outputExtend)}`);
  // Read file
  const enter = fs.readFileSync(enterPath);
  // Convert it to pdf format with undefined filter (see Libreoffice doc about filter)
  libre.convert(enter, outputExtend, undefined, (err, done) => {
    if (err) {
      let msg = {
        flag:0,
        msg:`Error converting file: ${err}`
      }
      res.status(500).json(msg);
      console.log(`Error converting file: ${err}`);
    }else{
      fs.writeFileSync(outputPath, done);
      let msg = {
        flag:1,
        msg:'converted!',
        url:`http://localhost:8081/file/preview/${sourceFileName}/${fileName}`
      }
      res.status(200).json(msg)
    }
  });
}

/**
 * preview,获得文件地址
 * Get document address
 */
exports.preview = (req,res) => {
  let hashName = req.params.hashName;
  let fileName = req.params.fileName;
  let arr  = hashName.split('.');
  let ext = arr[arr.length-1];
  let path = `${__dirname}/../convertPDF/${hashName.replace(ext,'pdf')}`;
  res.download(path,fileName.replace(ext,'.pdf'))
}

//  添加文件 Add file
exports.create = (req, res) => {
  //填充数据库中file表的字段
  //Fill the fields of the file table in the database
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
/**
 * 保存分享的文件信息到file表
 * Save shared file information to the file table
 */
exports.save = (req, res) => {
  req.body.fileList.forEach((e, index) => {
    let params = {
      file_name: e.file_name,
      hash_name: e.hash_name,
      upload_time: new Date(),
      type: e.type,
      size: e.size,
      download: 0,
      uid: req.params.uid
    };
    File.create(params).then(file => {
      if (index == req.body.fileList.length - 1) {
        if (file) {
          let msg = {
            flag: 1,
            msg: `Save successfully!`
          };
          res.status(200).json(msg);
        } else {
          let msg = {
            flag: 0,
            msg: `Fail in save!`
          };
          res.status(500).json(msg);
        }
      }
    })

  });
}

//  删除文件
exports.delete = (req, res) => {
  const id = req.params.fileId;
  //  从数据库删除记录 database delete
  File.destroy({
    where: { id: id }
  })
    .then(_ => {
      //  从文件夹删除  Delete from folder
      let fileName = req.params.fileName;
      let path = `${__dirname}/../resource/${fileName}`;
      fs.unlink(path, err => {
        if (err) {
          let msg = {
            flag: 0,
            msg: 'Delete Failed!'
          };
          res.status(200).json(msg);
        } else {
          let msg = {
            flag: 1,
            msg: 'Delete Success!'
          };
          res.status(200).json(msg);
        }
      });
    })
    .catch(err => {
      res.status(500).json('Error=>', err);
    });
};

//  下载文件 Download file
exports.download = (req, res) => {
  let fileId = req.params.fileId;
  File.findOne({
    where: {
      id: fileId
    }
  })
    .then(file => {
      file.increment('download').then(() => {
        let fileName = req.params.fileName;
        let path = `${__dirname}/../resource/${req.params.hashName}`;
        res.download(path, fileName);
      });
    })
    .catch(err => {
      res.status(500).json('Error=>', err);
    });
};

//  获取文件列表信息 Get the file listing information
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
}