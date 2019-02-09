// --------------------------------------------------------------------------
// OSC via WebSocket
// by Contra
// --------------------------------------------------------------------------
"use strict";

const webSocket = require("ws");

const osc = require("osc");
const maxAPI = require("max-api");

const wss = new webSocket.Server({ port: 12345 });

let webSocketPort;

wss.on("connection", function connection(ws) {
	console.log("connection");

	let isConnected = true;

	webSocketPort = new osc.WebSocketPort({
		socket: ws
	});

	ws.on("message", function incoming(message) {
		console.log("received : ", message);

		//message data type is ArrayBuffer
		const msgParsed = osc.readPacket(message, { metadata: true });
		console.log("received parsed : ", msgParsed);

		maxAPI.outlet('message', msgParsed);
	});

	ws.on("error", (err) => {
		console.log("error:", err);
	})

	ws.on("close", function stop() {
		maxAPI.removeHandlers("send");
		console.log("Connection closed");

		ws.terminate();

		isConnected = false;
	});

	// Handle the Max interactions here...
	maxAPI.addHandler("send", (...args) => {
		//console.log("send args: " + args);
		if (webSocketPort && isConnected) {
			webSocketPort.send({
				address: "/max/midi",
				args: [
					{
						type: "i",
						value: args[0]
					}
				]
			});
		}

	});
});

maxAPI.addHandler(maxAPI.MESSAGE_TYPES.ALL, (handled, ...args) => {
	if (!handled) {
		// Max.post('No client connected.')
		// just consume the message
	}
});

