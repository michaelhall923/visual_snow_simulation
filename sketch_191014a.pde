PImage img;

void setup() {
  img = loadImage("img.jpeg");
  size(1008, 756);
}

void draw() {
  background(0);
  image(img, 0, 0);
  loadPixels();
  //img.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x+y*width;
      float low = 1 - (float)mouseX/(float)width;
      float high = 1 + (float)mouseX/(float)width;
      float density = (float)mouseY/(float)height;
      float red = max(0, min(255, red(img.pixels[loc]) * random(low, high)));
      float green = max(0, min(255, green(img.pixels[loc]) * random(low, high)));
      float blue = max(0, min(255, blue(img.pixels[loc]) * random(low, high)));
      
      if (random(1) < density)
        pixels[loc] = color(red, green, blue);
      else
        pixels[loc] = img.pixels[loc];
    }
  }
  updatePixels();
}
