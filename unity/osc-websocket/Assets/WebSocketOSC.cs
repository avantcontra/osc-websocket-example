using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using WebSocketSharp;
using WebSocketSharp.Server;
using VVVV_OSC;

public class Echo : WebSocketBehavior
{
    //receive from p5js (WebSocket client)
    protected override void OnMessage(MessageEventArgs e)
    {
        if (e.IsText)
        {
            // Do something with e.Data.
            Debug.Log(e.Data);

            return;
        }

        if (e.IsBinary)
        {
            // Do something with e.RawData.

            //Debug.Log(e.RawData);

            OSCPacket msg = OSCPacket.Unpack(e.RawData);
            //Debug.Log(msg);

            Debug.Log(string.Format("received OSC address: {0}, value: {1}", msg.Address, msg.Values[0]));

            return;
        }
    }

    protected override void OnOpen()
    {
        Debug.Log("some one connected in");
        //send from Unity (WebSocket server) to p5js (WebSocket client)
        Send(new OSCMessage("/unity/midi", 87).BinaryData);

    }

    protected override void OnError(ErrorEventArgs e)
    {
        Debug.Log(e.Message);

    }

    protected override void OnClose(CloseEventArgs e)
    {
        Debug.Log(e.ToString());
    }
}

public class WebSocketOSC : MonoBehaviour
{
    public WebSocketServer wssv;
    // Use this for initialization
    void Start()
    {
        wssv = new WebSocketServer("ws://127.0.0.1:12345");

        wssv.AddWebSocketService<Echo>("/");

        wssv.Log.Level = LogLevel.Trace;

        wssv.Start();

        Debug.Log("waiting connect");

        //   wssv.Stop();

        //   Debug.Log("stop");

    }

    // Update is called once per frame
    void Update()
    {

    }
}

