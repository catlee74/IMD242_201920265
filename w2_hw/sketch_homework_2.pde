int x, y=250;

void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed==true) {
    background(87, 95, 145);
  } else {
    background(169, 216, 227);
  }

//햇님달님
  if (mousePressed==true) {
    noStroke();
    fill(255,245,157);
    ellipse(250, 80, 80, 80);
  } else {
    fill(255,165,90);
    ellipse(250, 80, 80, 80);
  }
  
  //잔디
  if (mousePressed==true) {
    fill(86,144,110);
    rect(0, 400, 500, 100);
  } else {
    fill(102,180,102);
    rect(0, 400, 500, 100);
  }
  
  noStroke();
  //반투명 원
  //fill(0, 0, 0, 20);
  //ellipse(x, y-20, 300, 300);

  //얼굴
  fill(255, 221, 134);
  triangle(x-95, y, x-90, y-130, x-25, y-80);
  triangle(x+95, y, x+90, y-130, x+25, y-80);
  //triangle(155, 250, 160, 120, 225, 170);
  //triangle(345, 250, 340, 120, 275, 170);
  ellipse(x, y, 200, 190);

  //볼터치
  fill(255, 168, 139, 100);
  ellipse(x+60, y+15, 60, 50);
  ellipse(x-60, y+15, 60, 50);
  //ellipse(310, 265, 60, 50);
  //ellipse(190, 265, 60, 50);

  //눈알
  //fill(100);
  //ellipse(x-40, y-10, 25, 25);
  //ellipse(x+40, y-10, 25, 25);
  //ellipse(210, 240, 25, 25);
  //ellipse(290, 240, 25, 25);

  //뽕주댕이
  fill(255, 249, 234);
  ellipse(x-15, y+25, 40, 40);
  ellipse(x+15, y+25, 40, 40);
  //ellipse(235, 275, 40, 40);
  //ellipse(265, 275, 40, 40);

  //코
  fill(100);
  ellipse(x, y+10, 10, 10);
  //ellipse(250, 260, 10, 10);

  if (mousePressed==true) {
    stroke(100);
    strokeWeight(5);
    line(x-55, y-10, x-25, y-10);
    line(x+25, y-10, x+55, y-10);
    //line(195, 240, 225, 240);
    //line(275, 240, 305, 240);
  } else {
    fill(100);
    ellipse(x-40, y-10, 25, 25);
    ellipse(x+40, y-10, 25, 25);
  }


  x=mouseX;
  y=mouseY;
}
