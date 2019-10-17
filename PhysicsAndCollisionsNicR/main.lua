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
