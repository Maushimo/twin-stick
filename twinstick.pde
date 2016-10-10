import processing.net.*;
Player p;
Client client;
boolean isConnected = false;
boolean[] keysPressed = new boolean[256];
ArrayList<Entity> entities = new ArrayList<Entity>();
Player player;
void setup() {
  size(800, 600);
  background(0);
  client = new Client(this, "127.0.0.1", 5204);
  isConnected = client.active();
  player = new Player(width/2, height/2);
  entities.add(player);
  frameRate(60);
  //tell the server about the player
  if(isConnected){
      client.write(entities.get(0).id+","+entities.get(0).posX+","+entities.get(0).posY+","+entities.get(0).w+","+entities.get(0).h+","+"e");
  }
}

void draw() {
  background(0);
  player.draw();
}

void keyPressed() {
  println(keyCode);
  keysPressed[keyCode] = true;
}

void keyReleased() {
  keysPressed[keyCode] = false;
}