-- Title: MovingImages
-- Name: Nicolas Riscalas
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen.

--global vaiables
scrollSpeed=3

--background image with width and height
local backgroundImage=display.newImageRect("Images/background.png", 2048, 1536)

--character image with width and height 
local melleniumFalcon = display.newImageRect("Images/spaceship.png", 200, 200)

--make a random number variable
local randomNumber=math.random(1,5)
--set image to be transparent
melleniumFalcon.alpha=0

--set the initial x and y position of the space ship
melleniumFalcon.x=0
melleniumFalcon.y=display.contentHeight/randomNumber

--Function:MoveShip
--Input:this function accepts an event lstener
--Output:none
--Description this function adds the scroll speed ti the x-value of the ship 
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship 
	melleniumFalcon.x=melleniumFalcon.x+scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out 
	melleniumFalcon.alpha=melleniumFalcon.alpha + 0.01
end

--Move ship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--create a tiefighter 
local tiefighter=display.newImageRect("images/tiefighterjpg.jpg", 200,200)

--set tiefighter transparent

--set initial x and y of tie fighter


--Function:MoveShip
--Input:this function accepts an event lstener
--Output:none
--Description this function adds the scroll speed ti the x-value of the ship 
local function MoveShip(event)
	-- add the scrollSpeedto the y value of the ship 

end

--Move ship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
