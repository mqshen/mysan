cc.exports.NetObserver = class("NetObserver")

local instance = nil

function NetObserver:ctor()
end

local listeners = {}

function NetObserver:addObserver(name, listener)
	if not listeners[name] then
		listeners[name] = {}
		table.insert(listeners[name], listener)
	end
end

function NetObserver:post(name, ...)
	if listeners[name] then
		for i, v in pairs(listeners[name]) do
			v(...)
		end
	end
end

function NetObserver:removeObserver(name)
	if listeners[name] then
		listeners[name] = nil
	end
end

function NetObserver.getInstance()
    if not instance then
        instance = NetObserver:create()
    end
    return instance
end

return NetObserver