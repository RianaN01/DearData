PImage mapImage;

//drag and explore
boolean dragging = false;
float explorerX = 129;
float explorerY = 403;
int selectedLocation = -1;

//my canal coordinates. matching x and y coordinates
float[] canalX = {
  129,191,242,304,353,413,
  494,613,711,759,792,826
};

float[] canalY = {
  403,399,368,312,265,256,
  284,303,314,328,360,355
};

//approx location positions along canal
int[] locationPositions = {1,6,7,11};

String[] letters = {"D","C","B","A"};

String[] names = {
  "Regent's Canal Towpath",
  "City Road Lock 5",
  "Haggerston Bridge",
  "Cat and Mutton Bridge"
};


color[] locationColours;

void setup() {
  size(1100,700);
  smooth();
 
  mapImage = loadImage("mapimage.png");
  textFont(createFont("Arial", 14));
  
  locationColours = new color[] {
    color(180,100,255),
    color(255,57,3),
    color(70,240,120),
    color(255,170,50)
  };
}



void draw() {
  background(20,30,40);
  
  //display map image
  if (mapImage != null) {
    image(mapImage, 0, 0, width, height);
  }
  
  
  
  drawCanal();
  drawLocations();
  drawKey();
  drawTitle();
  
  if (dragging ||
    dist(mouseX, mouseY, explorerX, explorerY) < 25) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

  
//draw one layer of the canal
void canalLayer(float thickness, color shade) {
  noFill();
  stroke(shade);
  strokeWeight(thickness);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  beginShape();
  
  for (int i = 0; i < canalX.length; i++) {
    vertex(canalX[i], canalY[i]);
  }
  
  endShape();
}


void drawCanal() {
  //wide transparent layers to create glow effect
  canalLayer(68, color(0,120,255,10));
  canalLayer(58, color(0,130,255,18));
  canalLayer(48, color(0,140,255,30));
  canalLayer(39, color(0,150,255,65));
  
  //main canal and bright centre
  canalLayer(30, color(0,115,235));
  canalLayer(24, color(0,155,255));
  canalLayer(15, color(0,180,255));
  canalLayer(2, color(135,235,255,200));
}

void drawLocations() {
  for (int i = 0; i < 4; i++) {
    int position = locationPositions[i];
    
    float x = canalX[position];
    float y = canalY[position];
    
    //coloured glow of canal
    noStroke();
    fill(locationColours[i],40);
    circle(x,y,46);
    
    //outer ring
    noFill();
    stroke(locationColours[i],160);
    strokeWeight(2);
    circle(x,y,32);
    
    //highlight the selected location
    if (selectedLocation == i) {
      circle(x,y,46);
    }
    
    //location dot
    fill(locationColours[i]);
    stroke(10,30,40);
    circle(x,y,20);
    
    //letter below the dot
    fill(255);
    textSize(14);
    textAlign(CENTER,CENTER);
    text(letters[i], x,y+32);
  }
}



//key
void drawKey() {
  //rounded key box on top right
  noStroke();
  fill(10,30,40);
  rect(870,50,200,250,20);
  
  //key heading
  fill(255);
  textAlign(LEFT,BASELINE);
  textSize(20);
  text("LOCATION KEY", 885,85);
  
  //location D - purple
  fill(180,100,255);
  circle(890,125,14);
  
  fill(255);
  textSize(12);
  text("D - Regent's Canal", 905,123);
  text("Towpath",905,138);
  
  //location C - red
  fill(255,57,3);
  circle(890,170,14);
  
  fill(255);
  text("C - City Road Lock 5",905,175);
  
  //location B - green
  fill(70,240,120);
  circle(890,215,14);
  
  fill(255);
  text("B - Haggerston",905,213);
  text("Bridge",905,228);
  
  //location A - orange
  fill(255,170,50);
  circle(890,260,14);
  
  fill(255);
  text("A - Cat and Mutton",905,258);
  text("Bridge",905,273);
}


void drawTitle() {
  
  //rounded title box
  noStroke();
  fill(10,30,40);
  rect(20,15,535,85,20);
  
  //title
  fill(255);
  textSize(28);
  textAlign(LEFT,BASELINE);
  text("CANAL WATER pH ANALYSIS",35,50);
  
  //subtitle
  fill(180,200,220);
  textSize(15);
  text("100 samples - 4 locations",35,78);
}

   
void mousePressed() {
  
  //keep printing mouse coordinates
  println("X: " + mouseX + " Y: " + mouseY);
  
  //start dragging when the white marker is clicked
  if (dist(mouseX,mouseY,explorerX,explorerY) < 25) {
    dragging = true;
  }
}



    
