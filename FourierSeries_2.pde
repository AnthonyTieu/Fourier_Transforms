//IMPORT PACKAGES
import java.util.*;

//DECLARATION AND INITIALIZATION
int segmentNum; //Current number of segments
int maxSegments; //Desired number of segments

//CIRCLE PROPERTIES
//Circle Dimensions
int circleCenterX; //X-coordinate of the center of the circle
int circleCenterY; //Y-coordinate of the center of the circle
int circleDiameter; //Circle diameter
int circleRadius; //Circle radius

//Circle Colour
color circleColor;

//LINE PROPERTIES
//Line Movement
float rotationDegrees;

//Line Colour
int lineR;
int lineG;
int lineB;

//GRAPH PROPERTIES
double numberOfPoints; //Number of points (elements)
double pointDivisions;
ArrayList<Integer> graphX = new ArrayList<Integer>(); //Arraylist of x-axis
ArrayList<Integer> graphY = new ArrayList<Integer>();  //Arraylist of y-axis
float strokeWeight_max;
float strokeWeightValue;

//USER INPUT
boolean keyPressUp;
boolean keyPressDown;

//OPTIONS PROPERTIES
float distance_between_checkBox_and_text_X;
float distance_between_checkBox_and_text_Y;
float distance_between_nextCheckBox_and_endOfText_X;
float distance_between_nextCheckBox_and_checkBox_Y;
float distance_between_sliderName_and_number;
//Text
float text_pointDispersion_X; //X-coordinate of text
float text_pointDispersion_Y; //Y-coordinate of text
float text_line_Y; //Y-coordinate of text
float text_displayCircles_X;
float text_displayAxis_Y; //Y-coordinate of text
float text_strokeWeight_X;
float text_strokeWeightValue_X;
//Checkbox
float checkBox_dimensions; //Checkbox dimension
float checkBox_pointDispersion_X; //X-coordinate of checkboxes
float checkBox_pointDispersion_Y; //Y-coordinate of checkbox
float checkBox_line_Y; //Y-coordinate of checkbox
float checkBox_displayCircles_X;
float checkBox_displayAxis_Y; //Y-coordinate of checkbox
//Checkbox Possible Colours
color checkBox_stroke_empty; //Outline when empty
color checkBox_fill_empty; //Fill when empty
color checkBox_fill_hover; //Fill when cursor is over box
color checkBox_stroke_select; //Outline when selected
color checkBox_fill_select; //Fill when selected
//Checkbox Colours
color checkBox_pointDispersion_stroke; //Point dispersion outline
color checkBox_pointDispersion_fill; //Point dispersion fill
color checkBox_line_stroke; //Line outline
color checkBox_line_fill; //Line fill
color checkBox_displayCircles_stroke; //Display axis outline
color checkBox_displayCircles_fill;
color checkBox_displayWritingHead_stroke; //Display axis outline
color checkBox_displayWritingHead_fill;
color checkBox_displayAxis_stroke; //Display axis outline
color checkBox_displayAxis_fill; //Display axis fill
//Checkbox Selection
//Cursor Hovering Over
boolean checkBox_pointDispersion_over; //Point dispersion
boolean checkBox_line_over; //Line
boolean checkBox_displayCircles_over;
boolean checkBox_displayWritingHead_over;
boolean checkBox_displayAxis_over; //Display Axis
//Clicked
boolean checkBox_pointDispersion_click; //Point dispersion
boolean checkBox_line_click; //Line
boolean checkBox_displayCircles_click;
boolean checkBox_displayWritingHead_click;
boolean checkBox_displayAxis_click; //Display Axis
//Slider
float sliderDimensions;
float slider_strokeWeight_X;

boolean slider_strokeWeight_over;
boolean slider_strokeWeight_unlock;

float type_strokeWeightValue_X;
float type_strokeWeightValue_dimensions;
float slider_strokeWeight_offsetX;
float slider_strokeWeight_progess;
  
color type_fill;
color slider_strokeWeight_fill;
color slider_strokeWeight_stroke;
int cursorType;

//*****
//SETUP
void setup()
{
  fullScreen();
  segmentNum = 0;
  maxSegments = 1;
  numberOfPoints = 800;
  
  keyPressUp = false;
  keyPressDown = false;
  
  checkBox_dimensions = 20; 
  
  textAlign(RIGHT, TOP);
  textSize(21);
  distance_between_checkBox_and_text_X = (605 * width/640) - (600 * width/640);
  distance_between_checkBox_and_text_Y = (50 * height/832) - (48 * height/832);
  distance_between_nextCheckBox_and_endOfText_X = (1.35 * textWidth("Point Dispersion")) - textWidth("Point Dispersion");
  distance_between_nextCheckBox_and_checkBox_Y = (82 * height/832) - (50 * height/832);
  distance_between_sliderName_and_number = ((2.25 * textWidth("Point Dispersion")) - (1.35 * textWidth("Point Dispersion"))) + textWidth("Stroke Weight");
  
  checkBox_pointDispersion_X = 605 * width/640;
  checkBox_pointDispersion_Y = 50 * height/832;
  checkBox_line_Y = checkBox_pointDispersion_Y + distance_between_nextCheckBox_and_checkBox_Y; 
  
  text_pointDispersion_X = checkBox_pointDispersion_X - distance_between_checkBox_and_text_X;
  text_pointDispersion_Y = checkBox_pointDispersion_Y - distance_between_checkBox_and_text_Y; 
  text_line_Y = checkBox_line_Y - distance_between_checkBox_and_text_Y; 
  
  checkBox_displayCircles_X = text_pointDispersion_X - textWidth("Point Dispersion") - distance_between_nextCheckBox_and_endOfText_X;
  checkBox_displayAxis_Y = checkBox_line_Y + distance_between_nextCheckBox_and_checkBox_Y; 
  
  text_displayCircles_X = checkBox_displayCircles_X - distance_between_checkBox_and_text_X;
  text_displayAxis_Y = checkBox_displayAxis_Y - distance_between_checkBox_and_text_Y;
  
  //NOTE: distance_between_nextCheckBox_and_endOfText_X is the distance between left corner of checkbox to end of text, hence, need to add checkBox_dimensions
  text_strokeWeightValue_X = text_displayCircles_X - textWidth("Display Writing Head") - distance_between_nextCheckBox_and_endOfText_X + checkBox_dimensions;
  text_strokeWeight_X = text_strokeWeightValue_X - distance_between_sliderName_and_number + textWidth("Stroke Weight");
  
  checkBox_pointDispersion_click = false;
  checkBox_line_click = true;
  checkBox_displayAxis_click = true;
  checkBox_displayCircles_click = true;
  checkBox_displayWritingHead_click = true;

  checkBox_stroke_empty = #7D7D7D;
  checkBox_fill_empty = #343434;
  checkBox_fill_hover = #646464;
  checkBox_stroke_select = #b9d2d2; //#79B0F5;
  checkBox_fill_select = #62a388; //#5294E8;
  
  checkBox_pointDispersion_stroke = checkBox_stroke_empty;
  checkBox_pointDispersion_fill = checkBox_fill_empty;
  checkBox_line_stroke = checkBox_stroke_empty; 
  checkBox_line_fill = checkBox_fill_empty; 
  checkBox_displayCircles_stroke = checkBox_stroke_empty;
  checkBox_displayCircles_fill = checkBox_fill_empty;
  checkBox_displayWritingHead_stroke = checkBox_stroke_empty;
  checkBox_displayWritingHead_fill = checkBox_fill_empty;
  checkBox_displayAxis_stroke = checkBox_stroke_empty;
  checkBox_displayAxis_fill = checkBox_fill_empty;
  
  type_fill = #2B2B2B;
  slider_strokeWeight_fill = checkBox_fill_hover;
  slider_strokeWeight_stroke = checkBox_stroke_empty;
  
  slider_strokeWeight_X = text_strokeWeight_X - textWidth("Stroke Weight");
  sliderDimensions = distance_between_sliderName_and_number;
  strokeWeight_max = 10;
  strokeWeightValue = 0.5;
  
  type_strokeWeightValue_X = text_strokeWeightValue_X - textWidth("0.000") - 5;
  type_strokeWeightValue_dimensions = textWidth("0.000") + 5;
  slider_strokeWeight_progess = sliderDimensions * strokeWeightValue;
  
  slider_strokeWeight_over = false;
  slider_strokeWeight_unlock = false;
  
  if(numberOfPoints > 1)
    pointDivisions = numberOfPoints - 1;
  else
    pointDivisions = numberOfPoints;
    
  for(double count = 0; count < numberOfPoints; count++)
  {
    graphX.add((int)((width/2) + (count * ((5 * width)/12)/(pointDivisions))));
    //numberOfPoints - 1 since first point is at width/2, hence, 5*width/12 space is only divided by numberOfPoints - 1
  }
}

//****
//DRAW
void draw()
{
  reset();
  while(segmentNum < maxSegments)
  {
    if(checkBox_displayCircles_click)
    {
      strokeWeight(5);
      stroke(circleColor);
      noFill();
      circle(circleCenterX, circleCenterY, circleDiameter);
    }
    
    pushMatrix();
    translate(circleCenterX, circleCenterY); 
    rotate(radians(rotationDegrees)); 
    stroke(lineR, lineG, lineB);
    line(0, 0, circleRadius, 0);
    
    rotationDegrees *= 1.5;
    
    circleCenterX = (int)screenX(circleRadius, 0);
    circleCenterY = (int)screenY(circleRadius, 0);
    circleDiameter = (int)(3 * (circleDiameter/4));
    circleRadius = (circleDiameter)/2;
    popMatrix();
    
    segmentNum++;
  }
  
  graphY.add(0, circleCenterY);
  if(graphY.size() > numberOfPoints)
  {
    graphY.remove(graphY.size() - 1);
  }
  
  if(checkBox_displayAxis_click)
    axisDisplay();
  
  if(graphY.size() > 0)
  {
    strokeWeight(strokeWeightValue * strokeWeight_max);
    stroke(lineR, lineG, lineB);
    noFill();
    if(checkBox_pointDispersion_click)
      pointDispersion();
    else
      lineGraph();
    
    if(checkBox_displayWritingHead_click)
    {
      strokeWeight(5);
      stroke(7, 118, 127);
      fill(52, 52, 52);
      circle(width/2, circleCenterY, 25);
    }
  }
  
  mouseCheck();
}

//**********
//RESET DRAW
void reset()
{
  cursor(cursorType);
  rotationDegrees = frameCount * 4;
  
  circleCenterX = width/4;
  circleCenterY = height/2;
  circleDiameter = width/(1920/225);
  circleRadius = (circleDiameter)/2;
  
  circleColor = #62a388;
  
  lineR = 165;
  lineG = 190;
  lineB = 190;
  
  segmentNum = 0;
  
  //strokeWeightValue = strokeWeight/strokeWeight_max;
  
  background(52, 52, 52);
  smooth();
  
  optionsDisplay();
}

//***************
//OPTIONS DISPLAY
void optionsDisplay()
{
  //CHECKBOXES
  //Point Dispersion
  rectMode(CORNER);
  strokeWeight(3);
  stroke(checkBox_pointDispersion_stroke);
  fill(checkBox_pointDispersion_fill);
  rect(checkBox_pointDispersion_X, checkBox_pointDispersion_Y, checkBox_dimensions, checkBox_dimensions, 5);
  
  //Line
  rectMode(CORNER);
  strokeWeight(3);
  stroke(checkBox_line_stroke);
  fill(checkBox_line_fill);
  rect(checkBox_pointDispersion_X, checkBox_line_Y, checkBox_dimensions, checkBox_dimensions, 5);
  
  //Display Circles
  rectMode(CORNER);
  strokeWeight(3);
  stroke(checkBox_displayCircles_stroke);
  fill(checkBox_displayCircles_fill);
  rect(checkBox_displayCircles_X, checkBox_pointDispersion_Y, checkBox_dimensions, checkBox_dimensions, 5);
  
  //Display Writing Head
  rectMode(CORNER);
  strokeWeight(3);
  stroke(checkBox_displayWritingHead_stroke);
  fill(checkBox_displayWritingHead_fill);
  rect(checkBox_displayCircles_X, checkBox_line_Y, checkBox_dimensions, checkBox_dimensions, 5);
  
  //Display Axis
  rectMode(CORNER);
  strokeWeight(3);
  stroke(checkBox_displayAxis_stroke);
  fill(checkBox_displayAxis_fill);
  rect(checkBox_displayCircles_X, checkBox_displayAxis_Y, checkBox_dimensions, checkBox_dimensions, 5);
  
  //SLIDER
  //Stroke Weight
  //Bar
  rectMode(CORNER);
  strokeWeight(3);
  noStroke();
  fill(slider_strokeWeight_fill);
  rect(slider_strokeWeight_X, checkBox_line_Y, slider_strokeWeight_progess, checkBox_dimensions, 5); //sliderDimensions * strokeWeightValue, checkBox_dimensions, 5); 
  //Outline
  rectMode(CORNER);
  strokeWeight(3);
  stroke(slider_strokeWeight_stroke);
  noFill();
  rect(slider_strokeWeight_X, checkBox_line_Y, sliderDimensions, checkBox_dimensions, 5);
  
  //TYPE
  //Stroke Weight
  rectMode(CORNER);
  strokeWeight(3);
  stroke(type_fill);
  fill(type_fill);
  rect(type_strokeWeightValue_X, checkBox_pointDispersion_Y, type_strokeWeightValue_dimensions, checkBox_dimensions, 5); 
  
  //TEXT
  textAlign(RIGHT, TOP);
  textSize(21);
  fill(125, 125, 125);

  text("Point Dispersion", text_pointDispersion_X, text_pointDispersion_Y);
  text("Line", text_pointDispersion_X, text_line_Y);
  text("Display Circles", text_displayCircles_X, text_pointDispersion_Y);
  text("Display Axis", text_displayCircles_X, text_displayAxis_Y);
  text("Display Writing Head", text_displayCircles_X, text_line_Y);
  text("Stroke Weight", text_strokeWeight_X, text_pointDispersion_Y);
  text(strokeWeightValue, text_strokeWeightValue_X - 2.5, text_pointDispersion_Y);
}

//***********
//MOUSE CHECK
void mouseCheck()
{
  //Reset
  fillReset();
  
  //MOUSE CHECKBOX POSITION
  if(mouseX >= checkBox_pointDispersion_X && mouseX <= checkBox_pointDispersion_X + checkBox_dimensions)
  {
    //Point Dispersion
    if(mouseY >= checkBox_pointDispersion_Y && mouseY <= checkBox_pointDispersion_Y + checkBox_dimensions)
    {
      if(checkBox_pointDispersion_click == false)
        checkBox_pointDispersion_fill = checkBox_fill_hover; 
      checkBox_pointDispersion_over = true;
    }
    //Line
    else if(mouseY >= checkBox_line_Y && mouseY <= checkBox_line_Y + checkBox_dimensions)
    {
      if(checkBox_line_click == false)
        checkBox_line_fill = checkBox_fill_hover;
      checkBox_line_over = true;
    }
  }
  if(mouseX >= checkBox_displayCircles_X && mouseX <= checkBox_displayCircles_X + checkBox_dimensions)
  {
    if(mouseY >= checkBox_pointDispersion_Y && mouseY <= checkBox_pointDispersion_Y + checkBox_dimensions)
    {
      if(checkBox_displayCircles_click == false)
        checkBox_displayCircles_fill = checkBox_fill_hover;
      checkBox_displayCircles_over = true;
    }
    if(mouseY >= checkBox_line_Y && mouseY <= checkBox_line_Y + checkBox_dimensions)
    {
      if(checkBox_displayWritingHead_click == false)
        checkBox_displayWritingHead_fill = checkBox_fill_hover;
      checkBox_displayWritingHead_over = true;
    }
    //Display Axis
    else if(mouseY >= checkBox_displayAxis_Y && mouseY <= checkBox_displayAxis_Y + checkBox_dimensions)
    {
      if(checkBox_displayAxis_click == false)
        checkBox_displayAxis_fill = checkBox_fill_hover;
      checkBox_displayAxis_over = true;
    }
  }
  //Type
  else if(mouseY >= checkBox_pointDispersion_Y && mouseY <= checkBox_pointDispersion_Y + checkBox_dimensions)
  {
    if(mouseX >= type_strokeWeightValue_X && mouseX <= type_strokeWeightValue_X + type_strokeWeightValue_dimensions)
      cursorType = TEXT;
  }
  //Slider
  else if(mouseY >= checkBox_line_Y && mouseY <= checkBox_line_Y + checkBox_dimensions)
  {
    if(mouseX >= slider_strokeWeight_X && mouseX <= slider_strokeWeight_X + sliderDimensions)
    {
      slider_strokeWeight_over = true;
    }
  }
}

//**********
//FILL RESET
void fillReset()
{
  //RESET VALUES
  slider_strokeWeight_fill = checkBox_fill_hover;
  slider_strokeWeight_stroke = checkBox_stroke_empty;
  checkBox_pointDispersion_over = false;
  checkBox_line_over = false;
  checkBox_displayCircles_over = false;
  checkBox_displayWritingHead_over = false;
  checkBox_displayAxis_over = false;
  
  if(slider_strokeWeight_unlock)
    slider_strokeWeight_over = true;
  else
    slider_strokeWeight_over = false;
    
  cursorType = ARROW;
  
  //POINT DISPERSION
  if(checkBox_pointDispersion_click == false)
  {
    checkBox_pointDispersion_stroke = checkBox_stroke_empty;
    checkBox_pointDispersion_fill = checkBox_fill_empty;
  }
  else
  {
    checkBox_pointDispersion_stroke = checkBox_stroke_select;
    checkBox_pointDispersion_fill = checkBox_fill_select;
  }
  
  //LINE
  if(checkBox_line_click == false)
  {
    checkBox_line_stroke = checkBox_stroke_empty;
    checkBox_line_fill = checkBox_fill_empty;
  }
  else
  {
    checkBox_line_stroke = checkBox_stroke_select;
    checkBox_line_fill = checkBox_fill_select;
  }
  
  //DISPLAY CIRCLES
  if(checkBox_displayCircles_click == false)
  {
    checkBox_displayCircles_stroke = checkBox_stroke_empty;
    checkBox_displayCircles_fill = checkBox_fill_empty;
  }
  else
  {
    checkBox_displayCircles_stroke = checkBox_stroke_select;
    checkBox_displayCircles_fill = checkBox_fill_select;
  }
  
  //DISPLAY WRITING HEAD
  if(checkBox_displayWritingHead_click == false)
  {
    checkBox_displayWritingHead_stroke = checkBox_stroke_empty;
    checkBox_displayWritingHead_fill = checkBox_fill_empty;
  }
  else
  {
    checkBox_displayWritingHead_stroke = checkBox_stroke_select;
    checkBox_displayWritingHead_fill = checkBox_fill_select;
  }
  
  //DISPLAY AXIS
  if(checkBox_displayAxis_click == false)
  {
    checkBox_displayAxis_stroke = checkBox_stroke_empty;
    checkBox_displayAxis_fill = checkBox_fill_empty;
  }
  else
  {
    checkBox_displayAxis_stroke = checkBox_stroke_select;
    checkBox_displayAxis_fill = checkBox_fill_select;
  }
  
  if(slider_strokeWeight_over)
  {
    slider_strokeWeight_fill = checkBox_fill_select;
    slider_strokeWeight_stroke = checkBox_stroke_select;
  }
}

//*************
//MOUSE PRESSED
void mousePressed()
{
  if(checkBox_pointDispersion_over)
  {
    checkBox_pointDispersion_click = !checkBox_pointDispersion_click;
    checkBox_line_click = !checkBox_line_click;
  }
  else if(checkBox_line_over)
  {
    checkBox_line_click = !checkBox_line_click;
    checkBox_pointDispersion_click = !checkBox_pointDispersion_click;
  }
  else if(checkBox_displayCircles_over)
  {
    checkBox_displayCircles_click = !checkBox_displayCircles_click;
  }
  else if(checkBox_displayWritingHead_over)
  {
    checkBox_displayWritingHead_click = !checkBox_displayWritingHead_click;
  }
  else if(checkBox_displayAxis_over)
  {
    checkBox_displayAxis_click = !checkBox_displayAxis_click;
  }
  else if(slider_strokeWeight_over)
  {
    slider_strokeWeight_unlock = true;
  }
  slider_strokeWeight_offsetX = mouseX - (slider_strokeWeight_progess + slider_strokeWeight_X);
}

void mouseReleased()
{
  slider_strokeWeight_unlock = false;
}

void mouseDragged()
{
  if(slider_strokeWeight_unlock)
  {
    slider_strokeWeight_progess = mouseX - slider_strokeWeight_offsetX - slider_strokeWeight_X;
    if(slider_strokeWeight_progess < 0)
      slider_strokeWeight_progess = 0;
    else if(slider_strokeWeight_progess > sliderDimensions)
      slider_strokeWeight_progess = sliderDimensions;
    
    strokeWeightValue = slider_strokeWeight_progess/sliderDimensions;
  }
}

//************
//AXIS DISPLAY
void axisDisplay()
{
  strokeWeight(5);
  stroke(#434D4D);
  line(width/2, height/2, width/2 + 5 * width/12, height/2);
}

//****************
//POINT DISPERSION
void pointDispersion()
{
  for(int count = 0; count < graphY.size(); count++)
  {   
    point(graphX.get(count), graphY.get(count));
  }
}

//**********
//LINE GRAPH
void lineGraph()
{
  int count;
  beginShape();
  curveVertex(graphX.get(0), graphY.get(0));
  for(count = 0; count < graphY.size(); count++)
  {
    curveVertex(graphX.get(count), graphY.get(count));
  }
  curveVertex(graphX.get(count - 1), graphY.get(count - 1));
  endShape();
}

//***********
//KEY PRESSED
void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP && keyPressUp == false) 
    {
      keyPressUp = true;
      maxSegments++;
    }
    if (keyCode == DOWN && keyPressDown == false && maxSegments > 0) 
    {
      keyPressDown = true;
      maxSegments--;
      if(maxSegments < 0)
      {
        maxSegments = 0;
      }
    }
  }
}

//************
//KEY RELEASED
void keyReleased() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
      keyPressUp = false;
    if (keyCode == DOWN) 
      keyPressDown = false;
  }
}
      
