import processing.net.*;
Player p;
Client client;
boolean isConnected = false;
boolean[] keysPressed = new boolean[256];
ArrayList<Entity> entities = new ArrayList<Entity>();
void setup() {
  size(800, 600);
  background(0);
  client = new Client(this, "127.0.0.1", 5204);
  isConnected = client.active();
  entities.add(new Player(width/2, height/2));
  frameRate(60);
  //tell the server about the player
  if(isConnected){
      client.write(entities.get(0).id+","+entities.get(0).posX+","+entities.get(0).posY+","+entities.get(0).w+","+entities.get(0).h+","+"e");
  }
}

void draw() {
  background(0);
}

void keyPressed() {
  println(keyCode);
  keysPressed[keyCode] = true;
}

void keyReleased() {
  keysPressed[keyCode] = false;
}