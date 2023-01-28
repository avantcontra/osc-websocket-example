Max example about receiving OSC data through WebSocket.

![p5js-max](http://float.intplusplus.cn/p5js-max.gif)

There have been already some Max to web browser showcases:

- [xebra.js from MiraWeb](https://github.com/Cycling74/miraweb/tree/master/packages/xebra.js)

- [wsserver](https://github.com/olilarkin/wsserver)

Now Max 8 has a wonderful feature `Node for Max`. So the WebSocket and OSC functions in this example are actually implemented through NodeJS.

Use library [osc.js](https://github.com/colinbdclark/osc.js) to pack and parse OSC data.   
And osc.js itself supports WebSocket (and UDP, Serial port,  TCP), so that's all.

Cycling74 also has a WebSocket (no OSC) example: [max_socket](https://github.com/Cycling74/n4m-examples/tree/master/sockets). 


-----
Welcome PR! 👏

Cheers~

Contra

- patreon (**buy me a coffee** XD): [avantcontra](https://www.patreon.com/avantcontra)
- website: [avantcontra.com](https://www.avantcontra.com)
- instagram: [avantcontra](https://instagram.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- 微信公众号/知乎/抖音/小红书/B站：[实验编程](https://space.bilibili.com/309452713)
