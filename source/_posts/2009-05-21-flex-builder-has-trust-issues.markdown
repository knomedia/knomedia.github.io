---
layout: post
title: "Flex Builder has trust issues"
date: 2009-05-21 22:37
published: false
footer: true
comments: false
categories: flex
---

When you create a new project in Flex Builder, the IDE updates a config file buried in the preferences that marks the project's 'bin-debug' folder as a trusted resource.  In so doing when you run the project you are able to access local resources (i.e. a local XML file), and remote services at the same time.  When you import a Flex Builder archive it is supposed to update the same config file with the 'bin-debug' folder of the newly imported project.

There is an apparent issue with Flex Builder (I am running FB on a Mac, but apparently it exists on Windows as well) in that when you import, move, or rename a project, it doesn't update the config file.  When the config file isn't updated and you try to load a local resource the player will throw a "Security Error".  This isn't a problem if you are only using local resources ( -use-network compiler flag ).  But when you need to access local files and remote files or services this can be a real pain.

I had some time recently, and decided to look into the issue.  In doing so I came across a couple of past articles:

<a href="http://yourpalmark.com/2008/07/25/securityerror-loading-local-files-and-accessing-internet-resources/" >This one</a> by Mark Walters, and <a href="http://jessewarden.com/2006/12/flash-player-cant-read-ur-stuff-access-t3h-internets-t3h-same-time.html" >this one </a> by Jesse Warden

The fix is easy enough, go add the path of your bin-debug folder to the config file.  In case you skipped the links, you can find the file in the following location:

Mac:
/Users/userAccount/Library/Preferences/Macromedia/Flash Player/#Security/FlashPlayerTrust/flexbuilder.cfg

PC:
C:\Documents and Settins\userName\Application Data\Macromedia\Flash Player\#Security\FlashPlayerTrust\flexbuilder.cfg


Updating the config file isn't too big of a deal.  However, to expedite a quicker fix, I have built an AIR app called bugrd! that will add a project's debug folder to the config file for the user.  Once the app is installed you simply drag your project folder and drop it on the interface.  The interface will confirm the project that you have selected.  Click the 'un-bugr' button, and it adds your debug folder to the local trusted list in the config file.

I am assuming that this will be cleared up some time (Flash Builder 4?), until then hopefully this'll speed up the process.

[airbadge] bugrd!, http://www.knomedia.com/air/bugrd/bugrd.air, 1.0, http://www.knomedia.com/air/bugrd/bugrd_badge.png[/airbadge]

You can install the bugrd from the install badge above, or you can download the .air installer <a href="http://www.knomedia.com/air/bugrd/bugrd.air">here</a>

Jason
