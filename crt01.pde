class c01 {

  float w1, h1, w2, h2;

  float posW, posH;

  float c;

  c01(float DW, float DH) {

    w1 = posW = DW;
    h1 = posH = DH;

    w2 = random(150, 250);
    h2 = random(50, 250);
    c = 255;
  }
  void display(float posW_, float posH_, float c_, float trans, float strokeW, float sizew, float sizey ) {

    posW = posW_;
    c = c_;

    noFill();
    stroke(c_, trans);
    strokeWeight(abs(strokeW));
    rect(posW_, posH_, w2*sizew, h2*sizey);
  }
}