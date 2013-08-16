---
title: UIImageView as Root View of View Controller
layout: post
guid: urn:uuid:7af13863-a8e9-40e6-918c-ed7a59f571ca
tags:
    - ios
    - UIImageView
    - programming
---

这是一个很诡异的 bug，表现为在收到 memory warning 后，回到上一个 View Controller 后界面无响应，如下

![bug](/media/files/2011/11/22/bug.png)

在 View Controller 3 收到低内存警告返回 View Controller 2 后界面失去响应。

仔细检查后发现 View Controller 2 的 root view 是 UIImageView 并且在 loadView 里并没有修改 userInteractionEnabled 属性的值，所以 UIImageView 不接受事件处理，界面没有响应反而是正常的，于是问题变得诡异：为什么从 View Controller 1 迁移过来时这个 image view 是接受事件响应的？

做个简单的 UIImageView 的 subclass 然后 override setUserInteractionEnabled: 方法后设 breakpoint，发现在 userInteractionEnabled 的值在 UIWindowController 的 transition:fromViewController:toViewController:target:didEndSelector: 方法里被修改成了 YES。

问题变得更加诡异： transition:fromViewController:toViewController:target:didEndSelector: 方法在从 View Controller 3 被 dismiss 返回到 View Controller 2 时也会被调用，为什么这时候 userInteractionEnabled 的值没有变？

继续比较区别，注意到从 View Controller 1 迁移到 View Controller 2 时 animated 的参数是 NO 而 View Controller 3 做 dismiss 时是设定了 animation 的：

![bug](/media/files/2011/11/22/with-description.png)

猜测 UIWindowController 的 transition:fromViewController:toViewController:target:didEndSelector: 方法在 transition 时在没有动画效果的情况下会检查 root view 是否是 UIImageView 并且修改 userInteractionEnabled 的值，而在有动画时则不会。

![bug](/media/files/2011/11/22/with-analytics.png)

在 subclass 的 setUserInteractionEnabled: 方法里加 log 然后调整 present 和 dismiss 的动画参数后得到了确认。

修正方法很简单，在 loadView 里创建 UIImageView 后设置 userInteractionEnabled 为 YES。

    diff --git a/PLViewController.m b/PLViewController.m
    index 9d0dd8b..2386e0a 100644
    --- a/PLViewController.m
    +++ b/PLViewController.m
    @@ -148,6 +148,7 @@ enum {
     - (void)loadView
     {        
         UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    +    imageView.userInteractionEnabled = YES;
         imageView.frame = [[UIScreen mainScreen] applicationFrame];
         self.view = imageView;
         [imageView release];

__其实在 UIImageView 作 root view 是修改 userInteractionEnabled 的值是必须的__，而 UIWindowController 在无动画 transition 时帮我们隐藏了这个 bug，并且这个 bug 隐藏的很深，只有在 View Controller 3 里出现内存不足，View Controller 2 的 view 被自动释放，然后在返回 View Controller 2 时重新 loadView 的场合才会出现。

*其实只作显示图片用的话直接操作 UIView 的 layer 应该是更好的选择吧，不会有这么奇怪的 bug 出现*
