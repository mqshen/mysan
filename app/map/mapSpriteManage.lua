--大地图元素的管理池
-- 使用池的概念把所有生成的大地图元素缓存，拖动大地图的时候并不删除sprite，
-- 只是在缓存池中取对应的元素。如果缓存不足，那么生成新的元素，再移动到对应的位置
cc.exports.MapSpriteManage = MapSpriteManage or {}
-- 山的资源
local mountainPicInState = {1,1,1,1,3,1,1,1,3,3,1,3,1,}
-- 丘陵的资源 第一套是沙地 第二套是草地
local hillPicInState = {1,1,1,1,3,1,2,2,3,3,2,3,2,}
-- 水的资源
local waterPicInState = {1,1,1,1,3,1,2,2,3,3,2,3,2,}
-- 沙地的资源
local sandPicInState = {1,1,1,1,3,1,2,2,3,3,2,3,2,}
-- 地表的资源
local surfacePicInState = {1,1,1,1,3,1,2,2,3,3,2,3,2,}

-- 资源地的资源
local resPicInState = {1,1,1,1,3,1,2,2,3,3,2,3,2,}

local spriteTypePool = {}
	-- [1] = {},
	-- [2] = {},
	-- [3] = {},
	-- [4] = {},
	-- [5] = {},
	-- [6] = {},
	-- [7] = {},
	-- [8] = {},
	-- [9] = {},
	-- [10] = {},
	-- [11] = {},
	-- [12] = {},
	-- [13] = {},
	-- [14] = {},	
	-- [15] = {},
	-- [16] = {},
	-- [17] = {},
	-- [18] = {},
	-- [19] = {},
	-- [20] = {},
	-- [21] = {},
	-- [22] = {},
	-- [23] = {},
	-- [24] = {},
	-- ["army_mark_blue"] = {},
	-- ["army_mark_red"] = {},
	-- ["army_mark_green"] = {},
	-- ["army_mark_purple"] = {},
	-- ["group_mark_blue"] = {},
	-- ["group_mark_red"] = {},
	-- ["group_mark_green"] = {},
-- }

local armySpriteType = {
	["army_mark_blue"] = 1,
	["army_mark_red"] = 1,
	["army_mark_green"] = 1,
	["army_mark_purple"] = 1,
	["group_mark_blue"] = 1,
	["group_mark_red"] = 1,
	["group_mark_green"] = 1,
}

function MapSpriteManage.init( )
	spriteTypePool = {}
	for i, v in pairs(mapElement) do
		if not spriteTypePool[v] then
			spriteTypePool[v] = {}
		end
	end
	spriteTypePool["army_mark_blue"] = {}
	spriteTypePool["army_mark_red"] = {}
	spriteTypePool["army_mark_green"] = {}
	spriteTypePool["army_mark_purple"] = {}
	spriteTypePool["group_mark_blue"] = {}
	spriteTypePool["group_mark_red"] = {}
	spriteTypePool["group_mark_green"] = {}
end

function MapSpriteManage.remove( )
	spriteTypePool = {}
end

function MapSpriteManage.decreaseSprite(spriteType ,key)
	-- spriteTypePool[spriteType][key]
	for i, v in pairs(armySpriteType) do
		if i ~= spriteType then
			for m, n in pairs(spriteTypePool[i]) do
				for k = #n, 1, -1 do
					n[k]:removeFromParent(true)
					n[k] = nil
					return true
				end
			end
		end
	end
	return false
end

--当元素不足，生成新的元素放进缓存池
function MapSpriteManage.createSprite(parent, pool, key )
	local tmpSprite = nil
	if key == "nil" then
		tmpSprite = cc.Sprite:createWithTexture(parent:getTexture(), mapData:getEmptyRect())
	else
		tmpSprite = cc.Sprite:createWithSpriteFrameName(key)
	end
	parent:addChild(tmpSprite)
	tmpSprite:setVisible(false)
	-- table.insert(pool, tmpSprite)
	pool[1] = tmpSprite
end

--把对应的元素从缓存池中取出
function MapSpriteManage.popSprite( spriteType, key, parent)
	if spriteTypePool[spriteType] then
		--对应图素对应的池
		if not spriteTypePool[spriteType][key] then
			spriteTypePool[spriteType][key] = {}
		end
		if #spriteTypePool[spriteType][key] == 0 then
			if armySpriteType[spriteType] and parent:getTextureAtlas():getCapacity() > 30000 then
				return false
			else
				MapSpriteManage.createSprite(parent, spriteTypePool[spriteType][key], key )
			end
		end

		local count = #spriteTypePool[spriteType][key]
		local sprite = spriteTypePool[spriteType][key][count]
		spriteTypePool[spriteType][key][count] = nil
		return sprite
	else
		print(">>>>>>>>>>>>>pop error , type  ="..spriteType)
	end
end

--把暂时不用的元素放到缓存池
function MapSpriteManage.pushSprite(spriteType, key, target )
	if spriteTypePool[spriteType] then
		if key == "nil" then
			target:removeFromParent(true)
			return
		end

		if not spriteTypePool[spriteType][key] then
			spriteTypePool[spriteType][key] = {}
		end

		if target then
			target:setVisible(false)
			target:setTag(0)
			target:setLocalZOrder(0)
			-- table.insert(spriteTypePool[spriteType][key], target)
			local count = #spriteTypePool[spriteType][key]
			spriteTypePool[spriteType][key][count+1] = target
		end
	else
		print(">>>>>>>>>>>>>push error , type  ="..spriteType)
	end
end

local function subSpriteName(name )
	local len = string.len(name)
	return string.sub(name,1,len-4)
end

-- 最底层的地表
local function getGrassInfo(spriteType, name, wid )
	local x, y = math.floor(wid/10000),wid%10000
	local stateIndex = surfacePicInState[stateData.stateInMap(x,y)]
	if stateIndex then
		return subSpriteName(name ).."_"..stateIndex..".png", mapData:getObject().grass
	else
		for i = x-2, x+2 do
			for j = y-2, y+2 do
				stateIndex = surfacePicInState[stateData.stateInMap(i,j)] 
				if stateIndex then
					return subSpriteName(name ).."_"..stateIndex..".png",mapData:getObject().grass
				end
			end
		end
		return subSpriteName(name ).."_1.png",mapData:getObject().grass
	end
end

-- 丘陵
local function getHillInfo(spriteType, name, wid )
	local x, y = math.floor(wid/10000),wid%10000
	local stateIndex = hillPicInState[stateData.stateInMap(x,y)]
	if stateIndex then
		return subSpriteName(name ).."_"..stateIndex..".png",mapData:getObject().grass
	else
		return subSpriteName(name ).."_1.png", mapData:getObject().grass
	end
end

-- 山
local function getMountainInfo( spriteType, name, wid )
	local x, y = math.floor(wid/10000),wid%10000
	local stateIndex = mountainPicInState[stateData.stateInMap(x,y)]
	if stateIndex then
		if stateIndex == 3 then
			return subSpriteName(name ).."_"..stateIndex..".png", mapData:getObject().zhuzha
		else
			for i = x-3, x+3 do
				for j = y-3, y+3 do
					stateIndex = mountainPicInState[stateData.stateInMap(i,j)] 
					if stateIndex and stateIndex == 3 then
						for m= i-1, i+1 do
							for n = j -1 , j+1 do
								if mapData:getCityType(m,n) then
									return subSpriteName(name ).."_"..stateIndex..".png",mapData:getObject().zhuzha
								end
							end
						end
					end
				end
			end
			return subSpriteName(name )..".png",mapData:getObject().zhuzha
		end
	else
		for i = x-3, x+3 do
			for j = y-3, y+3 do
				stateIndex = mountainPicInState[stateData.stateInMap(i,j)] 
				if stateIndex and stateIndex == 3 then
					return subSpriteName(name ).."_"..stateIndex..".png",mapData:getObject().zhuzha
				end
			end
		end
		return subSpriteName(name )..".png",mapData:getObject().zhuzha
	end
end

-- 水
local function getWaterInfo( spriteType, name, wid )
	return subSpriteName(name ).."_1.png", mapData:getObject().waterLand
end

-- 1级的资源地，像沙地那种
local function getSandInfo( spriteType, name, wid )
	-- return subSpriteName(name ).."_1.png", mapData:getObject().waterAndSand
	local x, y = math.floor(wid/10000),wid%10000
	local stateIndex = sandPicInState[stateData.stateInMap(x,y)]
	if stateIndex then
		return subSpriteName(name ).."_"..stateIndex..".png",mapData:getObject().waterAndSand
	else
		return subSpriteName(name ).."_1.png", mapData:getObject().waterAndSand
	end
end

-- 水的过渡
local function getWaterEdgeInfo(spriteType, name, wid )
	-- return subSpriteName(name ).."_1.png", mapData:getObject().water_edge_1
	local x, y = math.floor(wid/10000),wid%10000
	local index = waterPicInState[stateData.stateInMap(x,y)]
	if index then
		return subSpriteName(name ).."_"..index..".png",mapData:getObject()["water_edge_"..index]
	else
		local new_index = nil
		-- 上直边
		if name == "water_11.png" or name == "water_12.png" or name == "water_51.png" or name == "water_83.png" then
			new_index = waterPicInState[stateData.stateInMap(x,y+1)]
		-- 下直边
		elseif name == "water_21.png" or name == "water_22.png" or name == "water_63.png" or name == "water_71.png" then
			new_index = waterPicInState[stateData.stateInMap(x,y-1)]
		-- 左直边
		elseif name == "water_31.png" or name == "water_32.png" or name == "water_53.png" or name == "water_73.png" then
			new_index = waterPicInState[stateData.stateInMap(x-1,y)]
		-- 右直边
		elseif name == "water_41.png" or name == "water_42.png" or name == "water_61.png" or name == "water_81.png" then
			new_index = waterPicInState[stateData.stateInMap(x+1,y)]
		elseif name == "water_52.png" or name == "water_92.png" then
			new_index = waterPicInState[stateData.stateInMap(x-1,y+1)]
		elseif name == "water_62.png" or name == "water_102.png" then
			new_index = waterPicInState[stateData.stateInMap(x+1,y-1)]
		elseif name == "water_72.png" or name == "water_112.png" then
			new_index = waterPicInState[stateData.stateInMap(x-1,y-1)]
		elseif name == "water_82.png" or name == "water_122.png" then
			new_index = waterPicInState[stateData.stateInMap(x+1,y+1)]
		end

		if not new_index then
			new_index = 2
		end

		return subSpriteName(name ).."_"..new_index..".png",mapData:getObject()["water_edge_"..new_index]
		-- if new_index == 1 then
		-- 	return subSpriteName(name ).."_"..new_index..".png",mapData:getObject().water_edge_1
		-- elseif new_index == 2 then
		-- 	return subSpriteName(name ).."_"..new_index..".png",mapData:getObject().water_edge_2
		-- else
		-- 	return subSpriteName(name ).."_"..new_index..".png",mapData:getObject().water_edge_2
		-- end
	end
end

-- 沙地的过渡
local function getSandEdgeInfo(spriteType, name, wid )
	-- return subSpriteName(name ).."_1.png", mapData:getObject().sand_edge_1
	local x, y = math.floor(wid/10000),wid%10000
	local index = sandPicInState[stateData.stateInMap(x,y)]
	if index then
		return subSpriteName(name ).."_"..index..".png",mapData:getObject()["sand_edge_"..index]
		-- if index ==1 then
		-- 	return subSpriteName(name ).."_"..index..".png",mapData:getObject().sand_edge_1
		-- else
		-- 	return subSpriteName(name ).."_"..index..".png",mapData:getObject().sand_edge_2
		-- end
	else
		return subSpriteName(name ).."_1.png", mapData:getObject().sand_edge_1
	end
end

-- 资源地
local function getResInfo(spriteType, name, wid )
	-- return subSpriteName(name ).."_1.png", mapData:getObject().sand_edge_1
	local x, y = math.floor(wid/10000),wid%10000
	local index = resPicInState[stateData.stateInMap(x,y)]
	if index and index == 3 then
		return subSpriteName(name ).."_"..index..".png",mapData:getObject().resLayer_3
		-- if index ==1 then
		-- 	return subSpriteName(name ).."_"..index..".png",mapData:getObject().sand_edge_1
		-- else
		-- 	return subSpriteName(name ).."_"..index..".png",mapData:getObject().sand_edge_2
		-- end
	else
		return subSpriteName(name ).."_1.png", mapData:getObject().resLayer
	end
end

local function getGrassConvertInfo( spriteType, name, wid )
	local x, y = math.floor(wid/10000),wid%10000
	local index = surfacePicInState[stateData.stateInMap(x,y)]
	if index then
		for i = x-2, x+2 do
			for j = y-2, y+2 do
				local stateIndex = surfacePicInState[stateData.stateInMap(i,j)]
				if not stateIndex then
					return subSpriteName(name ).."_"..index..".png",mapData:getObject().grass
				end
			end
		end
	else
		-- return subSpriteName(name ).."_1.png", mapData:getObject().grass
		local flag_index = nil
		local other_index = nil
		for i = x-2, x+2 do
			for j = y-2, y+2 do
				local temp_index = surfacePicInState[stateData.stateInMap(i,j)]
				if temp_index == 3 then
					flag_index = temp_index
				elseif not flag_index then
					flag_index = temp_index
				end
				
			end
			if flag_index then
				return subSpriteName(name ).."_"..flag_index..".png",mapData:getObject().grass
			end
		end
	end
	return false
end

local function getAdditionNodeInfo( spriteType, name, wid )
	local x, y = math.floor(wid/10000),wid%10000
	local index = resPicInState[stateData.stateInMap(x,y)]
	if index and index == 3 then
		return subSpriteName(name ).."_"..index..".png",mapData:getObject().zhuzha
	else
		return subSpriteName(name )..".png", mapData:getObject().zhuzha
	end
end

-- mapElement = {
-- 	GRASS_COVER = 1,
-- 	GRASS = 2,
-- 	QIULING = 3,
-- 	WATER = 4,
--  SAND,
-- 	SANDEAGE = 5,
-- 	WATEREAGE = 6,
-- 	LOW_RES = 8,
-- 	RES = 9,
-- 	EXPAND = 10,
-- 	WALL_HIDE = 11,
-- 	BUILDING = 12,
-- 	OUTSIDE_VIEW = 14,
-- 	BETWEENNODE = 15,
-- 	MOUNTAIN = 16,
-- 	ADDITION = 17,
-- 	YUANJUN = 18,
-- 	FARMING = 19,	
-- 	FOG = 20,
-- 	FOGEAGE = 21,
-- 	TRAINING = 22,
-- }
function MapSpriteManage.getSpirteNameAndParent(spriteType, name, wid )
	if spriteType == mapElement.GRASS_COVER then
		return getGrassInfo(spriteType, name, wid )
		-- return name, mapData:getObject().grass
	elseif spriteType == mapElement.GRASS then
		return getGrassInfo(spriteType, name, wid )
		-- return name, mapData:getObject().grass
	elseif spriteType == mapElement.QIULING then
		return getHillInfo(spriteType, name, wid )
		-- return name, mapData:getObject().grass
	elseif spriteType == mapElement.WATER then
		return getWaterInfo( spriteType, name, wid )
		-- return name, mapData:getObject().waterAndSand
	elseif spriteType == mapElement.SAND then
		return getSandInfo( spriteType, name, wid )
		-- return name, mapData:getObject().waterAndSand
	elseif spriteType == mapElement.SANDEAGE then
		return getSandEdgeInfo(spriteType, name, wid )
		-- return name, mapData:getObject().sand_edge_1
	elseif spriteType == mapElement.WATEREAGE then
		return getWaterEdgeInfo(spriteType, name, wid )
		-- return name, mapData:getObject().water_edge_1
	elseif spriteType == mapElement.LOW_RES then
		return name, mapData:getObject().battleRes 
	elseif spriteType == mapElement.RES or spriteType == mapElement.EXPAND then
		-- return name, mapData:getObject().resLayer
		return getResInfo(spriteType, name, wid )
	elseif spriteType == mapElement.WALL_HIDE then
		return name, mapData:getObject().wallHideNode 
	elseif spriteType == mapElement.BUILDING then
		return name, mapData:getObject().building
	elseif spriteType == mapElement.OUTSIDE_VIEW then
		return name, mapData:getObject().view_outsideNode
	elseif spriteType == mapElement.BETWEENNODE 
		or spriteType == mapElement.YUANJUN or spriteType == FARMING or spriteType == mapElement.FOG or spriteType == mapElement.FOGEAGE
		or spriteType == mapElement.TRAINING then
		return name, mapData:getObject().zhuzha
	elseif spriteType == mapElement.GRASS_EDGE then
		-- return name, mapData:getObject().grass
		return getGrassConvertInfo( spriteType, name, wid )
	elseif spriteType == mapElement.ADDITION then
		return getAdditionNodeInfo(spriteType, name, wid )
	elseif spriteType == mapElement.MOUNTAIN then
		return getMountainInfo( spriteType, name, wid )
	end
end

function MapSpriteManage.getResColorName(wid, name )
	if name and string.sub(name,1,3) == "low" then
		return name
	end
	local x, y = math.floor(wid/10000),wid%10000
	local index = resPicInState[stateData.stateInMap(x,y)]
	if index and index == 3 then
		return subSpriteName(name ).."_3.png"
	else
		return subSpriteName(name ).."_1.png"
	end
end

function MapSpriteManage.getResParentLayer( wid )
	local x, y = math.floor(wid/10000),wid%10000
	local index = resPicInState[stateData.stateInMap(x,y)]

	if index and index == 3 then
		return mapData:getObject().resLayer_3
	else
		return mapData:getObject().resLayer
	end
end

function MapSpriteManage.getSurfaceIndex( wid )
	local x, y = math.floor(wid/10000),wid%10000
	return surfacePicInState[stateData.stateInMap(x,y)]
end

return MapSpriteManage