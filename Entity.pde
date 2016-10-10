class Entity{
  float posX, posY;
  float w, h;
  
  Entity(float posX, float posY, float w, float h){
    this.posX = posX;
    this.posY = posY;
    this.w = w;
    this.h = h;
  }
  
  boolean isCollide(float x, float y, float size){
    if (dist(posX, posY, x, y) < w + size) {
      return true;
    } else {
      return false;
    }
  }
}