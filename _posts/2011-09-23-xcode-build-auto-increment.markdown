---
title: "Xcode 里自动加 build 版本号"
layout: post
guid: urn:uuid:c0672177-cf08-4c4d-8d31-7516148ef4e7
tags:
    - programming
    - xcode
---

把 Info.plist 里的版本号改成某个数字，然后 Targets → your target → Build Phases → Run Script 的地方加上

    version=`/usr/libexec/PlistBuddy -c "Print CFBundleVersion" $PRODUCT_SETTINGS_PATH`
    version=`expr $version + 1`
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $version" $PRODUCT_SETTINGS_PATH
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version" $PRODUCT_SETTINGS_PATH

这个脚本会让 Xcode 在每次 build 时都自动把版本号加 1。

build 数字太大了不好看也不那么人性化，于是在 git 下面我们可以

    version=`git describe --tag`
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $version" $PRODUCT_SETTINGS_PATH
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version" $PRODUCT_SETTINGS_PATH

这样我们得到的就是 git 里最近的 tag，距离此 tag 的 commit 数以及 commit hash 的前 8 位，比如 v00.10-12-g071c526

----------

_今天 iCloud reset，大概离发布不远了吧_
