---
layout: post
title: "Adobe Air Version Checker"
date: 2009-12-10 14:16
published: false
footer: true
comments: false
categories: air
---

So I had a bit of an annoying morning today.  I went to update from AIR 1.5.2 to the <a href='http://get.adobe.com/air/'>latest release (1.5.3)</a>.  The process didn't go so smoothly.  Long story short the updater would just hang up and sit there.  I tried uninstalling 1.5.2 to get a fresh version of 1.5.3 rather than an update.  No luck, the uninstaller wouldn't work.  I kept getting error messages about possibly not being an admin on my machine.  Not true, I am the admin....  So what to do...  Looking around the interwebz, it doesn't seem like others are having the same trouble.

I checked permissions, restarted.  Tried again, no luck.  Tried again, and what?  It tells me that I already have 1.5.3 installed.  Huh?  On which of the failed attempts did that happen?  So I thought I would check the version number somehow.  After a bit of googling.  I found no easy way to verify the version number.  You can do it programatically from within ActionScript.  To do so you simply look at the following:
<br/>

<pre lang="actionscript">
NativeApplication.nativeApplication.runtimeVersion
</pre>

Looking at that property from within your IDE will tell you which version of the runtime you have in your installed SDK.  To see which actual version of AIR is installed for AIR apps that you are running on the machine you need to execute the code within that environment.

So I built a quick little widget that displays the installed runtime version.  Nothing too fancy here, just a utility.  Feel free to install and use it via the badge installer below...

[airbadge] VersionChecker, http://www.knomedia.com/air/versionChecker/VersionChecker.air, 1.0, http://www.knomedia.com/air/versionChecker/assets/vc_badgeImage.png[/airbadge]

You can install the widget from the install badge above, or you can download the .air installer <a href="http://www.knomedia.com/air/versionChecker/VersionChecker.air">here</a>
