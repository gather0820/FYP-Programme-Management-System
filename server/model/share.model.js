module.exports = function(sequelize, DataTypes) {
  return sequelize.define('share', {
    task_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    create_time: {
      type: DataTypes.DATE,
      allowNull: false
    },
    file_id_list: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    sender_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    receiver_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    status: {//四种取值: Unhandled,Rejected,Accepted,如若只接收部分则为接收的文件列表
      type: DataTypes.TEXT,
      allowNull: false
    }
  }, {
    tableName: 'share'
  });
};
