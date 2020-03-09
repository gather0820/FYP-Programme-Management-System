import QueueAnim from 'rc-queue-anim'
import React from 'react'
import { Axios, getCookie } from 'Public'
import { Link } from 'react-router-dom'
import { Form, Icon, Input, Button, Checkbox, Carousel, message, Tooltip } from 'antd'
import css from './login.scss'
const FormItem = Form.Item
import io from 'socket.io-client'
import qs from 'qs'

class Index extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      code: ''
    }
  }

  // componentWillMount
  // componentDidUpdate
  // componentWillReceiveprops
  // componentwillUnMount
  // compoentDidwillUpdate
  componentDidMount() {
    getCookie('token') ? this.props.history.push('/') : null
    this.getCode()
  }

  getCode = () => {
    Axios.get(`/api/verification/code2?w=110&h=32`).then(ret => {
      this.refs.code.innerHTML = ret
    })
  }

  handleSubmit = e => {
    e.preventDefault()
    this.props.form.validateFields((err, values) => {
      if (!err) {
        console.log('Received values of form: ', qs.stringify(values))
        Axios.post('/api/user/login', values).then(ret => {
          if (ret.state) {
            this.props.history.push('/')
          } else {
            message.error(ret.message)
            switch (ret.code) {
              case 10000:
                this.getCode()
                break
              default:
                break
            }
          }
        })
      }
    })
  }

  render() {
    const { getFieldDecorator } = this.props.form
    return (
      <QueueAnim type="alpha">
        <div className={css.boxs} key={1}>
          <div className={css.login_logo}>
            <div>
              <img src="https://i.bstu.cn/img/logo.png" alt="" />
            </div>
            <div className={css.login_manu}></div>
          </div>
          <div>
            <Carousel autoplay effect="fade">
              <div className={css.car_list}>
                <img src="https://i.bstu.cn/img/bg1.jpg" alt="" />
                <div className={css.car_item}>
                  <div>
                    <div className={css.car_l}>
                      <img src="https://i.bstu.cn/img/leftquote.png" alt="" />
                    </div>
                    <div className={css.car_c}>Safe storage arcane masters mostly</div>
                    <div className={css.car_r}>&nbsp;</div>
                  </div>
                  <div>
                    <div className={css.car_l}>&nbsp;</div>
                    <div className={css.car_c}>Well organized</div>
                    <div className={css.car_r}>
                      <img src="https://i.bstu.cn/img/rightquote.png" alt="" />
                    </div>
                  </div>
                </div>
              </div>
              <div className={css.car_list}>
                <img src="https://i.bstu.cn/img/bg2.jpg" alt="" />
                <div className={css.car_item}>
                  <div>
                    <div className={css.car_l}>
                      <img src="https://i.bstu.cn/img/leftquote.png" alt="" />
                    </div>
                    <div className={css.car_c}>online preview</div>
                    <div className={css.car_r}>&nbsp;</div>
                  </div>
                  <div>
                    <div className={css.car_l}>&nbsp;</div>
                    <div className={css.car_c}>Open documents immediately</div>
                    <div className={css.car_r}>
                      <img src="https://i.bstu.cn/img/rightquote.png" alt="" />
                    </div>
                  </div>
                </div>
              </div>
              <div className={css.car_list}>
                <img src="https://i.bstu.cn/img/bg3.jpg" alt="" />
                <div className={css.car_item}>
                  <div>
                    <div className={css.car_l}>
                      <img src="https://i.bstu.cn/img/leftquote.png" alt="" />
                    </div>
                    <div className={css.car_c}>Multiple use</div>
                    <div className={css.car_r}>&nbsp;</div>
                  </div>
                  <div>
                    <div className={css.car_l}>&nbsp;</div>
                    <div className={css.car_c}>Carry your data</div>
                    <div className={css.car_r}>
                      <img src="https://i.bstu.cn/img/rightquote.png" alt="" />
                    </div>
                  </div>
                </div>
              </div>
              <div className={css.car_list}>
                <img src="https://i.bstu.cn/img/bg4.jpg" alt="" />
                <div className={css.car_item}>
                  <div>
                    <div className={css.car_l}>
                      <img src="https://i.bstu.cn/img/leftquote.png" alt="" />
                    </div>
                    <div className={css.car_c}>Carry your data</div>
                    <div className={css.car_r}>&nbsp;</div>
                  </div>
                  <div>
                    <div className={css.car_l}>&nbsp;</div>
                    <div className={css.car_c}>Spend a happy time together</div>
                    <div className={css.car_r}>
                      <img src="https://i.bstu.cn/img/rightquote.png" alt="" />
                    </div>
                  </div>
                </div>
              </div>
            </Carousel>
          </div>
          <div className={css.box}>
            <h2 className={css.title}>Account password login</h2>
            <Form onSubmit={this.handleSubmit}>
              <FormItem>
                {getFieldDecorator('userName', {
                  rules: [{ required: true, message: 'please enter user name!' }],
                  initialValue: 'admin'
                })(<Input prefix={<Icon type="user" style={{ fontSize: 13 }} />} placeholder="User" />)}
              </FormItem>
              <FormItem>
                {getFieldDecorator('password', {
                  rules: [{ required: true, message: 'Please enter the password!' }],
                  initialValue: '123456'
                })(<Input prefix={<Icon type="lock" style={{ fontSize: 13 }} />} type="password" placeholder="Pwd" />)}
              </FormItem>
              <FormItem>
                <div className={css.code}>
                  {getFieldDecorator('code', {
                    rules: [{ required: true, message: 'please enter verification code!' }]
                  })(<Input len={4} prefix={<Icon type="lock" style={{ fontSize: 13 }} />} placeholder="Verify" />)}
                  <Tooltip placement="right" title="Refresh">
                    <span className={css.code_svg} ref="code" onClick={this.getCode}></span>
                  </Tooltip>
                </div>
              </FormItem>
              <FormItem>
                {getFieldDecorator('remember', {
                  valuePropName: 'checked',
                  initialValue: true
                })(<Checkbox>Remember</Checkbox>)}
                {/* <a>Forget-password</a> */}
                <Button type="primary" htmlType="submit">
                  LOGIN
                </Button>
                <p>
                  No account yet? <Link to="/register">Register</Link>
                </p>
              </FormItem>
            </Form>
          </div>
          <div className={css.agreement}>Copyright © 2020-2022 cloud-disk</div>
        </div>
      </QueueAnim>
    )
  }
}

const Indexs = Form.create()(Index)
export default Indexs
