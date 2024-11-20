let cp;
let canvasW, canvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 480;

  createCanvas(canvasW, canvasH);

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;
  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide();
}

function draw() {
  background(0);
  // circle(mouseX, mouseY, 100);
  // image(cp, 0, 0, width, height);
  console.log(cp.get(10, 10));
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      //color 영국식으로 쓴거임
      // fill(colour[0], colour[1], colour[2]);
      // //r,g,b
      // noStroke();
      // circle(10 * x + 5, 10 * y + 5, 10);
      let b = brightness(colour);
      let diameter = map(b, 0, 255, 0, 20);
      fill(255);
      circle(10 * x + 5, 10 * y + 5, diameter);
    }
    //5를 더해주는 이유는 원이 잘리지 않게 반지름 값을 더해준 것
  }
}
