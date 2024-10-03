int numOfStars = 500; // Change the value determine amount of stars created.
Star[] stars = new Star[numOfStars];

void setup() {
  fullScreen();
  fill(0);
  createStars();
}

void draw() {
  noStroke(); // No outline on stars
  // Creating the drag / trail effect
  fill(0, 40); // Second parameter decides transparency.
  // rect for background because background() cant have transparancy
  rect(0, 0, width, height); // rect is filled with a somewhat transparent black color.

  for (int i = 0; i < numOfStars; i++) {
    // Calls functions in Star class. Updates position of star and displays it.
    stars[i].update();
    stars[i].display();
  }
}

// For loop to create new instances as long as i < numOfStars.
void createStars() {
  for (int i = 0; i < numOfStars; i++) {
    stars[i] = new Star();
  }
}

// Resets all stars on mouse press.
void mousePressed() {
  for (int i = 0; i < numOfStars; i++) {
    stars[i].reset();
  }
}
