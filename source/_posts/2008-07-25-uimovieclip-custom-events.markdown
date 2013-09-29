---
layout: post
title: "UIMovieClip Custom Events"
date: 2008-07-25 14:32
published: false
footer: true
comments: false
categories: [flash, flash-components, flex]
---

I've been using the <a href="http://www.adobe.com/cfusion/exchange/index.cfm?event=extensionDetail&amp;loc=en_us&amp;extid=1273018">Flex Integration Kit</a> to create my own custom components in Flash for use in Flex lately.  Coming from an all ActionScript (not necessarily MXML) background there are a few things to watch for.  One of them being Custom Events in your newly created component.

In order for Flex to recognize your Custom Event you need to include the event meta data in your AS Class file.  For example, in an AS setting your class could fire off an event like so:

<pre lang="actionscript">
private function updateHandler(e:MouseEvent):void
{
    var evt:MyEvent = new MyEvent(MyEvent.VOLUME);
    evt.volume =//some volume value;
    this.dispatchEvent(evt);
}

</pre>

In an all ActionScript setting this works fine.  However when you compile this UIMovieClip into a swc file and use it in a Flex Project, Flex has no way to recognize the MyEvent.VOLUME.  In the Flex Editor it won't appear as a code hint.  If you manually force it into the MXML, you'll get an error.  In order to allow Flex to know of the event you will need to include some Event meta data at the top of your ActionScript Class.   For example:

<pre lang="actionscript">
[Event (name="volume", type="com.knomedia.events.MyEvent")]
public class VolumeControl extends UIMovieClip
{
    //Class members here
}

</pre>
<br />
The meta data needs the 'name' of the Event.  This is the string literal that the event constant holds.  In this case MyEvent.VOLUME holds the value "volume".  The type attribute is the fully qualified name of your Custom Event Class.  The placement of the meta data is important, it needs to be on the line above your class declaration.  Once you have that in place you can compile your swc.

My only beef with the technique is that you need to use the actual string literal.  I understand the need (for ease of use in MXML), but I am more comfortable using class constants of the Event Class... Anyway.

In MXML you can now set the volume attribute to listen for the event to fire:

<pre lang="mxml">
<swc:VolumeControl id="vol" volume="{volumeHandler(event);}" />

</pre>

The switch from all ActionScript to MXML is pretty painless.  Occasionally a small issue like this will make you feel stupid, but overall it isn't a big jump.

Jason
