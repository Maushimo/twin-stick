Player p;
Box b;

boolean[] keysPressed = new boolean[256];
void setup() {
  size(800, 600);
  background(0);

  p = new Player(width/2, height/2);
  b = new Box(200, 300);

  frameRate(60);
}

void draw() {
  background(0);
  b.draw();
  p.draw();

  if (p.b != null) {
    if (b.isCollide(p.b)) {
      p.b = null;
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