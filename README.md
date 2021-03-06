## 基础设置

leader键：空格键

## 插件

### 插件管理

[vim-plug](https://github.com/junegunn/vim-plug)

### 美化

主题：[junegunn/seoul256.vim](https://github.com/junegunn/seoul256.vim)

状态栏。
足够轻量而且与 coc 搭配，由 spacevim 作者从项目中提取出来：[liuchengxu/eleline.vim](https://github.com/liuchengxu/eleline.vim)
这个是国人写的状态栏，也不错，有更多颜色和符号显示，但是由于我一直搞不好 Windows 下的 nerdfont 图标显示一直有问题。（spaceline）

彩虹括号。
~~选择了他人 fork 更改的版本，比原版更轻量，配置更简单：[junegunn/rainbow_parentheses.vim](junegunn/rainbow_parentheses.vim)~~
选择了更轻便的版本 [frazrepo/vim-rainbow]

~~行尾空白显示。其他人 fork 的版本：[ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)~~
（在 vim 配置中直接完成删除 Python 文件多余空格的操作，不需要插件）

### 便利

自动补全括号。
~~选择这个是因为几次尝试只有他可以在删除左括号的同时自动删除（插件自动补全的）右括号：[jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)~~ 
这个插件可实现用 enter 快速选择括号内部。其实是想换一个补全括号插件试试XD：[tmsvg/pear-tree](https://github.com/tmsvg/pear-tree)

自动对齐。
比 tabular 好在可手动选择要对齐的行，并且可根据不同符号对齐：[junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)

自动补全。
在我的 PC 环境下经测验这个补全效果最好，而且用 coc 插件体系安装了片段补全等功能：[neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)

快速注释。
选择了 tpope 大神的版本，其介绍中说这个插件的代码不到 100 行：[tpope/vim-commentary]

搜索。
用这个甚至可以代替侧边文件栏，速度很快：[Yggdroot/LeaderF]

### Python专有

让 Python 文件有更多颜色，高亮光标所在选中的词：[numirias/semshi](https://github.com/numirias/semshi)

调试 Python
[skywind3000/asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)

智能化缩进，还有折叠、用高亮显示缩进行等功能，目前只用了智能缩进。自带快捷键也可在函数间快速跳转：[tweekmonster/braceless.vim](https://github.com/tweekmonster/braceless.vim)

提供更多 Python 语法高亮：[Guzzii/python-syntax](https://github.com/Guzzii/python-syntax)

## ToDo

- [x] 文件管理：[defx](https://github.com/Shougo/defx.nvim)：一是暂时不需要文件管理，二是配置较为复杂
- [ ] 终端调试：[vim-repl](https://github.com/sillybun/vim-repl)
- [x] 插件管理：[dein.vim](https://github.com/Shougo/dein.vim)（用 vim 8.2 试了一下感觉速度肉眼可见比 plug 快）：弃用，理由是比 plug 快的价值低于配置它和需要其他插件组合才能形成 plug 那样简单易读的 UI 界面的成本。
