import java.util.*;

//DECLARATION AND INITIALIZATION

//First Circle
int circleCenterX_1;
int circleCenterY_1;
int circleDiameter_1;
int circleRadius_1;

//First Line
int lineX_1;
int lineY_1;
int rotationSpeed_1;

int circleDiameter_2;
int circleRadius_2;

float lineX_2;
float lineY_2;
int rotationSpeed_2;

//Point
int pointCenterX;
int pointDiameter;

//SETUP
void setup()
{
  fullScreen();
  
  circleCenterX_1 = width/4;
  circleCenterY_1 = height/2;
  circleDiameter_1 = 300;
  circleRadius_1 = (circleDiameter_1)/2;
  
  circleDiameter_2 = 200;
  circleRadius_2 = (circleDiameter_2)/2;
  
  pointCenterX = width/2;
  pointDiameter = 25;
}

//DRAW
void draw()
{
  rotationSpeed_1 = frameCount;
  rotationSpeed_2 = frameCount * 2;
  
  background(52, 52, 52);
  smooth();
  
  strokeWeight(5);
  stroke(98, 163, 136);
  noFill();
  circle(circleCenterX_1, circleCenterY_1, circleDiameter_1);
  
  //First Circle
  pushMatrix();
  translate(circleCenterX_1, circleCenterY_1); 
  rotate(radians(rotationSpeed_1)); 
  stroke(185, 210, 210);
  line(0, 0, circleRadius_1, 0);
  
  stroke(181, 206, 185);
  noFill();
  circle(circleRadius_1, 0, circleDiameter_2);
  
  lineX_1 = (int)screenX(circleRadius_1, 0);
  lineY_1 = (int)screenY(circleRadius_1, 0);
  popMatrix();
  
  //Second Circle
  pushMatrix();
  translate(lineX_1, lineY_1); 
  rotate(radians(rotationSpeed_2)); 
  stroke(160, 180, 180);
  line(0, 0, circleRadius_2, 0);
  
  lineX_2 = screenX(circleRadius_2, 0);
  lineY_2 = screenY(circleRadius_2, 0);
  popMatrix();
  
  strokeWeight(5);
  stroke(5, 94, 104);
  fill(52, 52, 52);
  circle(pointCenterX, lineY_2, pointDiameter);
}
