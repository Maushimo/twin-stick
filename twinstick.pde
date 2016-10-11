import processing.net.*;
Client client;

boolean isConnected = false;
boolean[] keysPressed = new boolean[256];
ArrayList<Entity> entities = new ArrayList<Entity>();
Player player;
Box box001;

void setup() {
  size(800, 600);
  background(0);
  
  client = new Client(this, "127.0.0.1", 5204);
  isConnected = client.active();
  
  player = new Player(width/2, height/2);
  entities.add(player);
  
  box001 = new Box(100, 100);
  entities.add(box001);
  
  frameRate(60);
  //tell the server about the player
  if(isConnected){
      client.write(entities.get(0).id+","+entities.get(0).posX+","+entities.get(0).posY+","+entities.get(0).w+","+entities.get(0).h+","+"e");
  }
}

void draw() {
  background(0);
  
  box001.draw();
  player.draw();
  
  /**
  if(box001.isCollide(player)){
    if(player.posX > box001.posX+box001.w){
      player.posX += 5;
    }
    if(player.posX < box001.posX){
      player.posX -= 5;
    }
    if(player.posY > box001.posY+box001.h){
      player.posY += 5;
    }
    if(player.posY < box001.posY){
      player.posY -= 5;
    }
  }
  */
  
  if(player.bullet != null){
    if(box001.isCollide(player.bullet)){
      player.bullet = null;
    }
  }
  
}

void keyPressed() {
  println(keyCode);
  keysPressed[keyCode] = true;
}

void keyReleased() {
  keysPressed[keyCode] = false;
}