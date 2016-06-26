# vim-config

此项目为 Name5566 的 VIM 配置

本文只描述此 VIM 配置的特有部分，其他的相关内容可以参阅手册，下面几篇是 Name5566 的 VIM 学习笔记：
* [VIM 编辑器的使用（1）](https://github.com/name5566/vim-config/blob/master/vim_tour1.md)
* [VIM 编辑器的使用（2）](https://github.com/name5566/vim-config/blob/master/vim_tour2.md)
* [VIM 脚本语言](https://github.com/name5566/vim-config/blob/master/vim_script.md)

此配置在 VIM 7.2、7.3、7.4 下测试过。

![配置展示](https://github.com/name5566/vim-config/blob/master/vim.png)

## 基本的配置

1. leader 被设置为 `,`
2. 快速保存使用 `<leader>w`
3. 快速关闭 Buffer 使用 `<leader>q`
4. 在普通模式下，在某个词上敲击 `*` 字符查找时不会自动跳转到下一个匹配处
5. 在可视模式下，增加了 `*` 查找功能。选中需要查找的字符串，敲击 `*` 进行查找（不会自动跳转到下一个匹配处）

## Tab 的相关配置

1. `<leader>tn` 用于新建一个 tab
2. `<leader>tc` 用于关闭一个 tab

## Buffer 的相关配置

1. Ctrl + j 光标移到下边的 Buffer 中去
2. Ctrl + k 光标移到上边的 Buffer 中去
3. Ctrl + h 光标移到左边的 Buffer 中去
4. Ctrl + l 光标移到右边的 Buffer 中去

## 命令行相关配置（例如，支持 Bash 风格的按键）

1. Ctrl + a 光标移动命令行首位置
2. Ctrl + e 光标移动命令行尾位置
3. Ctrl + p 上一个输入
4. Ctrl + n 下一个输入
5. $w 快速键入 `\<\>`，常用于在查找时匹配一个完整的单词（不区分大小写）
6. $c 快速键入 `\<\>\C`，常用于在查找时匹配一个完整的单词（区分大小写）

## 注释的支持（通过插件 [nerdcommenter](https://github.com/scrooloose/nerdcommenter) 实现）

使用 Alt + \ 设置或者清除注释

## 目录文件列表的支持（通过插件 [nerdtree](https://github.com/scrooloose/nerdtree) 实现）

1. 命令 :NERDTree 用于打开 NERD Tree（或 `<leader>e`）
2. 命令 :NERDTreeClose 用于关闭 NERD Tree
3. 命令 :NERDFind 用于在 NERD Tree 中查找当前 Buffer 对应的文件

在 NERD Tree 窗口中，我们有一些命令可以使用：

1. o 命令用于打开文件或者目录
2. go 命令用于打开文件或者目录，但光标并不跳转到打开的 Buffer 中去
3. x 命令用于关闭选中节点的父目录
4. p 命令用于跳转光标到父目录
5. P 命令用于跳转光标到根目录
6. K 命令用于跳转到当前目录的第一个节点处
7. J 命令用于跳转到当前目录的最后一个节点处
8. C 命令用于将选中的目录（如果选中文件时则为此文件的父目录）设置为根节点
9. r 命令用于刷新选中的目录
10. R 命令用于（递归）刷新根目录
11. cd 命令用于将选中目录设置为当前目录
12. q 命令用于关闭 NERD Tree

## 文件查找的支持（通过插件 [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) 实现）

1. Ctrl + p 用于在当前工作目录中递归查找文件名
2. Ctrl + j 用于在 CtrlP 结果列表中向下滚动
3. Ctrl + k 用于在 CtrlP 结果列表中向上滚动
4. 输入 file:line 表示查找文件 file 并跳转到 line 行
5. 打开 CtrlP 结果列表后，敲击 F5 用于刷新缓存（以获取新文件，移除不存在的文件）

## 书签（Bookmark or mark）支持（这里自己实现了一个插件 [vim-bookmark](https://github.com/name5566/vim-bookmark)）

1. mm 用于设定或者删除一个书签
2. mn 用于跳转到下一个书签
3. mp 用于跳转到前一个书签
4. ma 用于删除所有书签
5. 书签组功能：[https://github.com/name5566/vim-bookmark](https://github.com/name5566/vim-bookmark)

## [Emmet](https://github.com/mattn/emmet-vim)

具体内容参考：[http://emmet.io/](http://emmet.io/)

## C++ 编码相关支持

1. `<leader>o` 打开当前头文件（源文件）对应的源文件（头文件）
2. `<leader>f` 以光标所在处单词作为文件名打开文件

## 文件内容搜索

1. `<leader>?s`（s 的含义为 search）用于快捷键入命令 vimgrep 来对当前目录下特定文件（区分大小写）进行递归搜索
2. `<leader>?ws`（w 的含义为 word，s 的含义为 search）用于快捷键入命令 vimgrep 来对当前目录下特定文件（区分大小写）进行递归搜索
3. `<leader>?i`（i 的含义为 ignore case）用于快捷键入命令 vimgrep 来对当前目录下特定文件（忽略大小写）进行递归搜索

这里的 ? 可以为

1. v 用于搜索 C++ 头文件和源文件（由于历史原因使用了 v）
2. j 用于搜索 JavaScript 源文件
3. t 用于搜索 txt 文件
4. l 用于搜索 lua 文件
5. g 用于搜索 go 文件

## Tab 和空格的转换

1. 命令 Tab2Space 用于转换当前文件中的 Tab 为空格
2. 命令 Space2Tab 用于转行当前文件中的空格为 Tab
