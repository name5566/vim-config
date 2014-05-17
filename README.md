vim-config
==========

此项目为 [name5566](http://name5566.com) 的 VIM 配置

本文只描述此 VIM 配置的特有部分，其他的相关内容可以参阅手册，下面几篇是 [name5566](http://name5566.com) 的 VIM 学习笔记：
* [VIM 编辑器的使用（1）](http://name5566.com/3400.html)
* [VIM 编辑器的使用（2）](http://name5566.com/3402.html)
* [VIM 脚本语言](http://name5566.com/4065.html)

此配置在 VIM 7.2、7.3、7.4 下测试过。

![配置展示](http://name5566.com/wp-content/uploads/2012/09/vim.png)

基本的配置
----------
1. leader 被设置为 `,`
2. 快速保存使用 `<leader>w`
3. 快速关闭 Buffer 使用 `<leader>q`
4. 在普通模式下，在某个词上敲击 `*` 字符查找时不会自动跳转到下一个匹配处
5. 在可视模式下，增加了 `*` 查找功能。选中需要查找的字符串，敲击 `*` 进行查找（不会自动跳转到下一个匹配处）

Tab 的相关配置
--------------
1. `<leader>tn` 用于新建一个 tab
2. `<leader>tc` 用于关闭一个 tab

Buffer 的相关配置
-----------------
1. Ctrl + j 光标移到下边的 Buffer 中去
2. Ctrl + k 光标移到上边的 Buffer 中去
3. Ctrl + h 光标移到左边的 Buffer 中去
4. Ctrl + l 光标移到右边的 Buffer 中去
5. `<leader>be` 用于打开一个 Buffer 列表（通过插件 [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42) 实现）

命令行相关配置（例如，支持 Bash 风格的按键）
-------------------------------------------
1. Ctrl + a 光标移动命令行首位置
2. Ctrl + e 光标移动命令行尾位置
3. Ctrl + p 上一个输入
4. Ctrl + n 下一个输入
5. $w 快速键入 `\<\>`，常用于在查找时匹配一个完整的单词（不区分大小写）
6. $c 快速键入 `\<\>\C`，常用于在查找时匹配一个完整的单词（区分大小写）

注释的支持（通过插件 [NERD_commenter](http://www.vim.org/scripts/script.php?script_id=1218) 实现）
-------------------------------------------
使用 Alt + \ 设置或者清除注释

目录文件列表的支持（通过插件 [NERD Tree](http://www.vim.org/scripts/script.php?script_id=1658) 实现）
-------------------------------------------
1. 命令 :NERDTree 用于打开 NERD Tree
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

文件查找的支持（通过插件 [FuzzyFinder](http://www.vim.org/scripts/script.php?script_id=1984) 实现）
-------------------------------------------
1. F4 用于在当前 Buffer 所在的目录中查找
2. F5 用于在当前工作目录中查找

书签（Bookmark or mark）支持（这里自己实现了一个插件 [Vim bookmark](http://www.vim.org/scripts/script.php?script_id=4299)）
-------------------------------------------
1. mm 用于设定或者删除一个书签
2. mn 用于跳转到下一个书签
3. mp 用于跳转到前一个书签
4. ma 用于删除所有书签
5. 书签组功能：[https://github.com/name5566/vim-bookmark](https://github.com/name5566/vim-bookmark)

代码片段的支持（通过插件 [snipMate](http://www.vim.org/scripts/script.php?script_id=2540) 实现）
-------------------------------------------
具体的片段可以参考 .vim/snippets 中的文件

ZenCoding 支持（通过插件 [ZenCoding](http://www.vim.org/scripts/script.php?script_id=2981) 实现）
-------------------------------------------
如果你还不了解 ZenCoding，那么可以参考：[http://code.google.com/p/zen-coding/](http://code.google.com/p/zen-coding/)

C++ 编码相关支持
----------------
1. `<leader>o` 打开当前头文件（源文件）对应的源文件（头文件）
2. `<leader>f` 以光标所在处单词作为文件名打开文件
3. `<leader>vs`（这里 v 的含义为 vimgrep，s 的含义为 search）用于快捷键入命令 vimgrep 来对当前目录下头文件和源文件（区分大小写）进行递归搜索
4. `<leader>vws`（这里 v 的含义为 vimgrep，w 的含义为 word，s 的含义为 search）用于快捷键入命令 vimgrep 来对当前目录下头文件和源文件（区分大小写）进行递归搜索
5. `<leader>vs`（这里 v 的含义为 vimgrep，i 的含义为 ignore case）用于快捷键入命令 vimgrep 来对当前目录下头文件和源文件（忽略大小写）进行递归搜索
