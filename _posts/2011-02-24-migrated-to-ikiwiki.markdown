---
title: 'Blog Rebooted'
layout: post
guid: urn:uuid:7a369bcc-f5fe-452e-a123-379e8dd513a5
tags:
    - blog
    - ikiwiki
---

> Ikiwiki is a wiki compiler. It converts wiki pages into HTML pages suitable for publishing on a website. Ikiwiki stores pages and history in a revision control system such as Subversion or Git. There are many other features, including support for blogging, as well as a large array of plugins.

生成静态页面，后端git存储，加上disqus的comment支撑，于是就有了这个改头换面的新blog。稍微纪录一下。

### typecho 2 wordpress

无论是ikiwiki还是disqus，貌似wordpress的wxr格式都是最好的解决方案，typecho没有现成的导出插件，只好用wordpress作跳板。好在typecho 2 wordpress已经有人做好了： [typecho 2 wordpress](http://www.panxianhai.com/typecho-2-wordpress.html)

### wordpress 2 texts

最简单直接的方法是xslt，不过做之前有些准备工作。

#### uuid

disqus需要每一篇post里都有一个唯一的id来对应comment，permalink是一个选择，不过换了域名后会比较痛苦，相比之下uuid是个不错的解决方案。

    #!/usr/bin/env python

    import sys
    import xml.dom.minidom
    import uuid
    import codecs

    def main():
      doc = xml.dom.minidom.parse(sys.stdin)

      rss = doc.getElementsByTagName("rss")[0];
      rss.setAttribute("xmlns:dsq", "http://www.disqus.com/")

      for node in doc.getElementsByTagName("item"):
        uuid_str = "urn:uuid:%s" % uuid.uuid4()
        # <dsq:thread_identifier>disqus_identifier</dsq:thread_identifier>
        identifier_node = doc.createElement("dsq:thread_identifier")
        value_node = doc.createTextNode(uuid_str)
        identifier_node.appendChild(value_node)

        node.appendChild(identifier_node)

      sys.stdout = codecs.lookup('utf-8')[-1](sys.stdout)
      print doc.toxml()

    if __name__ == "__main__":
         main()

生成的新xml里每个item都会包含一个dsq:thread_identifier的element

#### wxr > txt

[这里](http://kanru.info/blog/archives/2010/11/15/blog-redesigned/wp2txt.xsl)有个现成的xslt，不过不是很符合我的需求，稍做修改，新的xslt可以参考[这里](/media/files/2011/02/24/wp2txt.xsl)

主要做的改动是：

-   把link按照http://gopoherwood.info/year/month/day/slug 的pattern做匹配，然后在posts目录下分级创建year/month/day的目录，最后在目录下生成名为slug.mdwn的文件
-   把wxr里每篇post的dsq:thread_identifier的值map到新文件的meta的guid字段

**xsl:result-document只有xslt 2.0支持，所以xsltproc处理不了，建议用saxon**

原来的post都是textile，文章不多于是手动改成了markdown

### wordpress > disqus

disqus导入时会检查每篇post的link是否真的存在，不存在的时候会自动跳过，很讨厌，于是加工wxr去掉link的element。好在所有link都是字成一行，grep一下就ok了。

### ikiwiki

ikiwiki的配置可以参考[官方的wiki](http://ikiwiki.info/)，不过**自动生成的setup文件貌似不能正确处理git的post-update hook的权限，需要手动将git_wrappermode改为0755**

出于洁癖建立了空的basewiki和template目录后rebuild，然后只加入需要的文件进去。cgi也没什么用处，蔽掉了

#### template

ikiwiki的meta插件有parse guid的tag模版里却怎么也拿不到meta的值，暴力加了guid的var进去

        diff --git a/IkiWiki/Plugin/meta.pm b/IkiWiki/Plugin/meta.pm
        index ad6d1a8..5b56411 100644
        --- a/IkiWiki/Plugin/meta.pm
        +++ b/IkiWiki/Plugin/meta.pm
        @@ -288,6 +288,9 @@ sub pagetemplate (@) {
                        my %seen;
                        $template->param(meta => join("\n", grep { (! $seen{$_}) && ($seen{$_}=1) } @{$metaheaders{$page}}));
                }
        +       if (exists $pagestate{$page}{meta}{guid} && $template->query(name => "guid")) {
        +               $template->param(guid => $pagestate{$page}{meta}{guid});
        +       }
                if (exists $pagestate{$page}{meta}{title} && $template->query(name => "title")) {
                        $template->param(title => HTML::Entities::encode_numeric($pagestate{$page}{meta}{title}));
                        $template->param(title_overridden => 1);

然后模版里就可以用 `<TMPL_VAR GUID>` 获取guid的值了，把这个值放在disqus的code里就大功告成

顺手用html5重写了一下模版

----------

最近帮主身体不适，APPL跌了不少啊


