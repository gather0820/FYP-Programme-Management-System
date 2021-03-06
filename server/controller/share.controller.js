const db = require('../config/db.config.js');
const Share = db.share; //  引入表模型 Introduction of the table model
const Sequelize = require('sequelize');
const sequelize = db.sequelize;

exports.create = (req, res) => {
    //填充数据库中share表的字段  Fill the fields of the SHARE table in the database
    let params = {
        sender_id: req.body.senderId,
        receiver_id: req.body.receiverId,
        create_time: new Date(),
        file_id_list: req.body.fileIdList,
        status: 'Unhandled'
    };
    //创建一条记录 Create a record
    Share.create(params)
        .then(share => {
            if (share) {
                let msg = {
                    flag: 1,
                    msg: 'Share -- Success!'
                };
                res.send(msg);
            } else {
                let msg = {
                    flag: 0,
                    msg: 'Share -- Failed!'
                };
                res.status(500).json(msg);
            }
        })
        .catch(err => {
            res.status(500).json('Error->' + err);
        });
};

exports.receiveNew = (req, res) => {
    if (!isNaN(req.params.uid)) {
        Share.findAll({
            where: {
                receiver_id: req.params.uid,
                status: 'Unhandled'
            }
        }).then(share => {
            if (share.length > 0) {
                let msg = {
                    flag: 1,
                    data: share,
                }
                res.status(200).json(msg);
            } else {
                let msg = {
                    flag: 0,
                    data: []
                }
                res.status(200).json(msg);
            }
        })
    } else {
        res.send("0")
    }
}
/**
 * 获取到当前用户未处理的分享信息（通过连接user表和share表，获得发送者username，整合到一条share记录中）
 * Get the share information unprocessed by the current user 
 * (get the sender username by connecting the user table to the SHARE table and integrating it into a SHARE record)
 */
exports.getReceiveData = async (req, res) => {
    let share = await sequelize.query(`SELECT t1.*,t2.username as sender from share as t1 join user as t2 on t1.sender_id = t2.uid where t1.receiver_id = ${req.params.uid} and t1.status = 'Unhandled'`, { type: sequelize.QueryTypes.SELECT });
    //let ss = []
    share.map(async (s) => {
        //console.log(s.file_id_list);
        let file = await sequelize.query(`SELECT file_name,hash_name,type,upload_time,size FROM file WHERE id in (${s.file_id_list})`, { type: sequelize.QueryTypes.SELECT })
        s.fileList = file;
        return s;
    });
    //由于短时间内循环操作数据库，所以要设个延时，才能拿到数据
    //Due to the short cycle time of the database, there is a delay in order to get the data
    setTimeout(() => {
        let msg = {
            flag: 1,
            msg: share
        }
        res.status(200).json(msg)
    }, 300)
}
/**
 * 在share表中改变记录的status
 * Changing the status of a record in the SHARE table
 */
exports.handle = (req, res) => {
    Share.update({
        status: req.body.status
    },
        {
            where: {
                task_id: req.body.task_id
            }
        }
    ).then(() => {
        let msg = {
            flag: 1,
            msg: "updated"
        };
        res.status(200).json(msg);
    }).catch(err => {
        let msg = {
            flag: 1,
            msg: err
        };
        res.status(500), json(msg)
    })
}




