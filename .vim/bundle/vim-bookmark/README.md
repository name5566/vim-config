vim-bookmark
============

基本的介绍
----------
你可以在 [http://www.vim.org/scripts/script.php?script_id=4299](http://www.vim.org/scripts/script.php?script_id=4299) 直接下载本插件

Vim bookmark 是一个 Vim 的书签插件。此插件的特点：

* 相对于 Vim marks 来说，Vim bookmark（书签）可见
* 支持多个 Buffer 间相互跳转
* 关闭 Vim 时自动保存现有书签
* 书签组的支持

Vim bookmark 截图：

![Vim bookmark 截图](http://name5566.com/wp-content/uploads/2012/09/vbookmark.png)

插件的基本用法：

1. mm 用于设定或者删除一个书签，或者使用命令 VbookmarkToggle
2. mn 用于跳转到下一个书签，或者使用命令 VbookmarkNext
3. mp 用于跳转到前一个书签，或者使用命令 VbookmarkPrevious
4. ma 用于删除所有书签，或者使用命令 VbookmarkClearAll

书签组介绍
----------
书签组可能是 Vim bookmark 独创的一种特性。

我们可能遇到这样的情况，当正在进行 A 工作并设定了一系列书签时，需要去做 B 工作了，B 工作也需要设定一系列书签，而这时候又不希望清除 A 工作设定好的书签。通过 Vim bookmark 的书签组功能可以很好的应对此种情况，我们当前的书签被放在一个书签组中，因此只需要开启一个新的书签组给新的工作用即可。我们可以通过命令创建书签组，删除书签组，以及在各个书签组间进行切换。

书签组相关的命令如下：

1. VbookmarkGroup 命令。当此命令不带参数时，表示列出当前所有的书签组。此命令后可以接上书签组名，如果此名称存在，则打开对应的书签组，如果此名称不存在，则新建一个书签组
2. VbookmarkGroupRemove 命令。当此命令不带参数时，表示移除当前的书签组。此命令后可以接上书签组名，如果此名称存在，则移除对应的书签组

插件的配置
----------
* 如果希望关闭后保存书签，请设置 g:vbookmark_bookmarkSaveFile 变量为保存书签的文件，例如：

`let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'`

* 如果希望禁用默认的按键绑定，请设置 g:vbookmark_disableMapping 变量，例如：

```
" 禁用默认的按键绑定
let g:vbookmark_disableMapping = 1
" 使用 Visual Studio 书签的按键方式
nnoremap <silent> <C-F2> :VbookmarkToggle<CR>
nnoremap <silent> <F2> :VbookmarkNext<CR>
nnoremap <silent> <S-F2> :VbookmarkPrevious<CR>
```

插件的安装和更新
----------------
直接拷贝插件到 plugin 目录下即可，更新时建议先退出 Vim 后删除 g:vbookmark_bookmarkSaveFile 变量指定的文件。
