import supercollider.*;
import oscP5.*;

PFont f;

Synth  sample, sample2, reverb, synth, synth2;

c01[] crt = new c01[75];

c02[] crt2 = new c02[75];


void setup() {


  fullScreen();
  background(0);
  noCursor();

  frameRate(60);


  sample = new Synth("playbuf");
  sample.set("bufnum", 0);
  sample.set("startpos", 0);
  sample.set("rate", 1);
  sample.set("amp", 0);
  sample.set("pan", 0);
  sample.set("outbus", 0);
  sample.create();

  sample2 = new Synth("playbuf");
  sample2.set("bufnum", 0);
  sample2.set("startpos", 0);
  sample2.set("rate", 1);
  sample2.set("amp", 0);
  sample2.set("pan", 0);
  sample2.set("outbus", 0);
  sample2.create();

  synth = new Synth("playbuf_1");
  synth.set("rate", 80);
  synth.set("amp", 0.0);
  synth.set("pan", 0);
  synth.set("outbus", 0);
  synth.create();

  synth2 = new Synth("playbuf_1");
  synth2.set("rate", 80);
  synth2.set("amp", 0.0);
  synth2.set("pan", 0);
  synth2.set("outbus", 0);
  synth2.create();

  reverb = new Synth("reverb");
  reverb.set("inbus", 12);
  reverb.set("mix", 0);
  reverb.set("room", 0);
  reverb.set("damp", 0);
  reverb.set("outbus", 0);

  reverb.addToTail();


  for (int i = 0; i < crt.length; i ++) {

    crt[i] = new c01(i*13, i*3);
  }


  for (int i = 0; i < crt2.length; i ++) {

    crt2[i] = new c02(i*53, i);
  }

  f = createFont("Arial", 50);
  textFont(f);
}

//ctr1 image

float ypos, yspeed, xpos, xspeed;

float fr = 60;

float length, rand;

//ctr2 image

float posW, posH_, c_, trans, strokeW, sizew, sizey; 

float length_2, rand_2;

float posW_2, posH_2, c_2, trans_2, strokeW_2, sizew_2, sizey_2;


//ctr1 sound

float sy_amp, sy_rate, sy_pan, sy_out;

float sp_amp, sp_dur, sp_rate, sp_pan, sp_out;


//ctr2 sound

float sy_amp_2, sy_rate_2, sy_pan_2, sy_out_2;

float sp_amp_2, sp_rate_2, sp_pan_2, sp_out_2, buf_2 =2;


int lc  = 255;


void exit()
{

  sample.free();
  sample2.free();
  synth.free();
  synth2.free();
  reverb.free();

  super.exit();
}

int text_C = 200;

void draw() {

  //title

  background(0);

  fill(text_C);
  textSize(40);
  text("rafa_diniz", 3, 50);

  textSize(50);
  text("_[]dUO", 10, 110);


  //key silencer  

  if (key == 'z') {


    background(0);

    text_C = 0;
    xspeed = 0;       
    c_2 =0;
    c_ =0;
    trans_2 =0;

    sy_amp = 0;
    sp_amp = 0;
    sy_amp_2 = 0;
    sp_amp_2 = 0;
  }

  //ctr1

  synth.set("amp", sy_amp);
  synth.set("rate", sy_rate);
  synth.set("pan", sy_pan);
  synth.set("outbus", sy_out);

  sample.set("bufnum", 0);
  sample.set("startpos", 0);
  sample.set("rate", sp_rate);
  sample.set("pan", sp_pan);
  sample.set("amp", sp_amp);
  sample.set("outbus", sp_out);


  //ctr2

  synth2.set("amp", sy_amp_2);
  synth2.set("rate", sy_rate_2);
  synth2.set("pan", sy_pan_2);
  synth2.set("outbus", sy_out_2);

  sample2.set("bufnum", buf_2);
  sample2.set("startpos", 0);
  sample2.set("rate", sp_rate_2);
  sample2.set("pan", sp_pan_2);
  sample2.set("amp", sp_amp_2);
  sample2.set("outbus", sp_out_2);

  //ctr1

  for (int i = 0; i < length; i ++) {

    crt[i].display(posW+random(rand), posH_+random(rand), c_, trans, strokeW, sizew, sizey);
  }


  //crt2

  for (int i = 0; i < length_2; i ++) {

    crt2[i].display(posW_2+random(rand_2), posH_2, c_2, trans_2, strokeW_2, sizew_2, sizey_2);
  }


  ypos = ypos + yspeed;

  if (ypos < 0) { 
    ypos = height;
  }
  if (ypos > height) {
    ypos = 0;
  }

  yspeed = 0;


  xpos = xpos - xspeed;

  if (xpos < 0) { 
    xpos = width;
  }
  if (xpos > width) {
    xpos = 0;
  }

  xspeed = 0;




  if (key == '1') {

    //ctr1

    yspeed = 1.2;



    length = map(mouseY, 0, height, 0, 25); 
    rand = map(mouseY, 0, height, 0, 100);
    posW = 50; 
    posH_= 100;
    c_ = 255;
    trans = 255;
    strokeW = map(mouseY, 0, height, 1, random(5)); 
    sizew = 1;
    sizey = map(mouseY, 0, height, 1, 3);

    sy_amp = map(mouseY, 0, height, 0, 50);
    sy_rate = map(mouseY, 0, height, 0, 3);
    sy_pan = map(mouseY, 0, height, -0.8, random(-1, -0.8));
    sy_out = 0;

    sp_dur = map(mouseY, 0, height, 0.05, 2.0);
    sp_rate = map(mouseY, 0, height, 1.0, 1200.0);
    sp_pan = map(mouseY, 0, height, -0.8, random(-1, -0.8));
    sp_amp = map(mouseY, 0, height, 0, 500);
    sp_out = 0;
  } 



  if (key == '2') {

    //ctr1

    yspeed =0; 

    length = 75; 
    rand =300;
    posW = 50; 
    posH_= 100; 
    c_ = random(255);
    trans = random(255);
    strokeW = random(5); 
    sizew = 1;
    sizey = 1;

    sy_amp = random(0, 250);
    sy_rate = 3;
    sy_pan = random(-1, -0.8);
    sy_out = 0;

    sp_dur = random(0.5, 2.0);
    sp_rate = 1000;
    sp_pan = random(-1, -0.8);
    sp_amp = 150;
    sp_out = 12;

    reverb.set("mix", 1.0);
    reverb.set("room", 0.9);
    reverb.set("damp", 0.9);
    reverb.set("inbus", 12);
    reverb.set("outbus", 0);
  } 




  if (key == '3') {

    //ctr1


    yspeed = 2.5*-1;
    xspeed = 10;


    stroke(map(mouseY, 0, height, 100, 255), map(mouseY, 0, height, 155, 255));
    strokeWeight(1800);
    line(600, 0, 600, height);  

    length = 4; 
    rand = 50;
    posW = 150; 
    posH_= 50; 
    c_ = 255;
    trans = map(mouseY, 0, height, 0, 255);
    strokeW = random(0, 3); 
    sizew = 0.5;
    sizey = random(1, 5);

    sy_amp = map(mouseY, 0, height, 0, 50);
    sy_rate = 111.5;
    sy_pan = 0;
    sy_out = 12;

    sp_dur = 0.5;
    sp_rate = 500;
    sp_pan = random(-0.5, -0.4);
    sp_amp = map(mouseY, 0, height, 0, 50);
    sp_out = 0;
  }



  if (key == '4') {

    //ctr2

    yspeed = 0.6;    

    length_2 = map(mouseY, 0, height, 0, 75); 
    rand_2 = map(mouseY, 0, height, 0, 30);
    posW_2 = 750; 
    posH_2=  200; 
    c_2 = map(mouseY, 0, height, 100, random(155, 255));
    trans_2 = map(mouseY, 0, height, 50, 255);
    strokeW_2 = map(mouseY, 0, height, 25, 70); 
    sizew_2 = 1;
    sizey_2 = height-200;


    sy_amp_2 = map(mouseY, 0, height, 0.0, random(40.0));
    sy_rate_2 = 5.8;
    sy_pan_2 = map(mouseY, 0, height, 0.5, 1.0);
    sy_out_2 = 0;

    buf_2 = 2;
    sp_rate_2 = map(mouseY, 0, width, 10.5, 252);
    sp_pan_2 = random(1.0, 0.5);
    sp_amp_2 = map(mouseY, 0, height, 0, random(150));
    sp_out_2 = 0;
  }




  if (key == 'q') {

    //ctr2

    xspeed = 0;  

    length_2 = 3; 
    rand_2 = 0;
    posW_2 = 800; 
    posH_2=  200; 
    c_2 = 255;
    trans_2 = 150;
    strokeW_2 = 40; 
    sizew_2 = 1;
    sizey_2 = height-200;


    sy_amp_2 = 20;
    sy_rate_2 = 15.0;
    sy_pan_2 = 0.8;
    sy_out_2 = 0;


    buf_2 = 2;
    sp_rate_2 = 835;
    sp_pan_2 = 0.8;
    sp_amp_2 = 0;
    sp_out_2 = 0;
  }





  if (key == 'w') {


    //ctr2

    xspeed = 0;  

    length_2 = 19; 
    rand_2 = 5;
    posW_2 = 850; 
    posH_2=  200; 
    c_2 = random(255);
    trans_2 = 200;
    strokeW_2 = 40; 
    sizew_2 = 1;
    sizey_2 = height-200;

    sy_amp_2 = random(40);
    sy_rate_2 = 150.0;
    sy_pan_2 = 1;
    sy_out_2 = 12;

    sp_rate_2 = 835;
    sp_pan_2 = 1;
    sp_amp_2 = random(120);
    sp_out_2 = 0;
  }



  if (key == 'e') {

    //ctr2   

    xspeed = 3;  

    length_2 = 9; 
    rand_2 = 0;
    posW_2 = 623; 
    posH_2=  200; 
    c_2 = 255;
    trans_2 = 200;
    strokeW_2 = 20; 
    sizew_2 = 1;
    sizey_2 = height-200;

    sy_amp_2 = 4;
    sy_rate_2 = 550.0;
    sy_pan_2 = 0;
    sy_out_2 = 0;

    sp_rate_2 = 835;
    sp_pan_2 = 0;
    sp_amp_2 = 12;
    sp_out_2 = 0;
  }


  if (key == 'a') {

    //ctr1

    yspeed = 0;

    length = 55; 
    rand = 0;
    posW = -50; 
    posH_= 290;
    c_ = 255;
    trans = 100;
    strokeW = 1; 
    sizew = 3.8;
    sizey = 1.6;

    sy_amp = 40;
    sy_rate = 33;
    sy_pan = -0.8;
    sy_out = 0;

    sp_dur = 0.2;
    sp_rate = 50;
    sp_pan = -0.4;
    sp_amp = 0;
    sp_out = 0;
  }



  if (key == 's') {

    //ctr2

    xspeed = 3;  

    length_2 = 75; 
    rand_2 = 0;
    posW_2 = 10; 
    posH_2=  200; 
    c_2 = 255;
    trans_2 = 200;
    strokeW_2 = 30; 
    sizew_2 = 1;
    sizey_2 = height-200;


    sy_amp_2 = 40;
    sy_rate_2 = 450;
    sy_pan_2 = 0;
    sy_out_2 = 12;

    sp_rate_2 = 35;
    sp_pan_2 = 0;
    sp_amp_2 = 0;
    sp_out_2 = 12;


    reverb.set("mix", 0.5);
    reverb.set("room", 0.6);
    reverb.set("damp", 0.6);
    reverb.set("inbus", 12);
    reverb.set("outbus", 0);



    //ctr1

    yspeed = 0;

    length = 35; 
    rand = 0;
    posW = -10; 
    posH_= 200;
    c_ = 255;
    trans = 200;
    strokeW = 1; 
    sizew = 5.5;
    sizey = 1.5;

    sy_amp = 100;
    sy_rate = 3;
    sy_pan = 0;
    sy_out = 0;

    sp_dur = 2.0;
    sp_rate = 500;
    sp_pan = -0.5;
    sp_amp = 0;
    sp_out = 0;
  }



  if (key == 'd') {

    //ctr2  

    xspeed = 3.4;  

    length_2 = 75; 
    rand_2 = map(mouseY, 0, height, 100, 0);
    posW_2 = 10; 
    posH_2=  200; 
    c_2 = map(mouseY, 0, height, 255, 10);
    trans_2 = 200;
    strokeW_2 = map(mouseY, 0, height, 50, 10); 
    sizew_2 = 1;
    sizey_2 = height-200;

    sy_amp_2 = map(mouseY, 0, height, 20, 0);
    sy_rate_2 = 450;
    sy_pan_2 = 0;
    sy_out_2 = 0;

    sp_rate_2 = map(mouseY, 0, height, 500, 0);
    sp_pan_2 = 0;
    sp_amp_2 = map(mouseY, 0, height, 500, 0);
    sp_out_2 = 0;



    //ctr1

    length = map(mouseY, 0, height, 55, 0); 
    rand = map(mouseY, 0, height, 100, 0);
    posW = 0; 
    posH_= 200;
    c_ = map(mouseY, 0, height, 255, 10);
    trans = 200;
    strokeW = random(8); 
    sizew = 5.5;
    sizey = map(mouseY, 0, height, 1.2, 0);

    sy_amp = map(mouseY, 0, height, 40, 0);
    sy_rate = 3;
    sy_pan = 0;
    sy_out = 0;

    sp_dur = 2.0;
    sp_rate = map(mouseY, 0, height, 500, 0);
    sp_pan = -0.5;
    sp_amp = map(mouseY, 0, height, 500, 0);
    sp_out = 0;
  }
}