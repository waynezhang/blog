---
title: '解决ie下面float元素的双倍margin问题'
layout: post
guid: urn:uuid:c064c850-b391-476b-8aab-e36c355eb4da
tags:
    - ie
    - css
---

Ｉ　ｈａｔｅ　ＩＥ！！！

双倍margin，导致整个页面布局都乱掉了，nnd ms

虽然我不用ie，不过为了避免被骂，还是修一下下吧，只要给float的元素加上display:inline就行了，不过似乎w3c并不赞成给float的元素加display属性（none除外），顺便再鄙视一下ie

    #access {
      display:inline; /* float的元素加上这句就行了 */
      float: left;
      width:451px;
      margin-left: 280px;
      margin-top: -70px;
      padding-bottom: 10px;
      border-bottom: 2px solid #eee;
    }

下面的sidebar也一样

    div.sidebar ul ul {
      margin-left:20px;
      padding:5px 0 0;
      display:inline; /* 这边也一样 */
    }

