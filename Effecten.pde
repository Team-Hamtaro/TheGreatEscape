class Effecten {

  int lavaBurstCheck = 0;

  ParticleSystem lavaBurst = new ParticleSystem();
  ParticleSystem walkDust = new ParticleSystem();
  ParticleSystem shoeSmoke = new ParticleSystem();
  ParticleSystem deadEffect = new ParticleSystem();
  ParticleSystem jumpEffect = new ParticleSystem();
  ParticleSystem dartsEffect = new ParticleSystem();
  ParticleSystem firework = new ParticleSystem();

  void init() {
    particleDeclare();
  }

  void draw() {
    particleUpdate();
  }

  void particleUpdate() {

    switch(theWorld.chunkDiff) {
    case 1:
      walkDust.birthColor=color(68, 40, 188);
      walkDust.deathColor=color(152, 120, 248);

      shoeSmoke.birthColor=color(68, 40, 188);
      shoeSmoke.deathColor=color(152, 120, 248);

      jumpEffect.birthColor=color(68, 40, 188);
      jumpEffect.deathColor=color(152, 120, 248);

      break;
    case 2:
      walkDust.birthColor=color(149, 0, 133);
      walkDust.deathColor=color(248, 87, 153);

      shoeSmoke.birthColor=color(149, 0, 133);
      shoeSmoke.deathColor=color(248, 87, 153);

      jumpEffect.birthColor=color(149, 0, 133);
      jumpEffect.deathColor=color(248, 87, 153);
      break;
    case 3:
      walkDust.birthColor=color(137, 12, 0);
      walkDust.deathColor=color(229, 92, 7);

      shoeSmoke.birthColor=color(137, 12, 0);
      shoeSmoke.deathColor=color(229, 92, 7);

      jumpEffect.birthColor=color(137, 12, 0);
      jumpEffect.deathColor=color(229, 92, 7);

      break;
    default:
      break;
    }

    lavaBurstCheck += (int)random(10);

    if (lavaBurstCheck >= 1000) {

      lavaBurst.x = (int)random(SCREENX);
      lavaBurst.emit(100);
      lavaBurstCheck = 0;
    }

    lavaBurst.update();
    shoeSmoke.update();
    deadEffect.update();
    jumpEffect.update();
    walkDust.update();
    dartsEffect.update();
    firework.update();

    // draw the particle effects
    shoeSmoke.draw();
    deadEffect.draw();
    jumpEffect.draw();
    walkDust.draw();
    lavaBurst.draw();
    dartsEffect.draw();
    firework.draw();
  }

  void particleDeclare () {
    lavaBurst.spreadFactor=0.4;
    lavaBurst.y = SCREENY - 50;
    lavaBurst.minSpeed=3.0;
    lavaBurst.maxSpeed=8.0;
    lavaBurst.startVx=-0.0;
    lavaBurst.startVy=-0.3;
    lavaBurst.birthSize=4.0;
    lavaBurst.deathSize=7.0;
    lavaBurst.gravity=0.01;
    lavaBurst.birthColor=color(191, 9, 9);
    lavaBurst.deathColor=color(205, 15, 15);
    lavaBurst.framesToLive=100;

    walkDust.spreadFactor=0.4;
    walkDust.y = SCREENY - 50;
    walkDust.minSpeed=2.0;
    walkDust.maxSpeed=3.0;
    walkDust.startVx=-0.0;
    walkDust.startVy=-0.5;
    walkDust.birthSize=3.0;
    walkDust.deathSize=1.0;
    walkDust.gravity=0.05;
    walkDust.birthColor=color(191, 9, 9);
    walkDust.deathColor=color(205, 15, 15);
    walkDust.framesToLive=20;

    shoeSmoke.spreadFactor=0.3;
    shoeSmoke.minSpeed=1.0;
    shoeSmoke.maxSpeed=7.0;
    shoeSmoke.startVx=0.0;
    shoeSmoke.startVy=0.0;
    shoeSmoke.birthSize=1.0;
    shoeSmoke.deathSize=5.0;
    shoeSmoke.gravity=-0.01;
    shoeSmoke.birthColor=color(205, 133, 63);
    shoeSmoke.deathColor=color(139, 69, 19);
    shoeSmoke.framesToLive=20;

    deadEffect.spreadFactor=1;
    deadEffect.minSpeed=1.0;
    deadEffect.maxSpeed=7.0;
    deadEffect.startVx=0.0;
    deadEffect.startVy=0.0;
    deadEffect.birthSize=10.0;
    deadEffect.deathSize=1.0;
    deadEffect.gravity=-0.00;
    deadEffect.birthColor=color(222, 60, 63);
    deadEffect.deathColor=color(139, 30, 19);
    deadEffect.blendMode="add";
    deadEffect.framesToLive=70;

    jumpEffect.spreadFactor=0.4;
    jumpEffect.minSpeed=3.0;
    jumpEffect.maxSpeed=7.0;
    jumpEffect.startVx=0.0;
    jumpEffect.startVy=-0.02;
    jumpEffect.birthSize=5.0;
    jumpEffect.deathSize=2.0;
    jumpEffect.gravity= 0.02;
    jumpEffect.birthColor=color(200, 60, 160);
    jumpEffect.deathColor=color(138, 30, 138);
    jumpEffect.framesToLive=30;
    
    dartsEffect.spreadFactor=0.6;
    dartsEffect.minSpeed=1.0;
    dartsEffect.maxSpeed=8.0;
    dartsEffect.startVx=-0.1;
    dartsEffect.startVy=-0.00;
    dartsEffect.birthSize=3.0;
    dartsEffect.deathSize=8.0;
    dartsEffect.gravity= 0.01;
    dartsEffect.birthColor=color(102, 204, 26);
    dartsEffect.deathColor=color(102, 204, 26);
    dartsEffect.framesToLive=20;
    
    firework.spreadFactor=1;
    firework.y = SCREENY - 50;
    firework.minSpeed=3.0;
    firework.maxSpeed=8.0;
    firework.startVx=-0.0;
    firework.startVy=-0.3;
    firework.birthSize=4.0;
    firework.deathSize=7.0;
    firework.gravity=0.01;
    firework.birthColor=color(191, 9, 9);
    firework.deathColor=color(205, 15, 15);
    firework.framesToLive=100;
    
  }
}

