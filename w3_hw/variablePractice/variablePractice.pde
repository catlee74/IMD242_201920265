float x;
float y;
float s;
float r, g, b;
float line;
float whiteLine;
float c;

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  y=random(1000);
  s=random(500);
  r=random(200.250);
  g=random(200, 250);
  b=random(200, 250);
  line=random(2000);
  whiteLine=random(5);
  c=random(100, 200);
  noStroke();
  
  fill(c, 10);
  ellipse(width*.5, height/20, s-100, s-100);

  fill(c, 20);
  ellipse(width*.5, height*.25, s-50, s-50);

  fill(c, 50);
  //ellipse(width*.5, height*.5, s+100, s+100);

  fill(c, 20);
  ellipse(width*.5, height*.7, s-50, s-50);

  fill(c, 10);
  ellipse(width*.5, height*.9, s-100, s-100);

  //stroke(255);
  fill(c, 50);
  ellipse(width*.5, height*.5, s+100, s+100);

  noFill();
  //stroke(c, 20);
  ellipse(width*.5, height*.5, line, line);

  //stroke(c, 30);
  //strokeWeight(3);
  ellipse(width*.5, height*.5, line-1000, line-1000);

  stroke(255, 255, 255);
  strokeWeight(whiteLine);
  ellipse(0, height*.5, line-1000, line-1000);

  stroke(255, 255, 255);
  strokeWeight(whiteLine);
  ellipse(width, height*.5, line-1000, line-1000);
}

void mousePressed() {
  background(255);
}

void mouseMoved() {

  noStroke();
  //stroke(255);
  fill(250, g, b, 80);
  ellipse(width/2, 500, s+100, s+100);

  //원1
  stroke(255, 255, 255, 30);
  fill(r-70, g-20, b-70, 10);
  ellipse(width*.5, height/20, s-100, s-100);

  //원2
  fill(r, 200, b, 20);
  ellipse(width*.5, height*.25, s-50, s-50);

  //원3
  fill(r, g, 250, 20);
  ellipse(width*.5, height*.7, s-50, s-50);

  //원4
  fill(r-70, g-20, b-70, 30);
  ellipse(width*.5, height*.9, s-100, s-100);

  noFill();
  stroke(250, g, b);
  ellipse(width*.5, height*.5, line, line);

  stroke(200, g+50, 200, 80);
  strokeWeight(3);
  ellipse(width*.5, height*.5, line-1000, line-1000);
}
