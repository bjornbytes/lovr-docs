WebVR
===

LÖVR is able to run in the browser using WebVR.  This guide explains some of the differences between
running LÖVR on the desktop and running in the browser, and how to get up and running.

First, you'll need to make sure your browser supports WebVR.  Visit [webvr.info](http://webvr.info)
to find a browser that works with your headset.

Next, you'll need a LÖVR project.  The <a data-key="Getting_Started">Getting Started</a> guide teaches
you how to make a simple project with a spinning cube in it.

Now we need to make a `.lovr` file from our project.  To do this, simply select all the files in
your project and create a `.zip` file from them.  It is important to zip up all the files, _not_ the
folder that contains them.  If you want, you can change the extension from `.zip` to `.lovr`.

Finally, visit [lovr.org/share](/share) and drag and drop the `.lovr` file into your window.  Your
project should be running in WebVR!

Differences
---

There are a few differences when running LÖVR in the browser:

<ol>
  <li>Audio is not spatialized.</li>
  <li><code>Controller:newModel</code> will always return <code>nil</code>.</li>
  <li><code>lovr.headset.getBoundsGeometry</code> will return a table with four zero vectors in it</li>
  <li><code>lovr.getOS</code> will return "Web".</li>
</ol>
