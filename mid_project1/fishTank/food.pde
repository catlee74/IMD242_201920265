//Processing 예제 ArrayListClass 코드를 활용함
class food {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float alpha;

  //먹이가 어항 바닥에 떨어지는 것을 설정하기 위해 fish에 있는 변수를 가지고 옴
  //이렇게 중복되게 변수를 가지고 오는 것이 효율적인지 잘 모르겠는데 다른 방법을 모르겠다.
  float tEdge = height * 0.5 - height*.25;
  float bEdge = tEdge + rectH;

  food(float tempX, float tempY, float tempW) {
    //tempX, tempY, tempW는 매개변수이고,
    //이 매개변수들은 fishTank의 mouseX, mouseY, 10의 값을 받게 될 것.
    //아래 ellipse에 이 매개변수를 쓰면 안되는 이유는 이 매개변수는 food여기서만 작동하고 외부에서는 작동x 때문
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.2;
    alpha = 255;
  }

  void move() {
    speed = speed + gravity;
    //속도 + 중력으로 시간이 지날수록 먹이가 더 빨리 떨어짐
    y += speed;
    //세로 위치에 속도를 더해 먹이가 떨어지게 함

    //println("Gravity:", gravity, "Speed:", speed);

    //먹이 수조바닥에 떨어지게
    //먹이가 어항 밖으로 삐져나가지 않게 원 반지름을 빼줬다
    if (y > bEdge-5) {
      speed = speed * -0.1;
      y =  bEdge-5;
      alpha -= 5;
    }
  }

  boolean finished() {
    if (alpha < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(147, 99, 82, alpha);
    ellipse(x, y, w, w);
  }
}
