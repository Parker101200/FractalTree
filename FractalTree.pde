private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .35;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(226,191,159);   
	stroke(0);   
	line(320,480,310,380);   
	drawBranches(310,380,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1, endY1);
	line(x,y,endX2, endY2);
	if (branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
    	drawBranches(endX2, endY2, branchLength, angle2);
	}
} 