
var host = 'localhost:12345';
var oscWebSocket;
var statusMessage = 'not connected';

function setup() {
  createCanvas(400, 400);
  // connect to WebSocket server:
  oscWebSocket = new osc.WebSocketPort({
    url: "ws://localhost:12345", 
    metadata: true
	});
  
  oscWebSocket.on("ready", onSocketOpen);
  oscWebSocket.on("message", onSocketMessage);
  
  oscWebSocket.open();
}

function draw() {
  background("#2307AF");
  fill(255);
  text(statusMessage, 50, 50);
}

function onSocketOpen(e) {
  print('server connected');
  statusMessage = 'server connected';
  // send the OSC message to server. (osc.js will convert it to binary packet):
  oscWebSocket.send({
        address: "/p5js/freq",
        args: [
            {
                type: "f",
                value: 440
            }
        ]
    });
}

function onSocketMessage(event) {
  print(event);
}