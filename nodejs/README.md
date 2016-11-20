# Node.js

## 安装
3M 安装法:
- [mvn (Node Version Manager)](https://github.com/creationix/nvm)：解决多版本共存、切换问题
- [npm (Node Package Manager)](https://github.com/npm/npm)：解决 Node.js 模块安装问题，其本身也是一个 Node.js 模块
- [nrm (Npm Registry Manager)](https://github.com/Pana/nrm)：解决 npm 镜像访问慢的问题，提供测速，切换 registry 功能

```sh
# 安装 mvn
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# 安装 node
## 查看可安装的 node 版本: nvm ls-remote
$ nvm install node

# 安装 nrm
$ npm install -g nrm
## 检测所有 registries 的响应时间
$ nrm test
## 使用响应时间最短的 registry, 如： taobao
$ nrm use taobao
```

##  Hello World
编写 `example.js` 文件:

```js
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

 运行:

```sh
node example.js
```
