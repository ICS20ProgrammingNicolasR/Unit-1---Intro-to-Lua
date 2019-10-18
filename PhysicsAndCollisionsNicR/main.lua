-----------------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Your Name
-- Course: ICS2O/3C
-- This program makes many  balls bounce off a plank and walls
------------------------------------------------------------------------------------------------
--load physics 
local physics=require("physics")

--start physics
physics.start()
-------------------------------------------------------------------------------------------------
--OBJECTS 
------------------------------------------------------------------------------------------------
--GROUND
local ground=display.newImage("Images/ground.png", 0, 0)
	ground.x=display.contentCenterX
	ground.y=display.contentHeight/1.35
	--Change the width to be the same as the screen
	ground.width=display.contentWidth

	--add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------------------
local woodenBeam=display.newImage("Images/woodbeam.png", 0, 0)
	--set the x and y pos
	woodenBeam.x=display.contentCenterX/5
	woodenBeam.y=display.contentCenterY*1.65

	--set the width and height of the beam 
	woodenBeam.width=display.contentWidth/2
	woodenBeam.height=display.contentHeight/2