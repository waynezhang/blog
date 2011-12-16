---
title: '解决wordpress导入mt时的tags和slug问题'
layout: post
guid: urn:uuid:a48de560-6e09-4602-99ae-63c723393049
tags:
    - wordpress
    - movabletype
---

MT（4.2rc）导出的TXT文件里其实是有包含tag和slug数据的， 分别标记为TAGS和BASENAME， 只可惜目前wordpress还不支持，小小patch一下

    --- wordpress/wp-admin/import/mt.php    2008-04-15 01:26:07.000000000 +0900
    +++ gopherwood.info/wp-admin/import/mt.php  2008-07-01 10:05:56.000000000 +0900
    @@ -359,6 +359,16 @@
                    $category = trim( substr($line, strlen("PRIMARY CATEGORY:")) );
                    if ( ' != $category )
                        $post->categories[] = $category;
    +           } else if ( 0 === strpos($line, "TAGS:") ) {
    +               $tags = trim ( substr($line, strlen("TAGS:")) );
    +               if ( ' != $tags ) {
    +                   $post->post_keywords .= $tags;
    +               }
    +           } else if ( 0 === strpos($line, "BASENAME:") ) {
    +               $slug = trim ( substr($line, strlen("BASENAME:")) );
    +               if ( ' != $slug ) {
    +                   $post->post_name = $slug;
    +               }
                } else if ( 0 === strpos($line, "DATE:") ) {
                    $date = trim( substr($line, strlen("DATE:")) );
                    $date = strtotime($date);

