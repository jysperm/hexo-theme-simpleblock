# Hexo Theme: Simple Block
这是一个基于线框设计的简单的 Hexo 主题，拆分自 [精子的博客](https://jysperm.me)。
支持使用 Jade 或 Markdown 来向边栏添加小部件，或向正文前添加横幅。

![Simple Block](https://raw.githubusercontent.com/jysperm/hexo-theme-simpleblock/master/source/favicon.png)

## 安装

    cnpm install hexo-renderer-jade marked jade --save; cnpm install hexo-theme-simpleblock
    cp -r node_modules/hexo-theme-simpleblock themes/simpleblock/; rm -r node_modules/hexo-theme-simpleblock

然后修改 Hexo 的 `_config.yml` 中的 `theme` 为 `simpleblock`.

## 技术栈

* Jade - 页面模板
* Less/Sass - 页面样式
* Bower - 前端包管理器
* Gulp - 构建工具

开发：

    npm install
    bower install
    gulp build

## 自定义

* google_analytics

    Google Analytics ID, 可选项，形如 `UA-49193300-1`.

* duoshuo

    多说站点 ID, 可选项。

* rss

    RSS 地址，完整 URL, 会以一条 link 标签的形式出现在页面的 head 部分，可选项。

* favicon

    页面图标，会显示在浏览器标签上，相对 URL, 可选项。

* icon

    顶部导航栏左侧图标，相对 URL, 可选项。

* source_url

    文章的「查看源代码」链接前缀，可选项。

* license.name

    博客内容授权方式。

* license.url

    博客内容授权方式链接。

* menus

    顶部导航菜单，键为链接的文字，值为连接的 URL, 如需指定 target, 可使用 `{target: '_blank', url: '/'}` 这样形式的值。

* right_menus

    顶部右侧导航菜单，同 menus.

* banners

    向页面正文前添加横幅，支持 Jade 和 Markdown. Jade 使用 `{jade: 'p text'}` 这样形式的值，Markdown 使用 `{markdown: '## Title'}` 这样形式的值。
    若希望添加多个横幅，可以将该字段的值设置成一个数组。

* widgets

    向边栏添加小部件，值为数组，每一项支持 Jade 和 Markdown（语法同 banners），亦支持三个内建的小部件：tags, archives 和 copyright, 内建小部件可通过 `{tags: true}` 这样的形式使用。

* sns

    社交平台 ID, 尚未被用到，正在开发相关功能。
