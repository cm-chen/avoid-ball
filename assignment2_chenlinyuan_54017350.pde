int d = 30;
float x = 640;
float y = 360;
float ax;
float ay;
float speedx = 0;
float speedy = 0;
float a = 5;
int width = 1280;
int height = 720;
int p, q, m = 255, n = 255, o = 255, i = 0;

void setup() {
  size(1280, 720);
}

void draw() {
  //background
  noStroke();
  fill(m, n, o);
  triangle(0, 0, x, y, 0, 720);
  fill(m, o, n);
  triangle(0, 0, x, y, 1280, 0);
  fill(o, m, n);
  triangle(1280, 0, x, y, 1280, 720);
  fill(n, o, m);
  triangle(0, 720, x, y, 1280, 720);
  
  //control of the acceleration of the ball
  ax = (1/(x - mouseX)) * i/10;
  ay = (1/(y - mouseY)) * i/10;
  if (ax > 10) {
    ax = 10;
  }else if (ax < -10) {
    ax = -10;
  }
  if (ay > 10) {
    ay = 10;
  }else if (ay < -10) {
    ay = -10;
  }
  
  //movement
  speedx = speedx + ax;
  speedy = speedy + ay;
  
  //adjust
  if (speedx > 6.5) {
    speedx = 6.5;
  }else if (speedx < -6.5) {
    speedx = -6.5;
  }
  if (speedy > 6.5) {
    speedy = 6.5;
  }else if (speedy < -6.5) {
    speedy = -6.5;
  }
  speedx = speedx * 0.999;
  speedy = speedy * 0.999;
  
  //hit the wall
  if (y > height|| y < 0) {  
    speedy = speedy * -1.1;
    m = round(random(255));
    n = round(random(255));
    o = round(random(255));
    i = 0;
    }
  if (x > width|| x < 0) {  
    speedx = speedx * -1.1;
    m = round(random(255));
    n = round(random(255));
    o = round(random(255));
    i = 0;
  }
  //draw the ball
  x = x + speedx;
  y = y + speedy;
  stroke(0);
  fill((x+y)/5, Math.abs((mouseX-x)/2), Math.abs((mouseY-y)/2));
  ellipseMode(CENTER);
  ellipse(x, y, d, d);
  
  
  noStroke();
  fill(255, 255, 0);
  ellipse(mouseX, mouseY, i, i);
  i++;
}