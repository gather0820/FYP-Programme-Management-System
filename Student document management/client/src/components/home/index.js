import React from 'react';
import {Popup, Axios} from 'Public'
import css from './home.scss'
import Upload from '../upload'
import {Icon, Checkbox, Tooltip} from 'antd'

export default class Index extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            showUp: false,              // 拖拽上传界面状态
            catalog: [],                // 文件夹列表容器
            modelSta: false,            // 模态框状态
            modelSize: [],              // 模态框尺寸
            modelTitle: '',             // 模态框标题
            modelHtml: '',              // 模态框内容
            allCheckSta: false,         // 全选
            file: [],                   // 上传按钮的文件容器
        }
    }

    componentDidMount() {
        this.getCatalog('')
    }

    // 获取文件列表
    getCatalog = (route) => {
        if (route === '--Refresh') {
            const {catalog} = this.state;
            route = catalog.url ? catalog.url : '';
        }
        Axios.get(`/api/oss/list?name=${route}`).then(res => {
            let catalog = {
                url: '',
                list: []
            };
            if (res.data.prefixes) {
                res.data.prefixes.map(item => {
                    catalog.list.push({
                        name: item,
                        check: 0,
                        isDirectory: 1,
                    })
                });
            }
            if (res.data.objects) {
                res.data.objects.map(item => {
                    catalog.list.push({
                        check: 0,
                        isDirectory: 0,
                        ...item
                    })
                });
            }
            this.setState({catalog: catalog, allCheckSta: false})
        })
    };

    // 返回上一级
    ret = () => {
        const {catalog} = this.state;
        let catalogUrl = catalog.url ? catalog.url.split('/') : [];
        let route = '';
        if (catalogUrl.length > 1) {
            catalogUrl.splice(catalogUrl.length - 1, 1);
            route = catalogUrl.join('/')
        }
        this.getCatalog(route)
    };

    // 新建文件夹
    add = () => {
        const {catalog} = this.state;
        let name = this.state.addName.value;
        if (catalog.url) {
            name = catalog.url + '/' + name;
        }
        // TODO: 文件名称验证
        if (name.length) {
            Axios.post('/api/addFolder', {name: name}).then(ret => {
                if (ret) {
                    this.state.modelSta = false;
                    this.getCatalog(catalog.url)
                }
            })
        }
    };

    // 修改文件/文件夹名称
    edit = () => {
        const {catalog} = this.state;
        let name = '';
        catalog.list.map(item => {
            item.check ? name = item.name : null;
        })
        let newName = this.state.editName.value;
        if (catalog.url) {
            name = catalog.url + '/' + name;
            newName = catalog.url + '/' + newName;
        }
        // TODO: 文件名称验证
        if (name.length && newName) {
            Axios.post('/api/editFolder', {name: name, newName: newName}).then(ret => {
                if (ret) {
                    this.state.modelSta = false;
                    this.getCatalog(catalog.url)
                }
            })
        }
    };

    // 拖拽进入退出
    upSta = (sta) => {
        this.setState({showUp: sta})
    };

    // 根据处理类型打开模态框
    changeModel = (sta, type = '') => {
        // console.log(sta, type);
        const {catalog} = this.state;
        let size = [], html = '', title = '';
        if (type) {
            switch (type) {
                case 'add':
                    title = '新建文件夹';
                    size = [400];
                    html = <div className={css.add_box}>
                        <div>
                            <input className={css.add_input} ref={e => this.state.addName = e} placeholder="请输入文件夹名"/>
                        </div>
                        <div className={css.info_operation}>
                            <button className={css.info_btn} onClick={this.add}>新建</button>
                            <button className={css.def_btn} onClick={() => this.changeModel(false)}>取消</button>
                        </div>
                    </div>;
                    break;
                case 'edit':
                    let editName = '';
                    catalog.list.map((item, i) => {
                        if (item.check) {
                            editName = item.name;
                        }
                    });
                    title = `修改[${editName}]`;
                    size = [400];
                    html = <div className={css.edit_box}>
                        <div>
                            <input className={css.add_input} defaultValue={editName} ref={e => this.state.editName = e}
                                   placeholder="新的名称"/>
                        </div>
                        <div className={css.info_operation}>
                            <button className={css.info_btn} onClick={this.edit}>修改</button>
                            <button className={css.def_btn} onClick={() => this.changeModel(false)}>取消</button>
                        </div>
                    </div>;
                    break;
                case 'del':
                    title = '删除文件/文件夹';
                    size = [400];
                    html = <div className={css.add_box}>
                        <div>
                            <p className={css.danger_hover}><Icon type="exclamation-circle"/>&nbsp;
                                你确定删除所选文件/文件夹(包括子文件)吗？</p>
                        </div>
                        <div className={css.info_operation}>
                            <button className={css.danger_btn} onClick={this.del}>删除</button>
                            <button className={css.def_btn} onClick={() => this.changeModel(false)}>取消</button>
                        </div>
                    </div>;
                    break;
            }
        }
        console.log(size, html, type, title, sta);
        this.setState({modelSta: sta, modelSize: size, modelHtml: html, modelTitle: title})
    };

    // 删除文件或文件夹
    del = () => {
        let {catalog} = this.state;
        let delList = [];
        if (catalog && catalog.list) {
            catalog.list.map(item => {
                if (item.check) {
                    let filePath = catalog.url ? catalog.url + '/' + item.name : item.name;
                    filePath ? delList.push(filePath) : null;
                }
            })
        }
        if (delList.length) {
            delList.map(item => {
                Axios.post('/api/delFolder', {name: item}).then(ret => {
                    console.log(ret);
                    if (ret) {
                        this.state.modelSta = false;
                        const {catalog} = this.state;
                        this.getCatalog(catalog.url)
                    }
                })
            })
        } else {
            console.log('还没有可以删除的项哦!');
        }
    };

    showFile = (dat) => {
        // console.log(dat);
        Axios.get(`/api/oss/url?name=${dat.name}`).then(res => {
            console.log(res);
        })
    };

    // 选择全部
    checkAll = (e) => {
        let {catalog} = this.state;
        let check = e.target.checked;
        if (catalog.list && catalog.list.length) {
            catalog.list.map(item => {
                item.check = check;
            })
        }
        this.setState({allCheckSta: check, catalog: catalog})
    };

    // 选择
    check = (e, dat, i) => {
        let {catalog} = this.state;
        dat.check = !dat.check;
        catalog.list[i] = dat;
        let allSta = false;
        catalog.list.map(item => {
            item.check ? allSta = true : null;
        })
        this.setState({catalog: catalog, allCheckSta: allSta})
    };

    // 按钮触发选择上传文件
    upBtn = () => {
        this.state.file.click();
    };

    file = () => {
        console.log(this.state.file.files);
        let upFile = this.state.file.files;
        let file = [];
        console.log(upFile.length);
        for (let i = 0; i < upFile.length; i++) {
            file.push({
                name: upFile[i].name,
                size: upFile[i].size,
                loading: 0,
                status: 'active',
                timeStamp: 0,
                data: upFile[i],
                index: 1
            })
        }
        this.setState({file: file}, () => {
            this.state.file.value = '';
        });
    }

    render() {
        const {catalog, file, modelSta, modelSize, modelTitle, modelHtml, showUp, allCheckSta} = this.state;
        let catalogUrl = catalog.url ? catalog.url.split('/') : [];
        let checkNum = 0;
        if (catalog && catalog.list) {
            catalog.list.map(item => {
                if (item.check) {
                    checkNum++;
                }
            });
        }

        return <div className={css.box} onDragEnter={this.upSta.bind(this, true)}>
            {/*操作*/}
            <div className={css.oper}>
                <Tooltip placement="top" title="也可拖动到此上传哦^_^">
                    <button onClick={this.upBtn} className={css.info_btn}><Icon type="upload"/>&nbsp;上传</button>
                </Tooltip>
                <input className={css.file} type="file" multiple="multiple" ref={(e) => this.state.file = e}
                       onChange={this.file}/>
                <button className={css.def_btn} onClick={() => this.changeModel(true, 'add')}><Icon
                    type="folder-add"/>&nbsp;创建文件夹
                </button>
                {checkNum === 1 ?
                    <button className={css.def_btn} onClick={() => this.changeModel(true, 'edit')}><Icon
                        type="edit"/>&nbsp;修改名称</button> : null}
                {checkNum ?
                    <button className={css.danger_btn} onClick={() => this.changeModel(true, 'del')}><Icon
                        type="delete"/>&nbsp;删除</button> : null}
            </div>
            {/*路径*/}
            <div className={css.path}>
                {catalogUrl.length ?
                    <span><a onClick={this.ret} href="javascript:">返回上一级</a> | <a onClick={() => this.getCatalog('')}
                                                                                  href="javascript:">全部文件</a> > </span> : '全部文件'}
                {catalogUrl.map((item, i) => {
                    let url = catalogUrl.slice(0, i + 1);
                    let urlStr = url.join('/');
                    return <span key={i}>
                        {catalogUrl.length - 1 > i ?
                            <a onClick={() => this.getCatalog(urlStr)} href="javascript:">{item}</a> : item}
                        {catalogUrl.length - 1 > i ? ' > ' : null}
                        </span>
                })}
            </div>
            {/*列表*/}
            <div className={css.cat}>
                <div className={css.list_base}>
                    <div className={css.sel}>
                        <Checkbox checked={allCheckSta} onChange={this.checkAll}/>
                    </div>
                    {checkNum ? <div className={css.check_txt}>已选中{checkNum}个文件/文件夹</div> : null}
                </div>
                {catalog.list && catalog.list.length ?
                    catalog.list.map((item, i) => {
                        let url = catalog.url ? catalog.url + '/' + item.name : item.name;
                        return <div className={css.list} key={i}>
                            <div className={css.sel}>
                                <Checkbox checked={item.check} onChange={(e) => this.check(e, item, i)}/>
                            </div>
                            {item.isDirectory ?
                                <div className={css.name} onDoubleClick={() => this.getCatalog(item.name)}
                                     onClick={(e) => this.check(e, item, i)}>
                                    <Icon type="folder"/>
                                    {item.name}
                                </div> : <div className={css.name} onDoubleClick={() => this.showFile(item)}
                                              onClick={(e) => this.check(e, item, i)}>
                                    <Icon type="file-text"/>
                                    {item.name}
                                </div>}
                        </div>
                    })
                    : <div className={css.empty}><Icon type="frown-o"/>&nbsp;哎呀,这个文件夹是空的!</div>}
            </div>
            {/*模态框*/}
            <Popup data={{size: modelSize, title: modelTitle}} sta={modelSta} close={() => this.changeModel(false)}>
                {modelHtml}
            </Popup>
            {/*上传*/}
            <Upload getCatalog={this.getCatalog} showUp={showUp} upSta={this.upSta} file={file}/>
        </div>;
    }
}