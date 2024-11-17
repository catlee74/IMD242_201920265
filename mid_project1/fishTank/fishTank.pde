//이 작품은 markkleeb님의 Fish-Tank 코드를 참고해서 제작되었음
//https://github.com/markkleeb/Fish-Tank

ArrayList<fish> fishs = new ArrayList<fish>();
ArrayList<food> foods = new ArrayList<food>();
ArrayList<Integer> counterList = new ArrayList<Integer>();

float rectW;
float rectH;

PFont font;

void setup() {
  fullScreen();
  rectW = width*.5;
  rectH = height*.5;
  //쳇지피티 사용.
  // 그냥 클래스 불러올 때랑 다르게 .add를 해야한다는 것을 까먹었다..
  //draw에 display()만 하면 되는 줄로 착각 -> 오류 -> 지피티 사용
  fishs.add(new fish());
  counterList.add(0);
  //frameRate(40);
  font = createFont("Gill Sans MT Bold", 72);
  //println(PFont.list());
}


void draw() {
  background(255, 248, 232);
  rectMode(CENTER);
  fill(89, 177, 252);
  noStroke();
  float rectW = width*.5;
  float rectH = height*.5;
  rect( width*.5, height*.5, rectW, rectH);

  //지피티 사용
  //드디어 문제 해결! 해파리가 분열 할 때 먹이 떨어지는 속도 + 알파값 조정 속도 등
  //계속 빨라져서 나중에는 광속으로 떨어지는 문제가 있었음
  //디버깅을 해도 속도라던지 프레임 문제는 없었고, speed값, gravity값 문제 없었음
  //문제는 fish 루프 안에 food의 move랑 display가 있어서 무언가 꼬였던 모양
  //따로 분리하니 문제 없이 잘 돌아감!
  for (int ni = foods.size() - 1; ni >= 0; ni--) {
    //먹이 리스트 역순으로
    food foodI = foods.get(ni);
    foodI.move();
    foodI.display();
    if (foodI.finished()) {
      foods.remove(ni);
    }
  }

  //쳇지피티 사용.
  for (int i = 0; i < fishs.size(); i++) {
    //arrayList인 fishs의 모든 요소를 불러오기 위한 for구문
    fish jelly = fishs.get(i);
    jelly.display();
    jelly.move();

    //Processing 예제 ArrayListClass 코드를 활용
    for (int ni = foods.size() - 1; ni >= 0; ni--) {
      //먹이 리스트 역순으로
      food foodI = foods.get(ni);

      //쳇지피티 사용.
      //해파리가 먹이로 이동하게 함
      //해파리가 음식을 먹으면 먹이 사라짐 + 해파리 성장
      if (jelly.eat(foodI)) {
        foods.remove(ni);
        counterList.set(i, counterList.get(i) + 1);
        //해파리가 먹이를 먹으면 리스트 1씩 올라감
        jelly.big();
      }

      //Fish-Tank 코드와 쳇지피티 활용
      //해파리가 먹이를 5개 먹었을 때 두 마리로 분열하게 함
      if (counterList.get(i) >=5) {
        fishs.remove(i);
        //먹이 5개 먹은 해파리 삭제
        fishs.add(i, new fish(jelly.x, jelly.y));
        fishs.add(i+1, new fish(jelly.x, jelly.y));
        //기존 해파리 자리에 두마리의 해파리 생성
        counterList.set(i, 0);
        counterList.add(0);
        counterList.add(0);
        //기존 해파리랑 새로운 해파리 먹이 카운트 초기화 시킴
      }
    }
  }
  fill(80);
  textAlign(LEFT);
  textSize(15);
  text("Jellyfishes: "+ fishs.size(), 50, 50);
  text("Foods: "+ foods.size(), 50, 75);

  textFont(font);
  textAlign(RIGHT);
  textSize(20);
  fill(255, 140, 140);
  //text("Project 1",  (width *.5 - width*.25)+rectW*.125  , (height *.5 - height*.25) + rectH + 30 );
  text("Project 1:  Fishtank",  (width *.5 - width*.25) + rectW , (height *.5 - height*.25) + rectH + 30 );
  
}
//Processing 예제 ArrayListClass 코드를 활용 + 위치 계산 쳇지피티 참고
//if 구문 계산을 쳇지피티에게 시키긴 했으나 변수를 새로 만들고하는 과정에서 오류 + 원하는 위치범위가 나오지 않음
//어항 위쪽 범위에서만 먹이를 줄 수 있게 설정하고 싶어서 변수 모두 없애고 mouseY 범위를 수정
void mousePressed() {
  if (mouseX > width*.5 - rectW*.5 && mouseX < width*.5 + rectW*.5
    &&  mouseY <  height*.5 - rectH*.5) {
    foods.add(new food(mouseX, mouseY, 10));
  }
}
