-- Title: AreaOfRectangleAndCircle
-- Name: Nicolas Riscalas
-- Course: ICS2O
-- This program displays a rectangle and shows the area

-- create my local variables
local areaText
local textSize = 50 
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myRectangle
local myCircle
local radiusOfCircle = 200
local areaOfCircle
-- set the background colou of my screen. Colours are between 0-1
display.setDefault("background", 50/255, 200/255, 300/255)

-- draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

--anchor the rectangle in the middle of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 400
myRectangle.y = 350

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor(245/255, 30/255, 200/255)

--set colour of border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area
areaOfRectangle=widthOfRectangle*heightOfRectangle

-- write the area on the screen.take into consideration the font when positioning it on the screen
areaText=display.newText("The area of this rectangle with a width of \n"..
	widthOfRectangle.." and a height of "..heightOfRectangle.."is "..
	areaOfRectangle.."pixels².", 570, 700, Arial, textSize)

-- set the colour of the newText 
areaText:setTextColor(0.7, 1, 1)

--draw circle
 myCircle = display.newCircle( 100, 100, 30 )
myCircle:setFillColor( 0.5 )

myCircle.anchorX=0
myCircle.anchorY=0
myCircle.x=300
myCircle.Y=400

myCircle.strokeWidth=20

myCircle:setStrokeColor(0, 0.4, 0.7)

areaOfCircle=radiusOfCircle*3.14159

areaText=display.newText("The area of this Circle with a radius of \n"..
	radiusOfCircle.."is".. areaOfCircle.."pixels².", 570, 250, Arial, textSize)