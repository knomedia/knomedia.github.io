---
layout: post
title: "Introducing yesman"
date: 2012-11-26 12:55
published: true
footer: true
comments: false
categories: [c, command-line, gtest, yesman]
---

<p>My quest to go all-in with vim continues to make progress. This progress was held up a bit with my recent work on C++ within the university. With all the cruft that surrounds C++ development a full featured IDE seemed tempting. So over the Thanksgiving break I spent some time working on yesman (available at <a href="https://github.com/knomedia/yesman">GitHub</a>). Yesman is a command line application that will create and manage your C++ projects including unit testing. It will create a project, download and compile <a href="http://code.google.com/p/googletest/">Google Test</a>, and help you stub out C++ classes, headers and testing fixtures.</p>

<div id='videoContent' style="padding-top:30px; padding-bottom:30px;">
  <video controls='controls' poster='http://knomedia.com/blog_assets/2012/yesman_poster.png' width='700' height='437' >
    <source src='http://knomedia.com/blog_assets/2012/yesman_introduction.mp4' type='video/mp4' />
  </video>
</div>

<p>It is not quite finished. Future versions of yesman will include a system that allows you to build your c++ project through yesman using a managed make build process. Feel free to fork, tweak give feedback at the <a href="https://github.com/knomedia/yesman">GitHub repo</a></p>
