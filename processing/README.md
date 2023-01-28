Processing example about receiving OSC data through WebSocket.

![p5js-processing](http://float.intplusplus.cn/p5js-processing.gif)

## WebSocket

Processing is as a WebSocket Server in example. Actually as a Client is also OK.

There is a very good [processing WebSocket library](https://github.com/alexandrainst/processing_websockets).

But it has one problem: transporting data type is `String` only.

If you need binary data type as BugOSC did, 
fortunately there is a [fork](https://github.com/micuat/processing_websockets) supporting binary data transporting, but with some bugs.

I made a [**bug fixed fork**](https://github.com/avantcontra/processing_websockets) so you can use it before processing WebSocket library author accepting my PR.

Or you can just [**download the JAR library**](https://github.com/avantcontra/processing_websockets/blob/master/webSockets.zip) I built (with Processing 3) directly.




## OSC data parse
Just use [oscP5](http://www.sojamo.de/libraries/oscp5/).

A tip: 
the parser function of oscP5 is private. I didn't fork it, while I just sent it to localhost and received it again using oscP5 UDP and then I got the correct parsed data.


Welcome PR! 👏

-----

Cheers~

Contra

- patreon (**buy me a coffee** XD): [avantcontra](https://www.patreon.com/avantcontra)
- website: [avantcontra.com](https://www.avantcontra.com)
- instagram: [avantcontra](https://instagram.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- 微信公众号/知乎/抖音/小红书/B站：[实验编程](https://space.bilibili.com/309452713)
