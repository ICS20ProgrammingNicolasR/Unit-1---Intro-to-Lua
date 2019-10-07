-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This programdisplays a math question and asks the user to answer in a numeric textfield
-----------------------------------------------------------------------------------------

--set the background colour
display.setDefault("background",50/255, 100/255, 199/255)
local youlostImage=display.newImageRect("Images/you lost.jpg", 2048/2, 1536/2)
youlostImage.isVisible=false
youlostImage.anchorX=0
youlostImage.anchorY=0
local youwonimage=display.newImageRect("Images/you won.jpg",2048/2,1536/2)
youwonimage.isVisible=false
youwonimage.anchorX=0
youwonimage.anchorY=0
------------------------------------------------------------------------------------------
--local variables
------------------------------------------------------------------------------------------

--create local variables 
local questionObject
local correctObject 
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local textObject
local points=0
local lives=3
local randomNumber3 
local randomNumber4 
local randomNumber5
--------------------------------------------------------------------------------------------
--local functions
--------------------------------------------------------------------------------------------

local function AskQuestion()
	--generate a random number between 1-4
	randomOperator=math.random(1,4)
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1=math.random(0,10)
	randomNumber2=math.random(0,10)

	--if the randomOperator==1 then do adition
	if(randomOperator==1)then
		correctAnswer=randomNumber1+randomNumber2

	--create question in text Object
	questionObject.text=randomNumber1.." + "..randomNumber2.." = "
	--if it is 2 do subtraction
	elseif(randomOperator==2)then
		correctAnswer=randomNumber1-randomNumber2
		--create question in textObject
		questionObject.text=randomNumber1.." - "..randomNumber2.." = "
	elseif(randomOperator==3)then
		correctAnswer=randomNumber1*randomNumber2
		questionObject.text=randomNumber1.." x "..randomNumber2.." = "
	elseif(randomOperator==4)then
		randomNumber4=math.random(1,10)
		randomNumber3=math.random(1,10)
		randomNumber5=randomNumber4*randomNumber3
		correctAnswer=randomNumber5/randomNumber4
		questionObject.text=randomNumber5 .. " / "..randomNumber4.."="
	end

end

local function HideCorect()	
	correctObject.isVisible=false
	textObject.isVisible=false
	AskQuestion()
end
local function NumericFieldListener(event)
	-- User begins editing "numericField"
	if (event.phase=="began")then

		--clear text field 
		event.target.text=""

	elseif(event.phase=="submitted")then
		--when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer=tonumber(event.target.text)

		--if the users answer and the correct answer are the same:
		if (userAnswer==correctAnswer)then
			correctObject.isVisible=true 
			timer.performWithDelay(2000,HideCorrect)
			AskQuestion()
			textObject.isVisible=false
			--give one point
			points=points+1
			--update it in display object
			pointsText.text="points ="..points
			if(points==5)then
				questionObject.isVisible=false
				correctObject.isVisible=false
				numericField.isVisible=false
				pointsText.isVisible=false
				livesText.isVisible=false
				textObject.isVisible=false
				youwonimage.isVisible=true
				local newimage =display.newImageRect("Images/you won.jpg",2048/2,1536/2)
				newimage.anchorX=0
				newimage.anchorY=0
			end				
		else
			textObject.isVisible=true
			timer.performWithDelay(2000,HideCorrect)
			AskQuestion()
			correctObject.isVisible=false
			lives=lives-1
			livesText.text="lives ="..lives
			if(lives==0)then			
				questionObject.isVisible=false
				correctObject.isVisible=false
				numericField.isVisible=false
				textObject.isVisible=false
				pointsText.isVisible=false
				livesText.isVisible=false
				youlostImage.isVisible=true
				local badimage=display.newImageRect("Images/you lost.jpg",2048/2,1536/2)
				badimage.anchorX=0
				badimage.anchorY=0
				timer.performWithDelay(1000)
			end
		end 
		--clear text field 
		event.target.text=""

	end
end

------------------------------------------------------------------------------------------------
-- Object Ceation
------------------------------------------------------------------------------------------------

-- display a question and sets the colour 
questionObject=display.newText("", display.contentWidth/3,display.contentHeight/2,nil,50)
questionObject:setTextColor(255/255, 2/255, 198/255)

--create the correct text object and make it invisible 
correctObject=display.newText("Correct.You gain a point! Good Job:)", display.contentWidth/2, display.contentHeight*2/3,nil,50)
correctObject:setTextColor(255/255, 42/255, 198/255)
correctObject.isVisible=false
--create the incorrect text objecti
textObject=display.newText("That is incorrect:(.You lose one life.",display.contentWidth/2,display.contentHeight*2/3,nil,50)

--create a numeric field
numericField=native.newTextField(display.contentWidth/2, display.contentHeight/2, 150,80)
numericField.inputType="number"

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)
textObject.isVisible=false
textObject:setTextColor(255/255, 2/255, 198/255)
pointsText = display.newText("Points ="..points, display.contentWidth/3,display.contentHeight/3,nil,50)
livesText = display.newText("Lives ="..lives, display.contentWidth/4,display.contentHeight/4,nil,50)
--------------------------------------------------------------------------------------------------
--function calls
--------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()