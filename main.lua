-----------------------------------------------------------------------------------------
--
-- main.lua -- nexBus -- request bus times from a specific (fixed) bus-stop
--
-----------------------------------------------------------------------------------------
-- nexBus v 2.0 2015/09/27 Paul Rogers
-- derived from : http://docs.coronalabs.com/api/library/native/showPopup.html#TOC

-- Sends an sms to the transport service sms number
-- The text body is the ID of the bus stop
-- showPopup simply opens the phone sms app, prefilled with the transport service phone number and bus stop ID
-- the user must press send in the sms app to send the text
-- the transport service replies with the next few bus times for the bus stop ID
-- This reply comes as sms to the sms app - NexBus does no further processing after it opens the sms app.
------------------------------------------------------------------------------------------

print ("nexBus is running") -- console output
local nexBusErrorText = nil
local myTextObject1 = display.newText("Hello!", 160, 240, "Arial", 24)
local myTextObject2 = display.newText("Tap the screen to open a text", 160, 260, "Arial", 16)
local myTextObject3 = display.newText("that you can send to request bus times", 160, 280, "Arial", 16)
local myTextObject4 = display.newText("from Bow Garage to Exeter", 160, 300, "Arial", 16)
local nexBusErrorTextObj = display.newText(" ", 160, 320, "Arial", 16) -- blank the error text

-- myTextObject1:setFillColor(1,0,0) -- set to red

function getFromBusStopCode(fromBusStop)  -- arg: fromBusStop -is- the bus stop for which the next few bus departure times are required

	if fromBusStop == "Bow Garage" then
		local fromBusStopCode = "dvnawdpd"
	elseif fromBusStop == "Exeter St David's Railway Station" then
		local fromBusStopCode = "dvndmawa"
	else
		nexBusErrorText = "OOPS! BUS STOP NOT RECOGNIZED" -- set the error text
		return nil
	end
	return fromBusStopCode -- fromBusStopCode -is- the 8 letter code for the bus stop we want to depart from
end

function getBusTimesBySMS(fromBusStopCode)
	if fromBusStopCode then -- if fromBusStopCode isn't nil send sms, otherwise do nothing
		local options = { to = "84268", body = fromBusStopCode } -- { to = phone number, body = bus-stop code }
		native.showPopup("sms", options )  -- invoke the sms app (default sms app if set, choice of app if no default)
		-- myTextObject1:setFillColor(0, 0, 1)  -- set to blue, just so we know we got this far! FillColor is R,G,B in range 0 to 1
	end
end

-- MAIN PROGRAM --
-- BUTTONTEXT = "Bow Garage"
-- BUTTONTEXT = "Exeter St David's Railway Station"
BUTTONTEXT = "Unrecognisable stop"

display.currentStage:addEventListener("tap", getBusTimesBySMS(getFromBusStopCode(BUTTONTEXT))) -- on screen tap, call getBusTimesBySMS

if nexBusErrorText then -- nexBusErrorText will be nil if there were no errors
	local nexBusErrorTextObj = display.newText(nexBusErrorText, 160, 320, "Arial", 16) -- display the error if there is one
	nexBusErrorTextObj:setFillColor(1,0,0) end -- and set the error text to red
end


