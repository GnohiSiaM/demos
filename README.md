*Learning by doing*
==============================

## 环境配置

- 系统使用 [ubuntu](https://www.ubuntu.com/global) | [xubuntu](http://xubuntu.org/) 或 macOS([awesome-mac](https://github.com/jaywcjlove/awesome-mac), [awesome-osx-cl](https://github.com/herrbischoff/awesome-osx-command-line))

- 安装常用软件，优先使用系统包管理器: apt-get (ubuntu)，homebrew (macOS)

    - 必备软件包: aptitude build-essential git vim curl wget openssh-server

        ```sh
        $ sudo apt-get update
        $ sudo apt-get install -y aptitude build-essential git vim curl wget openssh-server
        ```

    - 推荐安装: [tldr](https://github.com/tldr-pages/tldr), [autojump](https://github.com/wting/autojump), [httpie](https://github.com/jkbrzt/httpie), [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)，[zsh-completions](https://github.com/zsh-users/zsh-completions), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

        ```sh
        # 安装 oh-my-zsh
        $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

        # 安装 zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting
        $ git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
        $ git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
        $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
        # 编辑 ~/.zshrc: plugins=(... zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
        # 激活插件
        $ source ~/.zshrc
        ```

    - 编辑器: [Atom](https://atom.io/) | [Sublime Text](http://www.sublimetext.com/) ([Package](https://github.com/JaredCubilla/sublime))

    - IDE: [Eclipse](http://www.eclipse.org/downloads/) | [IntelliJ IDEA](https://www.jetbrains.com/idea/?fromMenu#chooseYourEdition)

    - 数据库: [MySQL](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/) (可视化: [phpMyAdmin](https://www.phpmyadmin.net/)), [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb) (可视化: [mongobooster](https://mongobooster.com/) | [robomongo](https://robomongo.org/)), [Redis](https://launchpad.net/~rwky/+archive/ubuntu/redis)

    - 浏览器: [Chrome](http://www.ubuntuupdates.org/ppa/google_chrome) (推荐扩展: [Octotree](https://github.com/buunguyen/octotree), [Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg), [FeHelper](https://chrome.google.com/webstore/detail/web%E5%89%8D%E7%AB%AF%E5%8A%A9%E6%89%8Bfehelper/pkgccpejnmalmdinmhkkfafefagiiiad), [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop), [smartUp](https://chrome.google.com/webstore/detail/bgjfekefhjemchdeigphccilhncnjldn), [Adblock Plus](https://chrome.google.com/webstore/detail/adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb))

        ```sh
        $ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        $ sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        $ sudo apt-get update
        $ sudo apt-get install google-chrome-stable
        ```

- 使用语言版本管理器安装语言运行时: nvm (Node.js)，pyenv (Python)，rvm (Ruby)，jenv (Java)，phpbrew (PHP)

- 使用语言包管理器安装语言依赖: npm | yarn (Node.js)，pip (Python)，gem (Ruby)，maven | gradle (Java)，pecl | composer (PHP)
