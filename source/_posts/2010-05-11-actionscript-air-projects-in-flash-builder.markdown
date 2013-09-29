---
layout: post
title: "ActionScript AIR Projects In Flash Builder"
date: 2010-05-11 14:54
published: false
footer: true
comments: false
categories: [air, flash, flash-builder]
---

I have been using Flex Builder ( and now Flash Builder ) as my ActionScript editor for a few years now.  I have put together a nice little workflow for designing in the Flash IDE, while developing, managing, and compiling my projects in Flash Builder.  When it came to working with AIR however there was a slight hiccup.  In Flash Builder, ( or  previous versions of Flex Builder ) there is no option for an ActionScript based (i.e. not Flex) AIR project.

I have seen a few workarounds, but none as simple as a tip I overheard on Twitter from <a href="http://twitter.com/__ted__/">Ted Patrick</a>.  So here it is, either read on, or watch a quick two minute <a href="http://knomedia.com/videos/video.php?id=1">screen-cast</a> I put together. 

1.  Create a new Flex Project in Flash Builder.

2.  In the New Flex Project Wizard, give your project a name

3.  Choose Desktop (runs in Adobe AIR)

4.  Select "Next >" in the wizard

5.  Still in the Wizard click "Next >" again to bypass the Ouptut folder ( you can change it if you feel so inclined )

6.  Still in the Wizard change the file extension of your Main application file from .mxml to .as

7.  Select Finish

When you compile, and run the application in ADL, you won't actually see the native window.  Here is where the tip from Ted Patrick comes in.  In your application-descriptor.xml file, change the visible tag to true.  Compile and run.  You should have a nice native window showing up.  You can set the initial width, height, backgroundColor, and frameRate using the [SWF] annotation / meta-tag.

Optionally, if you would rather wait to have the native window be visible, you can do so using ActionScript by setting the visible property of the nativeWindow instance of the stage like so:


<pre lang="actionscript">
stage.nativeWindow.visible = true
</pre>

