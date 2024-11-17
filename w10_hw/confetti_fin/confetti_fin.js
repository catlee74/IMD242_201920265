let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];
let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];

let confetties;

function setup() {
  createCanvas(800, 800);
  confetties = new Confetties();
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  confetties.gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key == 'p' || key == 'P')
    console.log('confetties: ' + confetties.getLength());
}

function draw() {
  if (mousePressed) {
    cnt++;
  }
  background(255);
  confetties.update(gravity, friction);
  confetties.display();
}
