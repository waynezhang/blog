---
title: 在 macOS App Store 外发布 app
layout: post
guid: urn:uuid:5ffc76b5-af15-4f9c-a237-74d5f9fb7212
tags:
  - programming
---


这些天离职交接，于是趁着无聊把之前做的 app ([Osara](https://osara.lhzhang.com)) 整理了一下[发了出来](https://www.producthunt.com/posts/osara)。因为用了 Accessibility API 所以只能在 App Store 外发布，踩了些坑，随手整理了一下。


1. [生成 Binary](https://help.apple.com/xcode/mac/current/#/dev033e997ca)

    - 用 `Developer ID` 证书签名
    - Archive  

    ```sh
    DERIVED_FILES_DIR=$(xcodebuild -showBuildSettings -scheme [Scheme] -project [Xcode Project] | grep DERIVED_FILES_DIR | sed 's/.*=\ *//g')
    xcodebuild -scheme [Scheme] -project [Xcode Project File] -configuration=Release -derivedDataPath ${DERIVED_FILES_DIR} -archivePath ${ARCHIVE_PATH} archive`
    ```

    - 导出 Archive

    ```sh
    xcodebuild -exportArchive -archivePath [Archive Path] -exportPath [Export Path] -exportOptionsPlist ExportOptions.plist
    ```

    这步需要一个 `ExportOptions.plist`，介绍这个文件怎么写的文章不多，不过没关系，手动从 Xcode 导出时 Xcode 会为我们生成这个文件，以后命令行复用就可以了。

    - nortize

    nortize 的原理是上传 Apple 服务器，Apple 确认这个 build 没有问题时会发行一个 ticket。在第一次打开这个 app 时，Gatekeeper 会去 Apple 服务器验证这个 ticket，如果没有问题就不会弹警告。

    > A notarized app is a macOS app that was uploaded to Apple for processing before it was distributed. When you export a notarized app from Xcode, it code signs the app with a Developer ID certificate and staples a ticket from Apple to the app. The ticket confirms that you previously uploaded the app to Apple.

    这个步骤可以通过 [xcnotary](https://github.com/akeru-inc/xcnotary) 自动化。

    ```shell
    xcnotary notarize <input path> \
      --developer-account <Apple Developer account> \
      --developer-password-keychain-item <name of keychain item, see below> \
      [--provider <provider short name>]
    ```

    *nortize 需要 app [打开](https://help.apple.com/xcode/mac/current/#/devf87a2ac8f) `Hardened Runtime`，这个可以在 `Signing & Capabilities` 打开。*

1. 分发 Binary ([AppCenter](https://appcenter.ms))

    AppCenter 可以支持 macOS app 的 analytics，crash log 收集，同时还可以 host app 的 binary，更赞的是提供了 Sparkle 的支持。然而官方的命令行客户端还在使用老的 binary 上传 api（WTF？），想要自动上传可以参考 [gist]( https://gist.github.com/waynezhang/5a597b1cb883c8324462efed31edaf7e)。

1. Auto Update

    AppCenter 提供了 Sparkle 的支持，但是并不会为 binary 自动生成 `edSignuature`，而如果没有 `edSignature` 的话 Sparkle 则不会承认这个 binray。好在 AppCenter 提供了 api 来更新这个签名。

    ```shell
    curl -X "PATCH" "https://api.appcenter.ms/v0.1/apps/${APP}/releases/${RELEASE_ID}" \
     -H "X-API-Token: $TOKEN" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $"{
            \"metadata\": {
            \"ed_signature\": \"$SIGNATURE\"
          }
    }"
    
    ```

    这个 signature 可以利用 Sparkle 提供的 `sign_update` 生成。完整 script 可参考 [gist](https://gist.github.com/waynezhang/2dee342f2d5a213119a9e7f07b678948)。