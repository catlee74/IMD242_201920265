void setup() {
  size(360, 600);
  rectMode(CENTER);
}

void draw() {
  background(0);
  if (mouseY < height*.25) {
    line(width*.25+50, height*.25-100,
    width*.5+50, height*.25-40);
  } else if (mouseY < height*.5) {
    rect(width*.5, height*3/8, 100, 100);
  } else if (mouseY < height*3/4) {
    rect(width*.5, height*5/8, 100, 100, 20);
  } else {
    ellipse(width*.5, height*7/8, 100, 100);
  }

  stroke(127);
  strokeWeight(4);
  line(0, height*.25, width, height*.25);
  line(0, height*.5, width, height*.5);
  line(0, height*3/4, width, height*3/4);
}
