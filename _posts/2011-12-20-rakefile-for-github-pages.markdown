---
title: Rakefile for Github Pages
layout: post
guid: urn:uuid:e38b6d76-e936-4a17-a1a7-55fea65e0e59
tags:
  - jekyll
---

前些日子换到了 jekyll，顺手学着写了个 rakefile 用来生成新文章（用 uuid 做 disqus 的 post id 所以每次分开生成 uuid 再拷进来还是挺麻烦的）和 github pages 发布。

    task :default => :generate

    desc 'Create new post with rake "post[post-name]"'
    task :post, [:title] do |t, args|
      if args.title then
        new_post(args.title)
      else
        puts 'rake "post[post-name]"'
      end
    end

    desc 'Build site with Jekyll'
    task :generate => :clean do
      `jekyll`
    end

    desc 'Start server'
    task :server => :clean do
      `jekyll --server`
    end

    desc 'Deploy with rake "depoly[comment]"'
    task :deploy, [:comment] => :generate do |t, args|
      if args.comment then
        `git commit . -m '#{args.comment}' && git push`
      else
        `git commit . -m 'new deployment' && git push`
      end
    end

    desc 'Clean up'
    task :clean do
      `rm -rf _site`
    end

    def new_post(title)
      time = Time.now
      filename = "_posts/" + time.strftime("%Y-%m-%d-") + title + '.markdown'
      if File.exists? filename then
        puts "Post already exists: #{filename}"
        return
      end
      uuid = `uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"`
      File.open(filename, "wb") do |f|
        f << <<-EOS
    ---
    title: #{title}
    layout: post
    guid: urn:uuid:#{uuid}
    tags:
      - 
    ---


    EOS
      %x[echo "#{filename}" | pbcopy]
      end
      puts "created #{filename}"
      `git add #{filename}`
    end

这是一篇很水的文章，我想说的是，写完 rakefile 突然感觉对 ruby 很有爱，买了本 The Ruby Programming Language 打算学学 ruby，也免得被世界淘汰了。

*顺便试试新 rakefile*
