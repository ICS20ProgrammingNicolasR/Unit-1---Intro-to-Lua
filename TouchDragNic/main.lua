-- Title: TouchAndDrag
-- Name: Your Name
-- Course: ICS2O/3C
-- This program..

--set the background
local backgroundImage=display.newImageRect("Images/looney tunes.png", 2048/2, 1536/2)

--create variables
local roadrunner=display.newImageRect("Images/road runner.png", 150,150)
local tasmaniandevil=display.newImageRect("Images/devil.png", 150,150)
local roadrunnerwidth=roadrunnerwidth
local roadrunnerheight=roadrunnerheight
local tasmaniandevilwidth=tasmaniandevilwidth
local tasmaniandevilheight=tasmaniandevilheight
--my boolean variables
local alreadyTouchedRoadRunner=false
local alreadyTouchedTasmanianDevil=false

--set my x/y of variables
tasmaniandevil.x=500
tasmaniandevil.y=300
roadrunner.x=400
roadrunner.y=100

-- set x/y of variables
backgroundImage.anchorX=0
backgroundImage.anchorY=0

--Function:tasmaniandevil
--Input:touch listener
--Output:none
--description: when tasmanian devil is touched,move him
local function tasmaniandevillistener(touch)
	if(touch.phase=="began")then
		if (alreadyTouchedRoadRunner==false) then
		alreadyTouchedTasmanianDevil=true
		end
	end

	if ( (touch.phase=="moved")and(alreadyTouchedTasmanianDevil==true) )then
	tasmaniandevil.x=touch.x
	tasmaniandevil.y=touch.y
	end

	if(touch.phase=="ended")then
	alreadyTouchedTasmanianDevil=false
	alreadyTouchedRoadRunner=false
	end
end

--add the respective listeners to each object 
tasmaniandevil:addEventListener("touch", tasmaniandevillistener)

--Function:roadrunnerlistener
--Input:touch listener
--Output:none
--description: when roadrunner is touched,move him
local function roadrunnerlistener(touch)
	if(touch.phase=="began")then
		if (alreadyTouchedTasmanianDevil==false) then
		alreadyTouchedRoadRunner=true
		end
	end

	if ( (touch.phase=="moved")and(alreadyTouchedRoadRunner==true) )then
	roadrunner.x=touch.x
	roadrunner.y=touch.y
	end

	if(touch.phase=="ended")then
	alreadyTouchedTasmanianDevil=false
	alreadyTouchedRoadRunner=false
	end
end

--add the respective listeners to each object 
roadrunner:addEventListener("touch",roadrunnerlistener)