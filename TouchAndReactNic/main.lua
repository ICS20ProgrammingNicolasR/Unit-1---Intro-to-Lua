-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
--set the backgroucd color
display.setDefault("background", 15/255, 100/255, 255/255)

--create a button
local spaceship=display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
spaceship.x=display.contentWidth/2
spaceship.y=display.contentHeight/2
spaceship.isVisible=true

--create the second button
local redbutton=display.newImageRect("Images/Fast Button active@2x.png",198,96)
redbutton.x=display.contentWidth/2
redbutton.y=display.contentHeight/2
redbutton.isVisible=false
--create the text object
local textObject=display.newText("Clicked!", 0,0,nil,50)
textObject.x=display.contentWidth/2
textObject.y=display.contentHeight/3
textObject.isVisible=false
--sound variables
local audio1 = audio.loadSound( "Sounds/Correct Answer Sound Effect.mp3" )
--function:Blue button listener
--input:touch listener
--output:none
--operation:when blue button is clicked it will make the text appear and the blue button disapear
local function BlueButtonListener(touch)
	if(touch.phase=="began")then
		spaceship.isVisible=false
		redbutton.isVisible=true
		textObject.isVisible=true
		audio.play(audio1)
	end
	if(touch.phase=="ended")then
		spaceship.isVisible=true
		redbutton.isVisible=false
		textObject.isVisible=false
	end
end
 local function redbuttonlistener(touch)
 	if(touch.phase=="began")then
 		spaceship.isVisible=false
 		redbutton.isVisible=true
 		textObject.isVisible=true
 		audio.play(audio1)
 	end
 	if(touch.phase=="ended")then
 		spaceship.isVisible=true
 		redbutton.isVisible=false
 		textObject.isVisible=false
 	end
 end
 spaceship:addEventListener("touch",BlueButtonListener)
 redbutton:addEventListener("touch",redbuttonlistener)