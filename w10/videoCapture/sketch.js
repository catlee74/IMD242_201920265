let capture;

function setup() {
  createCanvas(400, 400);
  capture = createCapture(VIDEO);
  capture.size(100, 100);
  //기존 캠버스 크기보다 작아지면 모자이크처럼 보인다(화질이 저하됨)
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, width, height);
}
