---
layout: post
title: "Creating ASDocs in Flash Builder"
date: 2009-11-05 21:23
published: false
footer: true
comments: false
categories: [asdoc, flex]
---

Over the last year or two I have seen several different methodologies on creating ActionScript documentation using ASDoc.  Jesse Freeman shows a quick example of creating documentation using ANT tasks in his recent article <a href="http://www.insideria.com/2009/11/5-tips-for-documenting-code.html">5 Tips for Documenting Code</a> .  ANT tasks are nice in that they can be transfered with the code base as it moves from developer to developer.  When I need to quickly create ASDocs however, I typically use the External Tools dialogue directly in Flash Builder.

I thought I would document how to create a simple ASDoc configuration within Flash Builder's External Tools dialogue.

<strong>External Tools</strong>

In Flash Builder, select Run --> External Tools --> External Tools Configurations

<a href="http://knomedia.com/blog/wp-content/uploads/2009/11/1_ExternalTools1.png"><img src="http://knomedia.com/blog/wp-content/uploads/2009/11/1_ExternalTools1-300x225.png" alt="External Tools" title="External Tools" width="300" height="225" class="aligncenter size-medium wp-image-329" /></a>

Create a new configuration by double clicking on the “Programs” button.  Next, give the new configuration a name, I’ll choose something generic like “Generic ASDoc”.  


<strong>Location</strong>

The External Tools Configurations window needs a bit of information.  The first is “Location”.  Select the “Browse File System” button and locate the the asdoc compiler.

On a Mac it is typically located at:

<code>/Applications/Adobe Flash Builder Beta 2/sdks/4.0.0/bin/aasdoc</code>

On windows (XP) I believe it is located at:

<code>C:\Program Files\Adobe\Flex Builder 3\sdks\3.2.0\bin\asdoc.exe</code>

I don’t have a PC to test this with currently, so if I am wrong, please feel free to correct me.

<strong>Working Directory</strong>

Next we need to add our “Working Directory”.  You can think of this as your base directory, the directory from which any relative paths will be resolved.  For this field I typically want it to be my “src” folder within the project I am working on.  Eclipse has some interesting variables that can help here.  You can see them by clicking the “Variables” button.  I usually end up with my working directory set as "The currently selected project's 'src' directory" like so:

<code>${project_loc}/src</code>


<strong>ASDoc Arguments</strong>

Lastly we need to add the necessary compiler arguments for ASDoc.  I’ll document the basic arguments here, and then point you toward a more in depth resource created by Adobe that discusses all of the arguments.

<code>-source-path</code>
In this example I will set this to a period (.), meaning the same directory as the "Working Directory" from the previous step.

<code>-doc-sources</code>
Again here I will set this to a period (.), meaning document all of the classes found within the source path (which in this case is our ‘src’ folder)

<code>-output</code>
This is the directory in which ASDoc will build the documentation.  If the directory doesn't exist, ASDoc will create it for you.  You could also use a relative path (relative from the Working Directory).  I’m setting it to DOCS, meaning that it will create a directory named “DOCS” within the “src” directory.

<a href="http://knomedia.com/blog/wp-content/uploads/2009/11/BasicSetting.png"><img src="http://knomedia.com/blog/wp-content/uploads/2009/11/BasicSetting-292x300.png" alt="Basic Settings" title="Basic Settings" width="292" height="300" class="size-medium wp-image-333" /></a>

<strong>Other compiler arguments you can use</strong>

For simple projects the previously named compiler arguments should get you started.  There are several other arguments you may need.  I’ll list a few of them here

<code>-window-title</code>
This argument takes a String, be sure to enclose your value within double quotes if it will contain spaces.  The -window-title argument gets concatenated to the HTML title tag.

<code>-main-title</code>
This argument also takes a String (use double quotes for spaces).  This argument value gets placed at the top of the documentation HTML

<code>-library-path</code>
A relative path to any SWC file dependancies.  For example if you have a SWC file being used in the build path of your project found within the “libs” directory you would add “../libs” as the argument.

<code>-exclude-classes</code>
The fully qualified name of any class file that you do no wish to have included in the documentation

<strong>Running your configuration</strong>

When you have your configuration set up, select "Apply", and then "Run".  You should see some feedback on the documentation process in Flash Builder's console.  From now on, you should see the name of the configuration when you select Run-->External Tools.  Selecting the configuration will run it.  You can also run the configuration from the toolbar icon as well.

<strong>More Info</strong>

For more information you should check out <a href="http://blogs.adobe.com/flexdoc/pdfs/asdoc.pdf">this</a> document created by Adobe that discusses options for using ASDoc including both compiler arguments and options for commenting your code.
