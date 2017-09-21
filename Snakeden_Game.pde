
ArrayList<Player> players;
static int PLAYERS = 20;
PGraphics mainG, playerLayer;

void  update() {
  playerLayer.loadPixels();

  for ( Player p : players ) {
    p.update();
  }
}

void setup() {
  size(500, 500);

  //initialize players
  players = new ArrayList(PLAYERS);
  Player p;
  for (int i=0; i < PLAYERS; ++i) {
    float x, y;
    Direction d;
    if( i < PLAYERS / 2 ) {
      x = (i+1)*0.1*width;
      y = 0.1*height;
      d = Direction.DOWN;
    } else {
      x = ((int(i - PLAYERS / 2)) + 0.5)*0.1*width;
      y = 0.9*height;
      d = Direction.UP;
    }
    
    p = new Player("test", x, y , 0);
    p.changeDirection(d);
    players.add(p);
  }
  
  println(players);


  stroke(0);
  rect(3, 3, width-6, height-6);
  textSize(10);
  
  mainG = getGraphics();
  playerLayer = mainG;
}

void  draw() {
  update();
  for (Player p : players ) { 
    p.render(mainG);
  }
  
  //if(false) {
  //  fill(50);
  //  rect(0,0,100,50);
  //  fill(200);
  //  text("fps: " + frameRate, 5,20);
  //}
}

boolean collision() {
  return false;
}

public enum Direction {
  UP, DOWN, LEFT, RIGHT, NONE
}