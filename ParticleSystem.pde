// Class waar de losse particle's gemaakt worden.
class Particle {
  float x, y, vx, vy, size, particleColor, speed;

  // quad hoeken coördinaten
  float qx, qy, qx1, qy1, qx2, qy2, qx3, qy3;

  // kleur van het particle
  color drawColor;

  // frames dat het particle bestaad.
  int framesToLive;

  // Constructor
  Particle(float x, float y, int framesToLive) {
    this.x = x; 
    this.y = y;
    this.framesToLive = framesToLive;

    // Berekend de hoeken (grote) van de particle.
    qx = -random(1.0); 
    qy = -random(1.0);
    qx1 = random(1.0); 
    qy1 = -random(1.0);
    qx2 = random(1.0); 
    qy2 = random(1.0);
    qx3 = -random(1.0); 
    qy3 = random(1.0);
  }

  // update positie en verminder de frames to live een.
  void update() {
    x += vx * speed;
    y += vy * speed;
    framesToLive--;
  }


  // Tekent de particle's op het scherm. pushMatrix slaat de gegevens even op.
  void draw() {

    pushMatrix();
    translate(x, y);
    pushMatrix();              
    fill(drawColor);
    float verdubbel = this.size/2;
    quad(qx*verdubbel, qy*verdubbel, 
    qx1*verdubbel, qy1*verdubbel, 
    qx2*verdubbel, qy2*verdubbel, 
    qx3*verdubbel, qy3*verdubbel);

    popMatrix();
    popMatrix();
  }
}

// Particle class voor het regelen van de aanmaak van particle's.
class ParticleSystem {
  
  //lijst met particle's
  ArrayList<Particle> particlesList;

  float  x, y;

  // verander blendmode naar add, als kleuren gemengd moeten worden.
  String blendMode;

  // startkleur en eindkleur
  color birthColor, deathColor;

  // start grote en eind grote
  float birthSize, deathSize;

  int framesToLive;

  // start richting van de particle's
  float startVx, startVy;

  // spreid de particle's uit
  float spreadFactor;

  // De particle's krijgen een snelheid tussen min- en maxspeed
  float minSpeed, maxSpeed;

  // particle's richting de y positie
  float gravity;

  // Create new particle system
  ParticleSystem() {
    particlesList = new ArrayList<Particle>();
  }


  // Maakt het een aantal particle's aan dat wordt aangegeven met de emit functie
  void emit(int particleAmount) {
    float x, y;

    for (int i=0; i<particleAmount; i++) {

      x = this.x;
      y = this.y;

      // Maak een nieuwe particle aan.
      Particle particle = new Particle(x, y, framesToLive);
      particle.vx = random(startVx-spreadFactor/2, startVx+spreadFactor/2);
      particle.vy = random(startVy-spreadFactor/2, startVy+spreadFactor/2);
      particle.speed = random(minSpeed, maxSpeed);
      particlesList.add(particle);
    }
  }

  // update de richting, grote en kleur van alle particles
  void update() {
    for (int i=0; i<particlesList.size (); i++) {
      Particle particle = particlesList.get(i);
      particle.vy += gravity;
      particle.update();
      if (particle.framesToLive == 0)
        particlesList.remove(particle);
    }
  }

  // teken alle particle's op het scherm
  void draw() {

    // als blendmode op add staat worden de particle's vermengd. 
    if (blendMode == "add") blendMode(ADD);


    for (Particle particle : particlesList) {
      //Zorgt ervoor dat de particle's groter of kleiner worden als de particle langer bestaad. 
      particle.size = lerp(deathSize, birthSize, (float)particle.framesToLive/(float)framesToLive);
      //Zorgt voor een vloeiende overgang tussen de birthcoller and deathcolor.
      color particleColor = lerpColor(deathColor, birthColor, ((float)particle.framesToLive/(float)framesToLive));

      // kleur particle wordt aangepast
      particle.drawColor = particleColor;    
      particle.draw();
    }

    //zet de blendmode terug naar default
    blendMode(BLEND);
  }
}

