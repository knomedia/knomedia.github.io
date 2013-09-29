---
layout: post
title: "grep exclude directory"
date: 2013-05-31 13:47
published: true
footer: true
comments: false
categories: grep
---

This is more as a reference for me than anything. I cannot seem to ever remember how to exclude a directory when doing a recursive grep so here we go:
<pre>
<code>
grep /some_pattern/ /search/path -irn --exclude-dir=log --color
</code>
</pre>

-i => case insensitive
-r => recursive
-n => show line number
--color => highlight the match
--exclude-dir => don't search in this path

For multiple excludes use --exclude-dir={dir1,dir2}

I'm mostly hoping that the act of typing this out will help it stick. Perhaps it'll help you as well.