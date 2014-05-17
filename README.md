vim-config
==========

此项目为 [name5566](http://name5566.com) 的 VIM 配置

本文只描述此 VIM 配置的特有部分，其他的相关内容可以参阅手册，下面几篇是 [name5566](http://name5566.com) 的 VIM 学习笔记：
* VIM 编辑器的使用（1）(http://name5566.com/3400.html)
* VIM 编辑器的使用（2）(http://name5566.com/3402.html)
* VIM 脚本语言(http://name5566.com/4065.html)

此配置在 VIM 7.2、7.3、7.4 下测试过。

![配置展示](http://name5566.com/wp-content/uploads/2012/09/vim.png)

基本的配置
----------
1. leader 被设置为 ","
2. 快速保存使用 <leader>w
3. 快速关闭 Buffer 使用 <leader>q
4. 在普通模式下，在某个词上敲击 * 字符查找时不会自动跳转到下一个匹配处
5. 在可视模式下，增加了 `*` 查找功能。选中需要查找的字符串，敲击 `*` 进行查找（不会自动跳转到下一个匹配处）
