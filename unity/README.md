Unity example about receiving OSC data through WebSocket.

![p5js-unity](http://floatcc.intplusplus.org/p5js-unity.gif)

## WebSocket

[websocket-sharp](https://github.com/sta/websocket-sharp)

It's a C# implementation. I have built a `websocket-sharp.dll` and added it into `Assets/` folder.    
If the dll does not work for you, you can [build it yourself](https://github.com/sta/websocket-sharp#self-build).


## OSC data parse

There are serveral OSC libraries for Unity, but actually only OSC data packing and parsing (unpacking) is necessary here.   
[VVVVUnityOSC](https://github.com/frankiezafe/VVVVUnityOSC) has convenient methods to do this.

packing: `new OSCMessage("/unity/midi", 87).BinaryData`    
unpacking: `OSCPacket.Unpack(oscPacketRawData)`


-----
Welcome PR! 👏

Cheers~

Contra

- patreon (**buy me a coffee** XD): [avantcontra](https://www.patreon.com/avantcontra)
- website: [floatbug.com/contra](https://www.floatbug.com/contra)
- facebook: [avantcontra](https://facebook.com/avantcontra)
- twitter: [avantcontra](https://twitter.com/avantcontra)
- 微信公众号/知乎专栏：[浮生开方](https://zhuanlan.zhihu.com/floatlab)
