# osc-websocket-example
Examples about receiving OSC data through WebSocket.



## Background
Sometimes I meet situations where I need OSC but cannot use UDP.  

Such as sending OSC message from browser-based p5js to Processing / MaxMSP / Unity.  
And my OSC controller called **BugOSC**, a [`WeChat Mini Program`](https://developers.weixin.qq.com/miniprogram/en/introduction/index.html?t=18110512), which also does not support UDP.

However, although they don't support UDP, they support WebSocket, another network transmission protocol.

Here are examples about receiving OSC data through WebSocket sent from p5js for example.  
The transporting data are binary packets (ArrayBuffer, byte[]) following the standard OSC format.

## WebSocket Client

The p5js sketch in [p5js-client](https://github.com/avantcontra/osc-websocket-example/tree/master/p5js-client).

Use library [osc.js](https://github.com/colinbdclark/osc.js) to pack and parse OSC data.   
And osc.js itself supports UDP, Serial port, WebSocket and TCP, Wow!

## WebSocket Server

- [Max](https://github.com/avantcontra/osc-websocket-example/tree/master/max)
    - Use `[Node for Max](https://github.com/Cycling74/n4m-examples)` of Max 8 and [osc.js](https://github.com/colinbdclark/osc.js).
- [Processing](https://github.com/avantcontra/osc-websocket-example/tree/master/processing)
    - WebSocket lib is [Websockets for Processing](https://github.com/avantcontra/processing_websockets) which I forked to fix a bug about byte support. 
    - OSC lib is [oscP5](http://www.sojamo.de/libraries/oscp5/)
- [Unity](https://github.com/avantcontra/osc-websocket-example/tree/master/unity)
    - WebSocket lib is [websocket-sharp](https://github.com/sta/websocket-sharp)
    - OSC packet parser is [VVVVUnityOSC](https://github.com/frankiezafe/VVVVUnityOSC)
- [VVVV](https://github.com/avantcontra/osc-websocket-example/tree/master/vvvv) (Readme only)
- [Pure Data](https://github.com/avantcontra/osc-websocket-example/tree/master/puredata) (Readme only)

## *Bridge 

Of course also can make a third party NodeJS/Processing/Python/etc BRIDGE focus on receiving data through WebSocket and forwarding to other OSC receivers:   
`p5js-client <---WebSocket---> BRIDGE <---OSC---> Max/Processing/Unity/Arduino/etc`


----



Welcome PR! 👏


Cheers~

Contra

- patreon (**buy me a coffee** XD): [avantcontra](https://www.patreon.com/avantcontra)
- website: [floatbug.com/contra](https://www.floatbug.com/contra)
- facebook: [avantcontra](https://facebook.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- 微信公众号/知乎专栏：[浮生开方](https://zhuanlan.zhihu.com/floatlab)
