class Star {
  float x;
  float y;
  float xVelocity;
  float yVelocity;
  float mass;
  int starShape;
  //Starburst color palette
  color coral = color(249,161,161);
  color candyRed= color(231,120,120);
  color paleYellow = color(251,219,159);
  color calmOrange = color(249,190,141);
  color lightBlue = color(204,212,242);
  
  
  // Constructor to initialize / reset
  Star() {
    reset();
  }
  
  // Resets everything from positioning to shapes.
  void reset() {
    mass = random(-10, 10); // Random value for mass. Changes how stars react both passively and to cursor movement. And color selection
    x = random(width);
    y = random(height);
    xVelocity = 0;
    yVelocity = 0;
    // Picks between starShape1-3 functions
    starShape = int(random(1, 4));
  }

  void update() {
    float xDistance = mouseX - x; // Determines distance from cursor horizontally
    float yDistance = mouseY - y; // Determines distance from cursor vertically
    float distance = sqrt(xDistance * xDistance + yDistance * yDistance); // Determines distance from cursor in total.
    
    // Force calculation
    float force = cos(distance * 0.04) * mass / distance * 2; // Values can be changed and played with to create different star patterns and interactions.
    
    // Stops stars from accelerating. Force from cursor is applied to velocity of stars.
    xVelocity = xVelocity * 0.4 - force * xDistance;
    yVelocity = yVelocity * 0.2 - force * yDistance;
    
    // Adds the new positions
    x += xVelocity;
    y += yVelocity;
    
    // Stars loop around instead of going off screen.
    if (x < 0) x = width;
    else if (x > width) x = 0;
    
    if (y < 0) y = height;
    else if (y > height) y = 0;
  }

  // star() from processing.org
  void starTemplate(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void starShape1() {
    starTemplate(0, 0, 10, 20, 10);
  }

  void starShape2() {
    starTemplate(0, 0, 20, 5, 10);
  }

  void starShape3() {
    starTemplate(0, 0, 20, 10, 5);
  }

  void display() {
    //To try and get a "starburst" candy-like color palette... And to implement logical operators for the assignment requirements.
    if (mass <= -8)  {
      fill(coral);
    }
    else if (mass > -8 && mass <= -3) {
      fill(candyRed);
    }
    else if (mass > -3 && mass <= 0) {
      fill(paleYellow);
    }
    else if (mass > 0 && mass <= 5) {
      fill(calmOrange);
    }
    else if (mass > 5) {
      fill(lightBlue);
    }
    
    pushMatrix(); // Saves current state before changes are made
    translate(x, y); // Specifies an amount to displace objects within the display window. 
    rotate(frameCount / 50.0); // Change second parameter for different rotation speed.
    
    if (starShape == 1)
      starShape1();
    else if (starShape == 2) 
      starShape2();
    else 
      starShape3(); 
    
    popMatrix(); // Undos changes made since pushMatrix().
  }
}
