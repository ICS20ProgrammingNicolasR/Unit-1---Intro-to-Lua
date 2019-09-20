-- Title: HelloWorld
-- Name: Nicolas Riscalas
-- Course: ICS2O
-- This program displays Hello to
--the simulator and to the command terminal.

--print to the command terminal
print ("What's up my dudes!")
print("This class is awesome")

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

--sets the backround colour 
display.setDefault("background", 180/255, 0/255, 40/255)

--create a text object
local textObject

--make the text object display my name 
textObject = display.newText ("welcome User", 512, 358, nil, 90)

--change the text colour 
textObject:setTextColor(0/255, 60/255, 80/255)

--create another text object 
local textObjectSignature

--displays who this is by
textObjectSignature = display.newText ("created by Nicolas Riscalas", 500, 450, "arial", 60)