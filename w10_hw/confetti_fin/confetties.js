class Confetties {
  constructor() {
    this.confetties = [];
  }

  gen(x, y, n) {
    for (let idx = 0; idx < n; idx++) {
      let randomW = random(4, 20);
      let randomH = random(4, 20);
      let randomForce = random(1, 10);
      let randomAngForce = random(-30, 30);
      let newConfetti = new Confetti(
        x,
        y,
        randomW,
        randomH,
        colours[int(random(colours.length))],
        randomForce,
        randomAngForce
      );
      this.confetties.push(newConfetti);
    }
  }

  update(force, friction) {
    for (let idx = this.confetties.length - 1; idx >= 0; idx--) {
      let aConfetti = this.confetties[idx];
      aConfetti.update(force, friction);
      if (aConfetti.isOutOfScreen()) {
        this.confetties.splice(idx, 1);
      }
    }
  }

  display() {
    for (let idx = 0; idx < this.confetties.length; idx++)
      this.confetties[idx].display();
  }

  getLength() {
    return this.confetties.length;
  }
}
