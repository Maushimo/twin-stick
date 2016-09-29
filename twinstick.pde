Player p;

boolean[] keysPressed = new boolean[256];
void setup() {
  size(800, 600);
  background(0);
  
  p = new Player(width/2, height/2);
  
  frameRate(60);
}

void draw(){
  background(0);
  p.draw();
}

void keyPressed(){
  println(keyCode);
  keysPressed[keyCode] = true;
}

void keyReleased() {
  keysPressed[keyCode] = false;
}