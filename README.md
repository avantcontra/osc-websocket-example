# osc-websocket-example
Examples about receiving OSC data through WebSocket server.



## Background
**BugOSC** (a [`WeChat Mini Program`](https://developers.weixin.qq.com/miniprogram/en/introduction/index.html?t=18110512)) is an OSC controller based on WebSocket.

Here are examples about receiving OSC data sent from BugOSC through WebSocket, which is the only net transporting method of `WeChat Mini Program`( no UDP).

## WebSocket

BugOSC is WebSocket Client.

Receiver is WebSocket Server.

The transporting data are binary packets (ArrayBuffer, byte[]) following the standard OSC format.

## OSC data parse
Just use the common OSC libraries to parse the data, such as [osc.js](https://github.com/colinbdclark/osc.js), [oscP5](http://www.sojamo.de/libraries/oscp5/), etc.

## Example

- MaxMSP
- [Processing](https://github.com/avantcontra/osc-websocket-example/tree/develop/processing)
- p5.js 
- Unity
- ...

Welcome PR! 👏

-----

Cheers~

Contra

- website: [floatbug.com/contra](https://www.floatbug.com/contra)
- facebook: [avantcontra](https://facebook.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- patreon (buy me a coffee): [avantcontra](https://www.patreon.com/avantcontra)
- 微信公众号/知乎专栏：[浮生开方](https://zhuanlan.zhihu.com/floatlab)