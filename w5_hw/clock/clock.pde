void setup() {
  size(800, 800);
}

void draw() {
  float clockX = width*.5;
  //400
  float clockY =height*.5;
  //400
  float radius = 200;
  //마커들이 배치될 반지름의 값
  //마커들은 중심에서 200px 떨어진 곳에 배치될 것임
  float radiusS = 180;
  //초침 반지름
  float radiusM = 150;
  //분침 반지름
  float radiusH = 100;
  //시침 반지름

  background(27, 28, 33);
  //중심원
  noStroke();
  fill(245);
  ellipse(width*.5, height*.5, 20, 20);

  //시계테두리
  noFill();
  stroke(245);
  strokeWeight(3);
  ellipse(width*.5, height*.5, 450, 450);

  //작은 점으로 된 60개의 마커
  for (int i = 0; i < 360; i+=6) {
    //i는 0이고  360가 되기 전까지 6을 계속 더한다
    float angle = radians(i);
    //사인 코사인이 radians값을 사용해서 바꿔줘야 한다고 함
    float x = clockX + cos(angle) * radius;
    //코사인은 x좌표를 계산하는 삼각함수
    float y = clockY + sin(angle) * radius;
    //사인은 y좌표 계산하는 삼각함수

    //cos(0)=1:
    //sin(0)=0:
    //이라고 함.... 수포자 학대를 멈추어주세요

    //clockX,Y로 마커의 위치를 정함 -> 마커는 중앙에 위치
    //여기서 사인 코사인 값으로 각도를 계산
    //근데 radius를 곱해줌으로서 중앙에서 200px떨어짐

    //즉 처음 점이 찍히는 값은
    //x좌표는 400+1*200 = 600
    //y좌표는 400+0*200 = 400
    //(600,400) 그다음으로 6도씩 기울어져서 찍게 되는 것...

    noStroke();
    fill(245);
    ellipse(x, y, 4, 4);
  }

  //정각에 해당하는 마커
  for (int ii = 0; ii < 360; ii +=30) {
    float angle = radians(ii);
    float x1 = clockX + cos(angle) * radius;
    float y1 = clockY + sin(angle) * radius;

    noStroke();
    fill(245);
    ellipse(x1, y1, 10, 10);
  }

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  //second의 최소값인 0, 최대값인 60을 최소값0 ,TWO_PI(즉 360도)로 변환하겠다는 뜻
  //그니까 60초를 360도 돌아갈 수 있도록 변환해주는 작업인거임
  //근데!?!?!? TWO_PI를 360이라고 적음 안됨. sin,cos은 라디안 값으로 계산하는데 360은 '도'단위이니까 단위가 다름
  //HALF-PI, 즉 90도를 빼주는 이유는 기본적으로 0도는 3시 방향에서 시작하기 때문에 90을 빼줘서 12시 방향에서 시작하게 함
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  //second와 마찬가지로 최소값, 최대값을 0, TWO_PI 변환해주는 것은 똑같음. 그런데 norm이라는 함수가 앞에 추가가 되었다.
  //norm은 약간 맵 함수랑 비슷한 것 같은데 값? 함수? 를 먼저 적고, 최소, 최대값을 적어주면 됨.
  //minute에다가 norm을 더 해주는 이유는 어쨌든 분이 초를 반영해서..아무튼..움직이니까 초의 흐름대로 자연~스럽게 분침이 움직이기 위해서임
  //norm을 안적으면 1분 지날 때마다 분침이 순간이동해서 그 자리로 가게 됨
  float h = map(hour() + norm(minute(), 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(255, 0, 0);
  strokeWeight(3);
  line(clockX, clockY, clockX + cos(s) * radiusS, clockY + sin(s) * radiusS);
  //400,400, 400 + cos(s) * 200, 400 + sin(s) *200
  //첫 점 중앙에 찍히고 그 다음 반지름 길이(200)으로
  stroke(255);
  strokeWeight(8);
  line(clockX, clockY, clockX + cos(m) * radiusM, clockY + sin(m) * radiusM);
  strokeWeight(10);
  line(clockX, clockY, clockX + cos(h) * radiusH, clockY + sin(h) * radiusH);

  //중심원
  noStroke();
  fill(245);
  ellipse(width*.5, height*.5, 20, 20);
}
