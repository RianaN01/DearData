PImage mapImage;

void setup() {
  size(1100,700);
  mapImage = loadImage("mapimage.png");
  textFont(createFont("Arial", 14));
}

void draw() {
  
  //display maps image
  image(mapImage, 0, 0, width, height);
  
  //blue highlight of canal
  stroke(0,150,255);
  strokeWeight(30);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  line(129,403,191,399);
  line(191,399,242,368);
  line(242,368,304,312);
  line(304,312,353,265);
  line(353,265,413,256);
  line(413,256,494,284);
  line(494,284,613,303);
  line(613,303,711,314);
  line(711,314,759,328);
  line(759,328,792,360);
  line(792,360,826,355);
  
  noStroke();
  
  //rounded key box on top right
  noStroke();
  fill(10,30,40);
  rect(870,50,200,250,20);
  
  //key heading
  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("LOCATION KEY",885,85);
  
  //location D - purple
  fill(180,100,255);
  circle(890,125,14);
  
  fill(255);
  textSize(12);
  text("A - Regent's Canal", 905, 123);
  text("Towpath", 905, 138);
  
  //location C - red
  fill(255,57,3);
  circle(890,170,14);
  
  fill(255);
  text ("C - City Road Lock 5", 905, 175);
  
  //location B - green
  fill(70,240,120);
  circle(890,215,14);
  
  fill(255);
  text("B - Haggerston", 905, 213);
  text("Bridge",905,228);
  
  //location A - orange
  fill(255,170,50);
  circle(890,260,14);
  
  fill(255);
  text("A - Cat and Mutton", 905, 258);
  text("Bridge", 905, 273);
  
  
  //title of project
  fill(255);
  textSize(28);
  textAlign(LEFT);
  text("CANAL WATER pH ANALYSIS", 35, 50);
  
  //subtitle
  fill(180,200,220);
  textSize(15);
  text("100 sample - 4 locations", 35, 78);
}

//used to help me draw the blue outline of canal
void mousePressed() {
  
  println("X: " + mouseX + " Y: " + mouseY);
}
