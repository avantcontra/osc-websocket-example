
var currentHost = 'no input';
var oscWebSocket;
var statusMessage = 'not connected';
var receivedMessage = '';

let inputMessage;
let inputHost;

function setup() {
  createCanvas(400, 400);

  let button = createButton('connect');
  button.position(250, 80);
  button.mousePressed(onConnectClick);

  inputMessage = createInput();
  inputMessage.position(50, 270);

  inputHost = createInput();
  inputHost.position(50, 90);

  let buttonSend = createButton('send');
  buttonSend.position(250, 260);
  buttonSend.mousePressed(onSendClick);

  textSize(16);
}

function draw() {
  background('#999999');
  fill(255);
  text('host example: 192.168.1.23:12345', 50, 40);
  text('current host:  ' + currentHost, 50, 70);
  text(statusMessage, 50, 150);
  text(receivedMessage, 50, 190);
  text('input some message:', 50, 250);
}

function onConnectClick() {
  currentHost = inputHost.value();
  inputHost.value('');

  // connect to WebSocket server:
  try {
    oscWebSocket = new osc.WebSocketPort({
      url: "ws://" + currentHost,
      metadata: true
    });
  
    oscWebSocket.on("ready", onSocketOpen);
    oscWebSocket.on("message", onSocketMessage);
    oscWebSocket.on("error", function(e){
      print(e.message);
    });
  
    oscWebSocket.open();
  } catch(e) {
    print(e);
    statusMessage = e;
  }
  
}

function onSendClick() {
  const msg = inputMessage.value();
  inputMessage.value('');

  // send the OSC message to server. (osc.js will convert it to binary packet):
  oscWebSocket.send({
    address: "/p5js/sayhi",
    args: [
      {
        type: "s",
        value: msg
      }
    ]
  });
}


function onSocketOpen(e) {
  print('server connected');
  statusMessage = 'server connected';
  
}

function onSocketMessage(message) {
  print(message);
  if (message) {
    receivedMessage = 'address: ' + message.address;

    if (message.args && message.args.length > 0) {
      receivedMessage += ', value: ' + message.args[0].value;
    }
  }
}