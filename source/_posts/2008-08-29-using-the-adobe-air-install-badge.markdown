---
layout: post
title: "Using the Adobe AIR Install Badge"
date: 2008-08-29 14:30
published: false
footer: true
comments: false
categories: air
---

Lately I have developed several small AIR application for clients.  Sometimes the apps are the actual project, sometimes they are a tool to allow the clients to do something with project.  Either way I find myself building quite a few smaller AIR widget applications for clients lately.  David Tucker's <a href="http://www.adobe.com/devnet/air/articles/10_common_mistakes_air.html">10 common mistakes</a> when building AIR applications lists not using the badge install for your AIR app at number seven.  I have been happy with the results of using the badge install to distribute apps to clients.

The Badge Install is a mechanism that allows the user to install you AIR application from a browser.  If the user doesn't have the necessary AIR runtime installed, it will first install the AIR runtime followed by your AIR application.  If the user already has your AIR application installed, it allows the user to choose to re-install, or simply launch the already installed application.

While there are examples of using the <a href="http://labs.adobe.com/wiki/index.php/AIR_Badge">latest install badge</a> that Grant Skinner put together.  I haven't seen any examples that use the latest <a href="http://code.google.com/p/swfobject/">SWFObject</a> (v2.1) and produce html results that validate.  The process is actually quite simple.  You can download a finished example <a href='http://knomedia.com/blog/wp-content/uploads/2008/08/badgeinstallexample.zip'>here</a>

<b>Build your HTML file</b>
Build a simple HTML file with your DOCTYPE, head and body.
<pre lang="HTML">
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'lang='en' xml:lang='en'>
	<head>
		<title>Number Converter AIR application</title>
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' />
		<script type='text/javascript' src='js/swfobject.js'></script>
	</head>
	<body>
		<div id='badge_div'>
			    To install this application you will need the <a href='http://www.adobe.com/products/flashplayer/'>Adobe Flash Player</a>
		</div>
	</body>
</html>
</pre>

In the head I bring in the SWFObject with a relative path via the "js" directory.  In the body I have created a div with an id of 'badge_div', this is the div that will get replaced with the Install Badge SWF file.

<b>Set up the SWFObject</b>
I usually like to place all my SWFObject JavaScript in an individual .js file.  For this example I am using the following JavaScript in a file named 'badgeInstall.js'.

<pre lang="javascript">
var flashvars = {};
flashvars.airversion = '1.1';
flashvars.appname = 'Number Converter';
flashvars.appurl = 'http://www.knomedia.com/air/numberConverter/NumberConverter.air';
flashvars.imageurl = 'assets/NumberConverter.jpg';

var params = {};
var attributes = {};

swfobject.embedSWF('install_swf/AIRInstallBadge.swf', 'badge_div', '205', '170', '9.0.115', 'install_swf/expressInstall.swf', flashvars, params, attributes);
</pre>

These are the required flashvars parameters required to get the badge working:
<ul>
<li><b>airversion</b> is the AIR runtime version required to run your application</li>
<li><b>appname</b> is the name of your AIR application</li>
<li><b>appurl</b> is the absolute address of your .air file</li>
<li><b>imageurl</b> is the address (absolute or relative) of an image file to display in the badge.  The image should be 205px by 170px.</li>
<ul>

The last line is simply using the SWFObject to replace the appropriate div with your Badge Install SWF file.

Back in the HTML head you need to include a reference to the badgeInstall.js which results in the following finalized HTML document:

<pre lang="xhtml">
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'lang='en' xml:lang='en'>
	<head>
		<title>Number Converter AIR application</title>
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' />
		<script type='text/javascript' src='js/swfobject.js'></script>
		<script type='text/javascript' src='js/badgeInstall.js'></script>
	</head>
	<body>
		<div id='badge_div'>
			    To install this application you will need the <a href='http://www.adobe.com/products/flashplayer/'>Adobe Flash Player</a>
		</div>
	</body>
</html>
</pre>

There are lots of optional parameters that can be passed as a flashvar to the badge to customize the badge like changing the button label color, the application name color, etc.  For a listing of all of these, see the demo included with the <a href="http://labs.adobe.com/wiki/index.php/AIR_Badge">badge install swf</a>.
<a href='http://knomedia.com/air/badgeBuilder/'>
<img src="http://knomedia.com/blog/wp-content/uploads/2008/08/bb_icon_128.png" alt="" title="Badge Builder" width="128" height="128" class="alignleft size-full wp-image-58" /></a>
<b>Badge Builder</b>
I'm actually finishing up a small AIR app called 'Badge Builder' that facilitates writing all the necessary HTML, JavaScript, etc to quickly create a Badge Install page.  I'll post it up as soon as I'm finished.  Stay tuned.



jason
