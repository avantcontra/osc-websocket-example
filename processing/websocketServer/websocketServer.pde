import websockets.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

WebsocketServer ws;
int now;
float x,y;

void setup(){
  size(400,400);
  
  now = millis();
  x = 0;
  y = 0;

  //WebSocket
  ws = new WebsocketServer(this,12345,"/");
  //OSC (UDP)
  oscP5 = new OscP5(this,12346);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12346);
}

void draw(){
  background(0);
  ellipse(x,y,10,10);
  
  //send from websocket server to client
  //if(millis()>now+500){
  //  now=millis();
  //  ws.sendMessage(str(now));
  //}
}

//String data 
void webSocketServerEvent(String msg){
  println(msg);
  //JSONObject json = parseJSONObject(msg);
  //if (json == null) {
  //   println("JSONObject could not be parsed");
  // } else {
  //   String species = json.getString("address");
  //   println(species);
  // }
  x = random(width);
  y = random(height);
}

//Binary data 
void webSocketServerEvent(byte[] buf, int offset, int length){
  //send to OSC (UDP)
  OscP5.flush(buf, myRemoteLocation);
  
  x = random(width);
  y = random(height);
}

//receive OSC (UPD)
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  println("#### received osc msg. address: " + theOscMessage.addrPattern() + ", type: " + theOscMessage.typetag());

  if(theOscMessage.checkTypetag("i")) {
    /* parse theOscMessage and extract the values from the osc message arguments. */
    int firstValue = theOscMessage.get(0).intValue();  
    print(theOscMessage.addrPattern() + " with typetag i.");
    println(" values: "+firstValue);
    
  } 
  if(theOscMessage.checkTypetag("f")) {
    /* parse theOscMessage and extract the values from the osc message arguments. */
    float firstValue = theOscMessage.get(0).floatValue();  
    print(theOscMessage.addrPattern() + " with typetag f.");
    println(" values: "+firstValue);
  }
}
