-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This programdisplays a math question and asks the user to answer in a numeric textfield
-----------------------------------------------------------------------------------------

--set the background colour
display.setDefault("background",50/255, 100/255, 199/255)

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
local textObject=display.newText("That is incorrect:(",display.contentWidth/2,display.contentHeight*2/3,nil,50)

--------------------------------------------------------------------------------------------
--local functions
--------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1=math.random(0,10)
	randomNumber2=math.random(0,10)

	correctAnswer=randomNumber1+randomNumber2

	--create question in text correctObject
	questionObject.text=randomNumber1.."+"..randomNumber2.."="

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
		else
			textObject.isVisible=true
			timer.performWithDelay(2000,HideCorrect)
			AskQuestion()
			correctObject.isVisible=false
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
correctObject=display.newText("Correct", display.contentWidth/2, display.contentHeight*2/3,nil,50)
correctObject:setTextColor(255/255, 42/255, 198/255)
correctObject.isVisible=false

--create a numeric field
numericField=native.newTextField(display.contentWidth/2, display.contentHeight/2, 150,80)
numericField.inputType="number"

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)
textObject.isVisible=false
textObject:setTextColor(255/255, 2/255, 198/255)
--------------------------------------------------------------------------------------------------
--function calls
--------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()