boolean lightning = false;
boolean fading = false;
boolean fadePresence = false;

int diameter = 10;
int fadeX = 250;
int fadeY = 500;
float fadeAlpha = 255;

void setup() {
  size(500, 500);
  background(50, 50, 50);
}

void draw() {
  //Background fade layer
  fill(50, 50, 50, 10);
  noStroke();
  rect(0, 0, 500, 500);

  //Lightning drawing
  if (lightning) {
    int startX = 250;
    int startY = 0;
    int endX = 250;
    int endY = 0;

    strokeWeight((int)(Math.random() * 12));
    stroke((int)(Math.random() * 256),
           (int)(Math.random() * 256),
           (int)(Math.random() * 256));

    while (endY <= 500) {
      // Main lightning path
      endX = startX + (int)(Math.random() * 19) - 9;
      endY = startY + (int)(Math.random() * 10);
      line(startX, startY, endX, endY);

      // Random branches
      if (Math.random() < 0.1) {
        int branchX = startX;
        int branchY = startY;
        int branchEndX = branchX + (int)(Math.random() * 20) - 10;
        int branchEndY = branchY + (int)(Math.random() * 20);
        line(branchX, branchY, branchEndX, branchEndY);
      }

      startX = endX;
      startY = endY;

      // Lightning ends
      if (endY > 500) {
        lightning = false;
        fading = true;  
        fadeX = endX;
        fadeY = endY;
        diameter = 10;
      }
    }
  }

  // --- Fade effect ---
  if (fading) {
    if (diameter >= 589) {
      fadePresence = true;
    }

    noFill();
    stroke(255, 255, 255, fadeAlpha);

    if (fadePresence == true) {
      fill(50);
      noStroke();
      delay(80);
      rect(0, 0, 500, 500);

    } else  {
      ellipse(fadeX, fadeY, diameter, diameter);
    }

    diameter += 12;
    fadeAlpha = fadeAlpha - 5;
  }
}

void mousePressed() {
  lightning = true;
  diameter = 10;
  fadeAlpha = 255;
  fadePresence = false;
}
