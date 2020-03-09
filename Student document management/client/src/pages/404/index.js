import React from 'react';
import css from './404.scss'

export default class Index extends React.Component {
    goIndex = () => this.props.history.push("/");
    goBack = () => window.history.back();

    render() {
        return (
          <div className={css.bg}>
            <img className={css.rotating} src="https://i.bstu.cn/img/fzf.svg" alt="" />
            <div className={css.full_btn}>
              <button className={css.info_btn} onClick={this.goIndex}>
                Back Home
              </button>
              <button className={css.def_btn} onClick={this.goBack}>
                Go Previous
              </button>
            </div>
          </div>
        )
    }
}
