-----------------------------------------------------------------------------------------
--
-- main.lua -- nexBus -- request bus times from a specific (fixed) bus-stop
--
-----------------------------------------------------------------------------------------
-- nexBus v 2.1 2015/10/02 Paul Rogers
-- derived from : http://docs.coronalabs.com/api/library/native/showPopup.html#TOC

-- Sends an sms to the transport service sms number
-- The text body is the ID of the bus stop
-- showPopup simply opens the phone sms app, prefilled with the transport service phone number and bus stop ID
-- the user must press send in the sms app to send the text
-- the transport service replies with the next few bus times for the bus stop ID
-- This reply comes as sms to the sms app - NexBus does no further processing after it opens the sms app.
------------------------------------------------------------------------------------------

--print ("nexBus is running") -- console output

local nexBusButtonBow = display.newImage("buttonBow.png", display.contentWidth/2, display.contentHeight/2+100)
local nexBusButtonExD = display.newImage("buttonExD.png", display.contentWidth/2, display.contentHeight/2+200)

local nexBusTextObject1 = display.newText("Tap a button to open a text", display.contentWidth/2, display.contentHeight/2-150, "Arial", 16)
local nexBusTextObject2= display.newText("that you can send to request bus times", display.contentWidth/2, display.contentHeight/2-100, "Arial", 16)
local nexBusTextObject3= display.newText("from Bow Garage or Exeter St Davids", display.contentWidth/2, display.contentHeight/2-50, "Arial", 16)

function getBusTimesBySMS(fromBusStopCode)
--print("fTimes:", fromBusStopCode)
	if fromBusStopCode then -- if fromBusStopCode isn't nil send sms, otherwise do nothing
		local options = { to = "84268", body = fromBusStopCode } -- { to = phone number, body = bus-stop code }
		native.showPopup("sms", options )  -- invoke the sms app (default sms app if set, choice of app if no default)
	end
end

function getBusTimesFromBow(event)
	getBusTimesBySMS("dvnawdpd") -- bus stop code for Bow Garage
end

function getBusTimesFromExD(event)
	getBusTimesBySMS("dvndmawa") -- bus stop code for Exeter St Davids
end

nexBusButtonBow:addEventListener("tap", getBusTimesFromBow )
nexBusButtonExD:addEventListener("tap", getBusTimesFromExD )
