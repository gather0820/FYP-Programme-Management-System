import 'babel-polyfill'

import React from 'react'
import ReactDOM from 'react-dom'
import { Route, Switch, HashRouter, BrowserRouter as Router, Redirect } from 'react-router-dom'
import './public/css/nprogress.css'


import Bundle from './bundle'
import './styles/index.scss'
import { Icon, Modal } from 'antd'

import Index from './pages/index'  // 内容首页
import LoginController from 'bundle-loader?lazy&name=login!./pages/login'
import RegisterController from 'bundle-loader?lazy&name=register!./pages/register'
import FzfController from 'bundle-loader?lazy&name=fzf!./pages/404'

const Login = props => <Bundle load={LoginController}>{A => <A {...props} />}</Bundle>
const Register = (props) => <Bundle load={RegisterController}>{(A) => <A {...props}/>}</Bundle>;
const Fzf = props => <Bundle load={FzfController}>{A => <A {...props} />}</Bundle>

setTimeout(() => {
  ReactDOM.render(
    // HashRouter,Router  两种模式
    <HashRouter>
      <div id="theme" className="light-theme">
        <Switch>
          <Route path="/" exact component={Index} />
          <Route path="/login" component={Login} />
          <Route path="/register" component={Register} />
          <Route path="/404" component={Fzf} />
          <Redirect to="/404" />
        </Switch>
      </div>
    </HashRouter>,
    document.getElementById('app')
  )
}, 500)
