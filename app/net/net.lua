local Net = class("Net")

local cjson = require "cjson"

local instance = nil

function Net:ctor()
end

local function onOpen()
    Net.websocket:sendString("onOpen")
end

local function onNetworkState()
end

local function onNetworkError()
end

local function onCallback(data)
    local index = string.find(data, "|")
	local iCmd = string.sub(data, 1, index - 1)
	local response = string.sub(data, index + 1)
	print(" this is on call back " .. iCmd .. " response " .. response)
	if not data then
		return
    end
    
    local netObserver = NetObserver.getInstance()
    netObserver.post(tonumber(iCmd), cjson.decode(response))
end

function Net:connect(strIp, iPort)
	self.iP = strIp
    self.port = iPort
    self.websocket = cc.WebSocket:create("ws://" .. Net.ip .. ":" .. Net.port .. "/ws")
	self.websocket:registerScriptHandler(onOpen, cc.WEBSOCKET_OPEN)
	self.websocket:registerScriptHandler(onNetworkState, cc.WEBSOCKET_CLOSE)
	self.websocket:registerScriptHandler(onNetworkError, cc.WEBSOCKET_ERROR)
	self.websocket:registerScriptHandler(onCallback, cc.WEBSOCKET_MESSAGE)
end

function Net:send(iCmd, data)
	local strJsonData = cjson.encode(data)
	if self.websocket then
		self.websocket:sendString(strJsonData)
	else
		print("<<<<<<<<<<<<<<<<< connection not connect >>>>>>>>>>>>>>>>>")
	end
end

function Net.getInstance()
    if not instance then
        instance = Net:create()
    end
    return instance
end

return Net