import websockets.*;
import oscP5.*;
import netP5.*;

WebsocketServer ws;

OscP5 oscP5;
NetAddress oscHost;

float x,y;

void setup(){
  size(400,400);
  
  x = 0;
  y = 0;

  //WebSocket
  ws = new WebsocketServer(this, 12345, "/");
  //OSC (UDP)
  oscP5 = new OscP5(this,12346);
  oscHost = new NetAddress("127.0.0.1", 12346);
}

void draw(){
  background(0);
  ellipse(x,y,10,10);
}


//Binary data received from WebSocket Client 
void webSocketServerEvent(byte[] buf, int offset, int length){
  //send to OSC (UDP) to parse the data
  OscP5.flush(buf, oscHost);
  
  x = random(width);
  y = random(height);
}

//String data received from WebSocket Client
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


//OSC (UPD) data received to parse
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
  if(theOscMessage.checkTypetag("s")) {
    /* parse theOscMessage and extract the values from the osc message arguments. */
    String firstValue = theOscMessage.get(0).stringValue();  
    print(theOscMessage.addrPattern() + " with typetag s.");
    println(" values: "+firstValue);
  }
}
