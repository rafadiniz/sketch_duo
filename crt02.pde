class c02{
  
  float w1, h1, w2, h2;
  
  float posW, posH;
  
  float c;
  
  

  
  
  c02(float DW, float DH){
    

  h1 = posH = DH;
  
  w2 = random(0,DW);
  h2 = random(100);
  c = 255;
   
  
    
  }

 

  
  void display(float posW_, float posH_, float c_, float trans, float strokeW, float sizew, float sizeh){
    
     
    c = c_;
  
    noFill();
    strokeCap(SQUARE);
    stroke(c,trans);
    strokeWeight(strokeW);
    line(posW_+ w2,posH_,posW_+w2*sizew,sizeh);
   
  
  }
  
}