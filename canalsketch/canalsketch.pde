void setup() {
  size(1100,700);
  textFont(createFont("Arial", 14));
}

void draw() {
  background(235,245,247);
  
  noStroke();
  fill(255);
  rect(40, 30, 920, 580, 20);
  
  fill(30,65,75);
  textAlign(CENTER);
  textSize(27);
  text("CANAL WATER QUALITY", width/2,80);
}
