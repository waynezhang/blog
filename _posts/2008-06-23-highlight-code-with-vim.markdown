---
title: '借助vim高亮代码'
layout: post
guid: urn:uuid:ef60e8f1-78cb-484d-9731-34f0d2c449fb
tags:
    - vim
    - tips
---

起因还是这几天折腾 vps, 为了最大限度节约资源, 决定停用之前的 syntaxhighligher 插件, 而采用静态的高亮代码. 好处嘛:

一来省掉server端每次输出content的过滤过程
二来可以减少浏览器载入并执行js的压力
三来以后再换其他blog平台, 之前的代码片段依然可以很好的展现, 而不像现在. 检查了一下发现以前的post里残留着wp的coolcode的tag, textpattern的txp_batCode的tag, 还有habari的syntqxhighlighter的tag. 除了后者, 其他的都已经不像code了

找来找去发现解决方案其实一直都在我的硬盘里 -- 借助vim的syntax脚本高亮代码, 然后通过vim的2html.vim脚本生成html代码, 然后写css就ok. 至于好处嘛, 其一可以稍微减轻server和client的压力, 第二可以不依赖于任何blog平台和插件, 能输出html就成, 第三是可以借用vim的上百个语法脚本库, 这个数量绝对是geshi, syntaxhighlighter所望尘莫及的
步骤如下:

1. 编辑 ~/.vimrc , 添加以下代码, 当然css这个随便想怎么改怎么改:

        syntax on
        let html_use_css = 1
        let html_use_encoding = "utf8"
        let use_xhtml = 1

2. 添加css到现有的style里:

        pre.code {
            overflow: auto;
            margin-left: 1pt;
            padding: 5pt 10px;
            color: #000;
            background-color: #f8f8f8;
            border-left: 4pt solid #6ce26c;
        }
        pre.code .Constant {
            color: #000;
        }
        pre.code .Comment {
            color: #008200;
        }
        pre.code .Identifier {
            color: #000000;
        }
        pre.code .Label {
            color: #ff0;
        }
        pre.code .Operator {
            color: #ff0;
            font-weight: bold;
        }
        pre.code .PreProc {
            color: #ff1493;
        }
        pre.code .Special {
            color: #008200;
        }
        pre.code .Statement {
            color: #006699;
        }
        pre.code .Title {
            color: #000000;
            font-weight: bold;
        }
        pre.code .Type {
            color: #069;
            text-decoration: underline;
        }
        pre.code .Underlined {
            color: #208aff;
            text-decoration: underline;
        }

3. 高亮代码, 最方便的是在vim新建文件的时候就指定对应语言的扩展名, 比如.php, .c等, 可以自动高亮代码. 如果没有指定, 可以在vim手动执行高亮脚本, 例如php:

        :runtime syntax/php.vim

    具体的.vim脚本名可参考syntax目录

4. 生成html, 执行如下命令

        :runtime syntax/2html.vim

    或者

        :TOhtml

5. 把生成的html里pre包含的部分copy出来, 指定pre的class为code:

        <pre class="code">
        <!-- CODE HERE -->
        </pre>

-----------

稍微整理了一下之前有code的post
