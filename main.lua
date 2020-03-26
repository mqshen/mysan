
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

function cc.exports.MyConvert(table, target) 
	for k, t in pairs(table._src_tb_) do
		local v = table._tb_convert_func_(k, t)
		target[k] = v
	end
end

local function main()
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
