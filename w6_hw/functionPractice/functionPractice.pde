//아파트 두께
float aptW;
//아파트 높이
float aptH;

//창문 가로세로 개수
int windowX;
int windowY;

void setup() {
  size(800, 800);
  //rectMode(CENTER);
  noLoop();
}

void draw() {
  background(255, 246, 238);
  rectMode(CENTER);
  noStroke();

  //바닥 잔디
  fill(112, 140, 105);
  rect(width, height*.9, width*2, height * 0.5);

  for (int i = 0; i < int(random(5,8)); i++) {
    float xGap = (i-2.7) *125;
    //for (int i = 0; i < 5; i++) {
    //float xGap = (i - 2) *150;}
   //-2*150=-300 그 다음은 -1*150=-150 이런식으로 150px간격으로 그려지는 원리
    apt(xGap);
  }
}


void apt(float xGap) { // 매개변수... 이게 있어야 아파트를 여러개 그릴 수 있음
  pushMatrix();
  //0,0좌표 변경
  translate(width * 0.5 + xGap, height * 0.6);
  //+xGap이 있어야 아파트들이 겹치지 않고 다른 위치에 나옴. 없애면 같은 곳에 그려짐(x좌표가 고정이 되어있게 되니까)

  //아파트 두께
  aptW = random(50, 125);
  //아파트 높이
  aptH = random(150, 200);


  //아파트 몸
  fill(random(118, 200), random(177, 200), 183);
  //fill(118, 177, 183);
  rect(0, 0, aptW, aptH);

  //창문 가로 개수
  windowX = int(random(2, 4));
  //창문 세로 개수
  windowY = int(random(2, 4));

  //창문 너비
  float windowW = aptW/windowX;
  //창문 높이
  float windowH = (aptH-50)/windowY;
  //문이랑 겹쳐서 50px빼줌
  fill(255);

  //창문
  for (int row = 0; row < windowY; row++) {
    for (int col = 0; col < windowX; col++) {
      float x = -aptW*.5 + (col+.5) * windowW;
      //창문은 아파트의 왼쪽 끝 위치를 기준으로 그려질 것임.
      //만약 중앙이 0.0이고 아파트의 너비가 100이라면 왼쪽 끝은 -50. 그래서 -100*0.5하면 -50
      //그리고 col에 0.5을 더해줘야 안삐져나가게 창문이 그려짐.......
      float y = -aptH*.5 + (row+.5 ) * windowH;
      rect(x, y, windowW * 0.5, windowH * 0.5);
    }
  }

  //문
  fill(64, 89, 85);
  rect(0, aptH*.35, aptW *.3, aptH *.3);
  popMatrix();
}
void mousePressed() {
  redraw();
}
