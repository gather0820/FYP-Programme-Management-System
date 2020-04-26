import axios from 'axios'

let httpInstance = axios.create()
httpInstance.defaults.withCredentials = true;
httpInstance.defaults.baseURL = 'http://localhost:8081/'
httpInstance.defaults.timeout = 8000
//httpInstance.defaults.xsrfCookieName = ''

httpInstance.formurl = (url, data, config) => {
  return httpInstance.post(url, data, {
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    ...config
  })
};

/** 拦截器 interceptors
 * 一个对所有的http请求过滤的功能:
所有的请求需要加上token再发送给服务器.
服务器根据token判断用户身份是否有效，响应也需要过滤，判断是否授权，进行统一处理。
*
 * A function that filters all HTTP requests:
All requests need a token before they are sent to the server.
The server determines the validity of the user's identity based on the token, 
and the response needs to be filtered to determine whether it is authorized or not, 
for uniform processing.
 */

//  request拦截器
httpInstance.interceptors.request.use(
  config => {
    console.log(config)
    return config
  },
  error => {
    return Promise.reject(error)
  }
)
//  reponse拦截器
httpInstance.interceptors.response.use(
  response => {
    if (response.status === 200) {
      return Promise.resolve(response)
    }
  },
  error => {
    return Promise.reject(error)
  }
)
export default httpInstance
