class Player {
  PVector pos, prevPos;
  Direction d = Direction.NONE;
  int speed = 1;
  color c;
  String name;
  
  Player(String name, float x, float y, color c) {
    this.name = name;
    this.pos = new PVector(x,y);
    this.prevPos = this.pos.copy();
    this.c = c;
  }
  
  PVector getPos() { return pos; }
  
  //TODO: implement update based on direction
  PVector update() {
    switch(d) {
      case UP:
        pos.y -= speed;
        break;
      case DOWN:
        pos.y += speed;
        break;
      case LEFT:
        pos.x -= speed;
        break;
      case RIGHT:
        pos.x += speed;
        break;
      case NONE:
        break;
    }
    return pos;
  }
  
  void render(PGraphics pg) {
    pg.pushStyle();
    pg.stroke(c);
    pg.fill(c);
    pg.line(prevPos.x,prevPos.y,pos.x,pos.y);
    pg.popStyle();
  }
  
  void changeDirection(Direction d) { this.d = d;}
  
  String toString() {
    return "[player:"+name+"] " + "("+pos.x+","+pos.y+")" + "::" + d;
  }
}