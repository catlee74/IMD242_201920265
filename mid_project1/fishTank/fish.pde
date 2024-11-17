class fish {
  float x, y;
  float speedX, speedY;

  //해파리 얼굴
  float rad1;
  float rad2;

  //해파리 다리
  float legW;
  float legH;

  //해파리 눈
  float eyeS;

  float g = int(random(100, 200));
  float b = int(random(100, 200));

  ////유튜브 강의
  ////디지코 채널의 constrain()함수 사용법에서 나온 공식을 이용.
  ////https://youtu.be/ibb0OliSiMc?si=NW-JNQwDDi9Zh8ls
  float lEdge;
  float rEdge;
  float tEdge;
  float bEdge;

  fish() {
    this(width * 0.5, height * 0.5);
  }

//쳇지피티 사용
  fish(float startX, float startY) {
    x = startX;
    y = startY;
    rad1 = 90;
    rad2= 60;
    legW = 25;
    legH = 35;
    eyeS = 10;

    lEdge = width *.5 - width*.25;
    rEdge = lEdge + rectW;
    tEdge = height *.5 - height*.25;
    bEdge = tEdge + rectH;
    
    //수업 4주차에 배웠던 '벽에 닿으면 튕기는 공' 코드 활용
    speedX = random(1, 3);
    if (random(1)<.5) {
      speedX *= -1;
    }
    speedY = random(1, 3);
    if (random(1)<.5) {
      speedY *= -1;
    }
  }

  void move() {
    //수업 4주차에 배웠던 '벽에 닿으면 튕기는 공' 코드 활용
    x += speedX;
    y += speedY;

    //계산하는데 쳇지피티의 도움을 받음
    if (x <= lEdge + rad1 *.5 || x >= rEdge - rad1 *.5) {
      speedX *= -1;
      //지피티 사용으로 해파리가 수조 벽면에 끼이는 문제 해결
      x = constrain(x, lEdge + rad1 *.5, rEdge - rad1 *.5);
    }

    // 쳇지피티가 if (y <= tEdge + rad2 * 0.5 || y >= bEdge - rad2 * 0.5 - legH)라고 답을 줬는데,
    //이렇게 하면 하단 벽에 튕길 때 벽에 닿기 전에 튕겨지는 문제가 있어서
    //legH*.5로 고쳐줬더니 잘 튕겨짐
    if (y <= tEdge + rad2 *.5|| y >= bEdge - rad2*.5 - legH*.5) {
      speedY *= -1;
      
      //지피티 사용으로 해파리가 수조 벽면에 끼이는 문제 해결
      //현재 해파리 y좌표가 tEdge + rad2 *.5(수조 꼭대기)와 bEdge - rad2 *.5 - legH*.5(수조 바닥)을 벗어나지 않게 함
      y = constrain(y, tEdge + rad2 *.5, bEdge - rad2 *.5 - legH*.5);
    }
  }

  void display() {
    //해파리 본체
    pushMatrix();
    noStroke();
    fill(255, g, b);
    translate(x, y);

    //얼굴
    ellipse(0, 0, rad1, rad2);
    //중간다리
    ellipse(0, 30, legW, legH);
    //왼다리
    rotate(radians(25));
    ellipse(-10, 30, legW, legH);
    //오른다리
    rotate(radians(-50));
    ellipse(10, 30, legW, legH);
    popMatrix();

    //눈
    pushMatrix();
    translate(x, y);
    fill(80);
    ellipse(-12, 0, eyeS, eyeS);
    ellipse(12, 0, eyeS, eyeS);
    popMatrix();
    //눈의 y좌표가 같은데 삐뚤어지게 그려져서 chatGpt에게 물어봤음
    //각각 몸통, 다리 하나하나 push,pop을 하라고 하길래 그냥 몸통과 눈만 나누었음
  }

  //충돌여부 확인
  //쳇지피티 활용
  boolean eat(food foodA) {
    float d = dist(x, y, foodA.x, foodA.y);
    //해파리의 중심좌표(x,y)랑 먹이의 중심좌표(foodA.x, foodA.y) 사이 거리 측정함
    return d < (rad1 *.5 + foodA.w *.5);
    //d 거리값이 해파리 머리 반지름이랑 먹이 반지름 합한 것보다 작을 때 충돌되었다고 판단
    // 계산해보면 d < 50 일 때 true가 된다.(해파리가 먹이 하나도 안먹을 때 기준) 아마도
  }


  void big() {
    rad1 += 2;
    rad2 += 2;
    legW += 2;
    legH += 2;

    //색상도 밝아지게 설정함
    g += 5;
    b += 5;
  }

}
