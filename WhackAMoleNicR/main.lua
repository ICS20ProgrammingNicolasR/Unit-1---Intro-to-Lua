-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program creates a WhackAMole game
-- Your code here
--create the background
local background=display.newImageRect("Images/animal chin background.jpg", display.contentWidth, display.contentHeight)

--anchor bkg
background.anchorX=0
background.anchorY=0

--create tonyhawk
local tonyhawk=display.newImageRect( "Images/tony hawk.png", 1000, 1000)

--set the position
tonyhawk.x=display.contentCenterX
tonyhawk.y=display.contentCenterY
tonyhawk.width=tonyhawk.width/3
tonyhawk.height=tonyhawk.height/3
tonyhawk.isVisible=true

local points=0

local pointsText=display.newText("points = "..points, 900, 100)
pointsText.width=tonyhawk.width
pointsText:setTextColor(0,1,1)
------------------------------FUNCTIONS-----------------------------------
--this makes the mole appear at randon positions
function PopUp()
	-- choosing Random position between 0 and the size of the screen
	tonyhawk.x=math.random(0, display.contentWidth)
	tonyhawk.y=math.random(0, display.contentHeight)
	timer.performWithDelay(500, PopUp)
end
--this function calls the pop up function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp)
end
function Hide()
	--make tonyhawk Hide
	tonyhawk.isVisible=false
	PopUpDelay()
end

--this increases the score up by one when tony hawk is clicked
function Whacked( event )
	if (event.phase =="began")then
		points=points+1
		pointsText.text=("points ="..points)
	end
end
---------------------------------------------EVENT LISTENER------------------------------
-- I add the event listener
tonyhawk:addEventListener( "touch", Whacked )
---------------------------------------------CALL THE GAME-------------------------------------------------------------------------------
PopUp()