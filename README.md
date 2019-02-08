# osc-websocket-example
Examples about receiving OSC data through WebSocket.



## Background
Sometimes I meet situations where I need OSC but cannot use UDP.  

Such as sending OSC message from browser-based p5js to Processing / MaxMSP / Unity.  
And my OSC controller called **BugOSC**, a [`WeChat Mini Program`](https://developers.weixin.qq.com/miniprogram/en/introduction/index.html?t=18110512)), which also does not support UDP.

However, although they don't support UDP, they support WebSocket, another network transmission protocol.

Here are examples about receiving OSC data through WebSocket sent from p5js for example.

## WebSocket Client

The p5js sketch in [p5js-client](https://github.com/avantcontra/osc-websocket-example/tree/master/p5js-client).

Use library [osc.js](https://github.com/colinbdclark/osc.js) to pack and parse OSC data.  
The transporting data are binary packets (ArrayBuffer, byte[]) following the standard OSC format.

## WebSocket Server

- MaxMSP
- [Processing](https://github.com/avantcontra/osc-websocket-example/tree/master/processing)
    - OSC lib is  [oscP5](http://www.sojamo.de/libraries/oscp5/)
- p5.js 
- Unity
- ...


----



Welcome PR! 👏


Cheers~

Contra

- patreon (**buy me a coffee** XD): [avantcontra](https://www.patreon.com/avantcontra)
- website: [floatbug.com/contra](https://www.floatbug.com/contra)
- facebook: [avantcontra](https://facebook.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- 微信公众号/知乎专栏：[浮生开方](https://zhuanlan.zhihu.com/floatlab)
