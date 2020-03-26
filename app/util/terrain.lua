--地图各个图片的ccrect

--水的边缘
--上直边 11,12
--下直边 21,22
--左直边 31,32
--右直边 41,42
--上缺角 51,52,53
--下缺角 61,62,63
--左缺角 71,72,73
--右缺角 81,82,83
--上转角 91,92,93
--下转角 101,102,103
--左转角 111,112,113
--右转角 121,122,123

-- local waterToPng = {}  --水的边缘到图片的映射
-- waterToPng["a"] = 11
-- waterToPng["b"] = 12
-- waterToPng["c"] = 21
-- waterToPng["d"] = 22
-- waterToPng["e"] = 31
-- waterToPng["f"] = 32
-- waterToPng["g"] = 41
-- waterToPng["h"] = 42
-- waterToPng["i"] = 51
-- waterToPng["j"] = 52
-- waterToPng["k"] = 53
-- waterToPng["l"] = 61
-- waterToPng["m"] = 62
-- waterToPng["n"] = 63
-- waterToPng["o"] = 71
-- waterToPng["p"] = 72
-- waterToPng["q"] = 73
-- waterToPng["r"] = 81
-- waterToPng["s"] = 82
-- waterToPng["t"] = 83
-- waterToPng["u"] = 91
-- waterToPng["v"] = 92
-- waterToPng["w"] = 93
-- waterToPng["x"] = 101
-- waterToPng["y"] = 102
-- waterToPng["z"] = 103
-- waterToPng["A"] = 111
-- waterToPng["B"] = 112
-- waterToPng["C"] = 113
-- waterToPng["D"] = 121
-- waterToPng["E"] = 122
-- waterToPng["F"] = 123
-- waterToPng["G"] = 1
-- waterToPng["H"] = 0 --waterTable[i][j] ==0
-- waterToPng["I"] = 3 --山的过渡
-- waterToPng["J"] = 131
-- waterToPng["K"] = 132
-- waterToPng["L"] = 133
-- waterToPng["M"] = 134

local waterToPng = {}  --水的边缘到图片的映射
--上直边 11,12
--下直边 21,22
--左直边 31,32
--右直边 41,42
--上缺角 51,52,53
--下缺角 61,62,63
--左缺角 71,72,73
--右缺角 81,82,83
--上转角 91,92,93
--下转角 101,102,103
--左转角 111,112,113
--右转角 121,122,123
waterToPng[311] = 11
waterToPng[312] = 12
waterToPng[321] = 21
waterToPng[322] = 22
waterToPng[331] = 31
waterToPng[332] = 32
waterToPng[341] = 41
waterToPng[342] = 42
waterToPng[111] = 51
waterToPng[112] = 52
waterToPng[113] = 53
waterToPng[121] = 61
waterToPng[122] = 62
waterToPng[123] = 63
waterToPng[131] = 71
waterToPng[132] = 72
waterToPng[133] = 73
waterToPng[141] = 81
waterToPng[142] = 82
waterToPng[143] = 83
waterToPng[512] = 92
waterToPng[522] = 102
waterToPng[532] = 112
waterToPng[542] = 122
waterToPng[421] = 132
waterToPng[431] = 131

local sandToPng = {}
sandToPng[311] = 11
sandToPng[312] = 12
sandToPng[321] = 21
sandToPng[322] = 22
sandToPng[331] = 31
sandToPng[332] = 32
sandToPng[341] = 41
sandToPng[342] = 42
sandToPng[111] = 51
sandToPng[112] = 52
sandToPng[113] = 53
sandToPng[121] = 61
sandToPng[122] = 62
sandToPng[123] = 63
sandToPng[131] = 71
sandToPng[132] = 72
sandToPng[133] = 73
sandToPng[141] = 81
sandToPng[142] = 82
sandToPng[143] = 83
sandToPng[512] = 92
sandToPng[522] = 102
sandToPng[532] = 112
sandToPng[542] = 122
sandToPng[421] = 132
sandToPng[431] = 131

local function changeXy( x,y)
	return (x-1)*3002+y
end

local function returnCCRectAndPos(index)
	local water = waterToPng[index]
	if not water then return nil end
	return "water_"..water..".png"
end

local function returnSandCCRectAndPos( index )
	local sand = sandToPng[index]
	if not sand then return nil end
	return "sand_"..sand..".png"
end

-- local function returnIfzhuanjiao(x,y )
-- 	return waterToPng[string.sub(waterLocationData,changeXy(x,y), changeXy(x,y))]
-- end

--
-- local function returnType(x,y )
-- 	return string.sub(waterLocationData,changeXy(x,y), changeXy(x,y))
-- end

-- local function isNeedWaterEdge(x, y )
-- 	local temp =string.sub(waterLocationData,changeXy(x,y), changeXy(x,y))
-- 	if temp == "G" or temp == "H" then
-- 		return false
-- 	end
-- 	return true
-- end

-- local function isInWaterData(x,y )
-- 	if x<1 or x>3002 or y<1 or y>3002 then
-- 		return false
-- 	end
-- 	return true
-- end


--地形解析

-- local des = {"a","b", "c", "d", "e", "f", "g","h","i","j","k","l","m","n","o","p","q","r","s","t"}
-- local mapTerrain = {"0","1","2","a1","a2","a3","a4","A1","A2","A3","A4","A5","A6",
-- 					"A7","A8","A9","a11","a21","a31","a41"}
-- local location = {}
-- for i,v in ipairs(des) do
-- 	location[v] = mapTerrain[i]
-- end

local function isInMap( x,y )
	if x<1 or x > 1501 or y<1 or y>1501 then
		return false
	end
	return true
end

-- local function isqiulin(x,y )
-- 	if not isInMap( x,y ) then
-- 		return false
-- 	end
-- 	local ter = string.sub(mapAllData,(x-1)*1501+y, (x-1)*1501+y)--location[string.sub(mapLocationData,(x-1)*1501+y, (x-1)*1501+y)]
-- 	if not ter then
-- 		return false
-- 	end
-- 	ter = string.byte(ter)+1
-- 	local qiulin = string.sub(worldLandMapTable, ter, ter)  
-- 	-- return ter and (ter == "2" or ter == "a1" or ter=="a2" or ter=="a3" or ter=="a4" or ter=="A1"
-- 	-- 				or ter=="A2" or ter=="A3" or ter=="A4" or ter=="A5" or ter=="A6" or ter=="A7"
-- 	-- 				or ter=="A8" or ter=="A9")
-- 	return qiulin and (qiulin == "2" or qiulin == "3")
-- end

local function returnTerrain(x,y )
	if not isInMap( x,y ) then
		return false
	end
	local ter = string.sub(mapAllData, (x-1)*1501+y, (x-1)*1501+y)
	if not ter then
		return false
	end
	ter = string.byte(ter)
	local ter_str = tostring(ter%16)
	-- ter_str等于3就是山，0就是其他普通地形,1就是水,如果都不是，就要把整一个ter作为判断
	return ter_str,ter
end

local function isWaterTerrain(x,y )
	if not isInMap( x,y ) then
		return false
	end

	local ter = string.sub(mapAllData,(x-1)*1501+y, (x-1)*1501+y)

	if not ter then
		return false
	end
	ter = string.byte(ter)
	local water = tostring(ter%16)
	return water and water == "1"
end

local function getQiulinType(x,y )
	local ter, ter_type = returnTerrain(x,y )
	if ter == "0" then
		if math.floor(ter_type/16) == 2 then
			return "3"
		else
			return false
		end
	else
		return false
	end
end

local function isMountain( x, y)
	local ter_str,ter_type = returnTerrain(x,y )
	if ter_str == "3" then
		local mountainType = math.floor(ter_type/16)
		-- 1,2,3代表1x1的山，2x2的山，3x3的山， 4代表山之间右下角的过渡 5代表右上角的过渡
		if mountainType == 1 or mountainType == 2 or mountainType == 3 or mountainType == 4 or mountainType == 5 or mountainType == 6 then
			-- if mountainType == 4 or mountainType == 5 then
				-- print(">>>>>>>>>>>>>>>>>>>>fffffff ="..x.." yy ="..y)
			-- end
			return tostring(mountainType)
		else
			return "0"
		end
	else
		return false
	end
end

local function isSmallWater( x,y )
	local _x, _y = math.ceil(x/2), math.ceil(y/2)
	if not isInMap( _x,_y ) then
		return false
	end
	local ter = string.sub(mapAllData,(_x-1)*1501+_y, (_x-1)*1501+_y)
	if not ter then
		return false
	end

	ter = string.byte(ter)
	local water = tostring(ter%16)
	return water and water == "1"
end

local function isSmallSand( x,y )
	local _x, _y = math.ceil(x/2), math.ceil(y/2)
	if not isInMap( _x,_y ) then
		return false
	end
	return resourceData.resourceLevel(_x, _y) == 11 
end

-- local function getBattleResourceLevel(wid)
-- 	local x, y = math.floor(wid/10000), wid%10000
-- 	if not isInMap( x,y ) then
-- 		return false
-- 	end
	
-- end

cc.exports.terrain = {
				returnCCRectAndPos = returnCCRectAndPos,
				getQiulinType = getQiulinType,
				isInMap = isInMap,
				returnTerrain = returnTerrain,
				isWaterTerrain = isWaterTerrain,
				isSmallWater = isSmallWater,
				isSmallSand = isSmallSand,
				isMountain = isMountain,
				returnSandCCRectAndPos = returnSandCCRectAndPos,
}
