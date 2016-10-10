class Entity{
  float posX, posY;
  float w, h;
  float radius;
  
  Entity(float posX, float posY, float w, float h){
    this.posX = posX;
    this.posY = posY;
    this.w = w;
    this.h = h;
  }
  
  //takes an entity and compares it to this one
  boolean isCollide(Entity e){
    if (dist(this.posX, this.posY, e.posX, e.posY) < (e.radius + this.radius)) {
      return true;
    } else {
      return false;
    }
  }
  
  //takes specific stuf and detects collision
  boolean isCollide(float x, float y, float size){
    if (dist(this.posX, this.posY, x, y) < (size + this.radius)) {
      return true;
    } else {
      return false;
    }
  }
}