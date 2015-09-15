-----------------------------------------------------------------------------------------
--
-- main.lua -- nexBus -- request bus times from a specific (fixed) bus-stop
--
-----------------------------------------------------------------------------------------

print ("nexBus is running") -- console output
local myTextObject1 = display.newText("Hello!", 160, 240, "Arial", 24)
local myTextObject2 = display.newText("Tap the screen to open a text", 160, 260, "Arial", 16)
local myTextObject3 = display.newText("that you can send to request bus times", 160, 280, "Arial", 16)
local myTextObject4 = display.newText("from Bow Garage to Exeter", 160, 300, "Arial", 16)
myTextObject1:setFillColor(1,0,0) -- set to red

function nexBus()
-- nexBus v 1.0 2015/04/17 Paul Rogers
-- derived from : http://docs.coronalabs.com/api/library/native/showPopup.html#TOC

-- Sends an sms to the transport service sms number
-- The text body is the ID of the bus stop
-- showPopup simply opens the phone sms app, prefilled with the transport service number and bus stop ID
-- the user must press send in the sms app to send the text
-- the transport service replies with the next few bus times for the bus stop ID
-- This reply comes as sms to the sms app - NexBus does no further processing after it opens the sms app.

	local options = { to = "84268", body = "dvnawdpd" } -- { to = phone number, body = bus-stop }
	native.showPopup("sms", options )  -- invoke the sms app (default sms app if set, choice of app if no default)
	myTextObject1:setFillColor(0, 0, 1)  -- set to blue, just so we know we got this far!
end

--function screenTap()
--	myTextObject1:setFillColor(0, 1, 0)  -- set to green
--	nexBus()
--end


display.currentStage:addEventListener("tap", nexBus) -- call nexBus func on screen tap



