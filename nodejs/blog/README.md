# A blog demo (2014-8)

*简单地对文章进行增删查改及评论*

## 使用的技术

- nodejs
- coffee
- express
- pug
- mongodb

## 运行

- 参照 [3M 安装法](https://github.com/GnohiSiaM/demos/blob/master/nodejs/README.md) 安装 nodejs

- 参照根目录 [README](https://github.com/GnohiSiaM/demos/blob/master/README.md) 提供的链接安装 mongoDB

- 安装项目依赖并运行:

    ```
    # 安装 coffee-script
    $ npm install -g coffee

    # 安装项目依赖
    $ npm install

    # 启动项目
    $ npm start

    # 开发过程推荐安装 nodemon
    $ npm install -g nodemon
    # 使用 nodemon 启动程序，可以监听代码的变动然后自动重启应用
    $ nodemon npm start
    ```

- 访问: <http:localhost:3000>
