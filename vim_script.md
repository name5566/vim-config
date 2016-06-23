参考文献列表：  
[http://vimdoc.sourceforge.net/htmldoc/usr_41.html](http://vimdoc.sourceforge.net/htmldoc/usr_41.html)

本文面向一些有编程经验的人（特别是有 C/C++、Java 等编程经验的人），因此对一些显而易见的知识点未做详细的阐述。

### Introduction

我们在 Vim 脚本文件中编写 Vim 脚本。常见的 vimrc、Syntax 等文件都是 Vim 脚本文件。我们来看一个简单的例子。首先打开 Vim 创建一个新文件 test.vim 并输入：

```
:let i = 1
:while i < 5
:    echo "count is" i
:    let i += 1
:endwhile
```

保存后敲击命令（这里假定 test.vim 在 Vim 当前工作目录下）

```
:source test.vim
```

我们可以看到输出如下：

```
count is 1
count is 2
count is 3
count is 4
```

从上面的例子我们可以看到，Vim 脚本实际上是由冒号命令组成的。其实，当我们在脚本文件中编写脚本时，冒号是可以省略不写的。回到上面的例子中：

1. let 命令用于变量的赋值，通常的形式为：

	```
	let {variable} = {expression}
	```

2. while 命令和 endwhile 命令总是配合在一起使用，通常的形式为：

	```
	while {condition}
		{statements}
	endwhile
	```

3. echo 命令用于打印其参数，此例子中 echo 命令有两个参数，字符串 "count is" 和变量 i

### 变量（Variables）

使用 let 命令可以打印出当前定义的变量。首先来了解一下变量的作用域：

1. 定义一个全局变量 var 其可以在任何地方使用：

	```
	let var = 1
	# 或者这样写
	let g:var = 1
	```

2. 定义一个局部变量 var 其只能在某个脚本文件中使用：

	```
	let s:var = 1
	```

3. 定义一个变量 var 其只能在某个 buffer 中使用：

	```
	let b:var = 1
	```

4. 定义一个变量 var 其只能在某个 window 中使用：

	```
	let w:var = 1
	```

另外，还有一类变量 v:name 其为 Vim 预先定义的变量。如果需要删除一个变量，使用 unlet 命令，例如删除 s:var 变量：

```
unlet s:var
```

如果你不确定某个变量是否存在，不希望在使用 unlet 命令的时候出现一个错误消息，那么使用强制命令修饰符：

```
unlet! s:var
```

另外需要注意的是（和某些脚本语言不同）变量的生命周期，局部变量不会因为脚本文件执行完成而销毁：

```
if !exists("s:call_count")
	let s:call_count = 0
endif
let s:call_count = s:call_count + 1
echo "called" s:call_count "times"
```

我们执行这个脚本多次，输入结果为：

```
called 1 times
called 2 times
...
```

这里稍加说明的是 if !exists("s:call_count")，首先 ! 这里的含义是取反，而不是强制命令修饰符（注意 ! 符号的位置），另外 exists 不是一个命令，而是一个函数，函数使用括号包裹住参数列表而命令不需要括号。

在 Vim 中，0 为 false，非 0 为 true，Vim 很多时候会自动转换一个字符串为一个数值以确定其为 true 还是 false：

```
if "true"
```

这里，"true" 会被转化为数值 0。

我们还有一些有用的东西：

1. $NAME 为环境变量 NAME 的值
2. &name 为选项 name 的值
3. @r 为寄存器 r 的值

Vim 中字符串可以使用 " 或者 ' 字符包裹，只有 " 字符包裹的字符串支持转义字符，例如：

```
echo '\n'
```

输出 \n（而非一个空行）。

### 语句（Statements）

Vim 条件控制（和其他语言类似）：

```
if {condition}
	{statements}
elseif {condition}
	{statements}
else
	{statements}
endif
```

其中 elseif 和 else 是可选的。Vim 还支持条件控制表达式 a ? b : c（同于 C/C++ 等语言）

Vim 逻辑和算术操作符：

1. a == b 等于
2. a != b 不等于
3. a > b 大于
4. a >= b 大于等于
5. a < b 小于
6. a <= 小于等于
7. a + b 加
8. a - b 减
9. a * b 乘
10. a / b 除
11. a % b 模

对于字符串还有两个运算符用于进行字符串匹配：

1. a =~ b 字符串匹配
2. a !~ b 字符串不匹配

这里的 a 为字符串，b 为模式，例如：

```
if str =~ " "
	echo "str contains a space"
endif
if str !~ '\.$'
	echo "str does not end in a full stop"
endif
```

字符串比较和匹配时会受到 ignorecase 选项的影响，你可以避免此选项的影响：

1. 在操作符后添加 # 表示不忽略大小写
2. 在操作符后添加 ? 表示忽略大小写

	```
	if 'hello' ==? 'Hello'
		echo 'Here 1'
	endif
	if 'hello' ==# 'Hello'
		echo 'Here 2'
	endif
	```

以上脚本输出 Here 1

另外，还有一个特别要注意的地方是：

```
# 输出 matched
if "a" =~ '\<'
	echo 'matched'
else
	echo 'unmatched'
endif
 
# 输出 unmatched
if "a" =~ "\<"
	echo 'matched'
else
	echo 'unmatched'
endif
```

这里可以看到我们使用了不进行字符串转义的 ' 包裹字符串时得到了正确的结果，这是我们在使用正则表达式时特别需要注意的地方。

在使用 while 命令的时候，还可以配合 continue 和 break 命令使用，例如：

```
while counter < 40
	call do_something()
	if skip_flag
		continue
	endif
	if finished_flag
		break
	endif
	sleep 50m
endwhile
```

这里的 continue 命令用于跳转到循环的开始，break 命令用于结束循环。

execute 命令可以用于执行一个表达式，例如：

```
let s:normal_command = 'gg=G'
execute 'normal ' . s:normal_command
```

这里的 normal 命令表示执行一个普通模式下的命令，注意到上面的 . 字符，其用于连接字符串。

eval 函数可以用于获取一个表达式的值，例如：

```
let optname = "path"
let optval = eval('&' . optname)
```

### 函数（Functions）

Vim 定义了很多函数，文档在这里：

[http://vimdoc.sourceforge.net/htmldoc/usr_41.html#function-list](http://vimdoc.sourceforge.net/htmldoc/usr_41.html#function-list)
[http://vimdoc.sourceforge.net/htmldoc/eval.html#functions](http://vimdoc.sourceforge.net/htmldoc/eval.html#functions)

直接调用函数使用 call 命令：

```
call search("Date: ", "W")
```

注意，区别函数和命令：

```
search("Date: ", "W")
```

这样使用会出错，因为 search 是一个函数，而非命令。

我们可以自己定义函数：

```
function {name}({var1}, {var2}, ...)
	{body}
endfunction
```

注意，我们定义的函数的函数名必须为大写字母开头。我们来定义一个函数 Min 来获取两个数中较小的一个（此函数主要是为了解释语法，编写的并不优雅）：

```
function! s:Min(num1, num2)
	if a:num1 < a:num2
		let smaller = a:num1
	else
		let smaller = a:num2
	endif
	return smaller
endfunction
```

首先需要意识到的是，函数也是变量，因此这里 s:Min 的作用域为定义函数的文件。function 命令后加上强制命令修饰符表示如果函数存在则替换，这样做很有必要，假定此函数位于某个脚本文件中，如果没有加上强制命令修饰符，脚本文件被载入两次时就会报错：函数已存在。
其次，我们看到在函数内使用 num1 时加上了 a: 前缀，这可以告诉 Vim 此为函数参数。之后我们使用了 let 命令定义了 smaller 变量，此变量是一个局部变量，不能在函数外访问。
最后，我们使用了 return 命令返回 smaller。如果函数未使用 return 命令或者 return 命令没有参数，那么函数返回 0。

删除一个函数使用命令 delfunction。直接使用 function 命令可以打印用户定义的函数，查看函数的定义使用：

```
function Funcname
```

### 数据结构 List

一个 list 包含一组有序的元素，每个元素可以为任意类型，元素可以通过索引进行访问，第一个元素的索引为 0。创建一个 list，list 使用两个中括号包裹：

```
" 创建一个空的 list
let list1 = []
" 创建一个 list，其中含有两个类型不同的元素
let list2 = ['a', 2]
```

list 相关的操作：

1. 元素的访问

	```
	let list[0] = 1
	echo list[0]
	```

2. 增加新的元素

	```
	" 添加新的值到 list 的尾部
	call add(list, val)
	" 添加新的值到 list 的头部
	call insert(list, val)
	```

3. 删除元素

	```
	" 删除索引为 index 的元素并返回此元素
	call remove(list, index)
	" 删除索引为 startIndex 到 endIndex（含 endIndex）的元素
	" 返回一个 list 包含了这些被删除的元素
	call remove(list, startIndex, endIndex)
	" 清空 list，这里索引 -1 对应 list 中最后一个元素
	call remove(list, 0, -1)
	```

4. 判断 list 是否为空

	```
	if empty(list)
		" ...
	endif
	```

5. 获取 list 的大小

	```
	echo len(list)
	```

6. 拷贝 list

	```
	" 浅拷贝 list
	let copyList = copy(list)
	" 深拷贝 list
	let deepCopyList = deepcopy(list)
	call deepcopy()
	```

7. list 的遍历可以使用 for 命令

	```
	let list = ['one', 'two', 'three']
	for element in list
		echo element
	endfor
	```

for 命令的用法如下：

```
for {varname} in {listexpression}
	{commands}
endfor
```

### 数据结构字典（Dictionaries）

Dictionary 是一个关联数组。每个元素都有一个 key 和一个 value，我们可以通过 key 获取到 value。创建一个 dictionary，dictionary 使用两个大括号包裹：

```
" 创建一个空的 dictionary
let dict = {}
" 创建一个非空的 dictionary
let dict = {'one': 1, 'two': 2, 'three': 3 }
```

dictionary 的基本形式为：

```
{<key> : <value>, ...}
```

dictionary 的相关操作：

1. 元素的访问和修改

	```
	let dict = {'one': 1, 'two': 2}
	" 通过 key 访问
	echo dict['one']
	" 当 key 为 ASCII 字符串时还可以这样访问
	echo dict.one
	" 修改元素的 value
	let dict['one'] = '1'
	```

2. 元素的增加和删除

	```
	" 增加一个元素
	let dict[key] = value
	" 删除一个元素
	unlet dict[key]
	```

3. 获取 dictionary 大小

	```
	echo len(dict)
	```

4. 使用 for 遍历一个 dictionary

	```
	let dict = {'one': 1, 'two': 2}
	for key in keys(dict)
		echo key
	endfor
	" 遍历时 key 是未排序的，如果希望按照一定顺序访问可以这么做：
	for key in sort(keys(dict))
		" ...
	endfor
	 
	" keys 函数用于返回一个 list，包含 dictionary 的所有 key
	" values 函数用于返回一个 list，包含 dictionary 的所有 value
	" items 函数用于返回一个 list，包含 dictionary 的 key-value 对
	for value in values(dict)
		echo value
	endfor
	for item in items(dict)
		echo item
	endfor
	```

### 编写插件（plugins）

[Vim 官方网站](http://www.vim.org/)上存在大量的插件。现在来了解一下 Vim 插件。Vim 插件有两种类型：

1. 全局插件：用于所有类型的文件
2. filetype 插件：用于特定类型的文件（详细参考：[http://vimdoc.sourceforge.net/htmldoc/usr_41.html#write-filetype-plugin](http://vimdoc.sourceforge.net/htmldoc/usr_41.html#write-filetype-plugin)）

为了让你编写的插件能够总是正常工作，那么有一些规则需要遵循。

通常来 line-continuation 可以很好的工作：

```
let str = 'Hello'
	\ . 'World'
```

但是如果设置了 compatible 则会出现错误。我们使用以下方式避免错误的发生：

```
" 保存 cpoptions
let s:save_cpo = &cpo
" 设置 cpoptions 为 Vim 默认值
set cpo&vim
 
"
" plugin content
"
 
" 还原 cpoptions
let &cpo = s:save_cpo
```

插件的载入。有时候用户并不希望去载入某个插件，这时候我们需要给用户一种避免插件载入的机制：

```
if exists("g:loaded_pluginname")
	" finish 用于避免 Vim 读取此文件剩余的部分
	finish
endif
let g:loaded_pluginname = 1
 
"
" plugin content
"
```

这样，当我们在 vimrc 中设置了变量 g:loaded_pluginname 的值为 1 就避免了插件的载入。除了让用户可以控制是否能够载入插件之外，这样做还可以避免插件被重复的载入。另外，我们注意到 g:loaded_pluginname 的命名，这是建议的命名方式。

定义用户命令。编写插件时常常需要定义用户命令：

```
" MyCommand 为命令名称
" -nargs 用于指定命令参数的个数
" s:funcName 为命令执行时执行的函数
if !exists(':MyCommand')
	command -nargs=1 MyCommand :call s:funcName(<q-args>)
endif
```
