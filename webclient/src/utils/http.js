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
