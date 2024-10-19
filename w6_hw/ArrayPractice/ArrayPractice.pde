PFont font;

int[] graph;
String[] name;
int sum = 0;
int average = 0;

void setup() {
  //size (960, 720);
  size (1280, 720);

  //한글 폰트
  font = createFont("Noto Sans KR Light", 50);

  //그래프 6개
  graph= new int[6];
  for (int n = 0; n < 6; n++) {
    graph[n] = int(random(5, 100));
  }

  //이름
  name =new String [6];
  name[0] = "사과";
  name[1] = "체리";
  name[2] = "코코넛";
  name[3] = "키위";
  name[4] = "라임";
  name[5] = "망고";

  //합계
  for (int n = 0; n < graph.length; n++) {
    //.length를 써야 됨 [6]이라고 쓰면 무서운 오류남
    //graph.length는 6
    sum += graph[n];
    //sum = sum + graph[n]
    //sum에 graph[n]값을 더하고 그 값을 sum에 저장!

    //평균
    average = sum/graph.length;
    //전체 합 6으로 나누기
  }
}

float barGap =100;
float barWidth=20;

void draw() {
  background (252, 249, 240);
  strokeWeight(barWidth);
  stroke(40);

  for (int n = 0; n < 6; n++) {
    strokeCap(SQUARE);
    textAlign(CENTER);
    textFont(font);
    textSize(20);
    fill(40);

    line(width*.3 + barGap*n, height *.6, width*.3 + barGap*n, height *.6 - 2 * graph[n]);
    text(name[n], width*.3 + barGap*n, height *.6 + 30);
    text(graph[n], width*.3 + barGap*n, height *.6 - 2 * graph[n] - 20);

    //합계랑 평균
    fill(85);
    text("합계: "+sum, width*.5, height*.75);
    text("평균: "+average, width*.5, height*.8);
  }
}
