local MapData = class("MapData")

local mTouchLayer = nil
local mRootLayer = nil
local mObjectArray = nil

local mapElement_index = 0

local add_index = function ( )
	mapElement_index = mapElement_index + 1
	return mapElement_index
end
cc.exports.mapElement = {}
mapElement.GRASS_COVER = add_index()
mapElement.GRASS = add_index()
mapElement.GRASS_EDGE = add_index()
mapElement.GRASS_EDGE_SMOOTH = add_index()
mapElement.GRASS_EDGE_SMOOTH_SNOW = add_index()
mapElement.QIULING = add_index()
mapElement.WATER = add_index()
mapElement.SAND = add_index()
mapElement.SANDEAGE = add_index()
mapElement.WATEREAGE = add_index()
mapElement.LOW_RES = add_index()
mapElement.RES = add_index()
mapElement.EXPAND = add_index()
mapElement.WALL_HIDE = add_index()
mapElement.BUILDING = add_index()
mapElement.OUTSIDE_VIEW = add_index()
mapElement.BETWEENNODE = add_index()
mapElement.MOUNTAIN = add_index()
mapElement.ADDITION = add_index()
mapElement.YUANJUN = add_index()
mapElement.FARMING = add_index()
mapElement.FOG = add_index()
mapElement.FOGEAGE = add_index()
mapElement.TRAINING = add_index()


-- 不同大图要重新计算，同一张大图往下加一,对应的index，用于计算唯一tag
local mapElementToIndex = {}
mapElementToIndex[mapElement.GRASS_COVER] = 1
mapElementToIndex[mapElement.GRASS] = 2
mapElementToIndex[mapElement.GRASS_EDGE] = 3
mapElementToIndex[mapElement.GRASS_EDGE_SMOOTH] = 4
mapElementToIndex[mapElement.GRASS_EDGE_SMOOTH_SNOW] = 5
mapElementToIndex[mapElement.QIULING] = 6

mapElementToIndex[mapElement.WATER] = 1
mapElementToIndex[mapElement.SAND] = 2

mapElementToIndex[mapElement.SANDEAGE] = 1
mapElementToIndex[mapElement.WATEREAGE] = 2

mapElementToIndex[mapElement.LOW_RES] = 1

mapElementToIndex[mapElement.RES] = 1
mapElementToIndex[mapElement.EXPAND] = 2

mapElementToIndex[mapElement.WALL_HIDE] = 1
mapElementToIndex[mapElement.BUILDING] = 2
mapElementToIndex[mapElement.OUTSIDE_VIEW] = 3

mapElementToIndex[mapElement.BETWEENNODE] = 1
mapElementToIndex[mapElement.MOUNTAIN] = 2
mapElementToIndex[mapElement.ADDITION] = 3
mapElementToIndex[mapElement.YUANJUN] = 4
mapElementToIndex[mapElement.FARMING] = 5
mapElementToIndex[mapElement.TRAINING] = 6
mapElementToIndex[mapElement.FOG] = 7
mapElementToIndex[mapElement.FOGEAGE] = 8

local area = {row_up = nil, row_down = nil, col_left = nil, col_right = nil} --加载了数据的范围
local mapArea = {row_up = nil, row_down = nil, col_left = nil, col_right = nil} --加载的地图范围
local size = 1501

function MapData:ctor()

end

function MapData:setTouchLayer( layer )
	mTouchLayer = layer
end

function MapData:setObject( objectInfo )
	mObjectArray = objectInfo
end

function MapData:getObject( )
	return mObjectArray
end

function MapData:getTagFunction( i,j,nodeType)
	return mapElementToIndex[nodeType]*100000000+i*10000-j
end


function MapData:getLoadedMapLayer(coorX, coorY )
	local sprite
	local spr_type = ""
	local spriteNode = nil
	if terrain.returnTerrain(coorX, coorY) =="1" or resourceData.resourceLevel(coorX, coorY) == 11 then
		spriteNode = MapNodeData.getWaterNode()[MapData:getTagFunction(coorX,coorY,mapElement.WATER)]
		if spriteNode then
			sprite = MapNodeData.getWaterNode()[MapData:getTagFunction(coorX,coorY,mapElement.WATER)][1]
			spr_type = "water"
		end
	else
		spriteNode = MapNodeData.getSurfaceNode()[MapData:getTagFunction(coorX,coorY,mapElement.FOG)]
		if spriteNode then
			sprite= MapNodeData.getSurfaceNode()[MapData:getTagFunction(coorX,coorY,mapElement.FOG)][1]
			spr_type = "node"
		end
	end
	if sprite then
		tolua.cast(sprite,"cc.Sprite")
		return sprite, spr_type
	end
	return nil
end

function MapData:setMapArea(row_up, row_down, col_left, col_right )
	mapArea.row_up = (row_up < 1 and 1) or row_up
	mapArea.row_down = (row_down > size and size) or row_down
	mapArea.col_left = (col_left < 1 and 1) or col_left
	mapArea.col_right = (col_right > size and size) or col_right
	print("test fo set map area", mapArea.col_right)
end

function MapData:getMapArea( )
	return mapArea
end

--请求地图信息
function MapData:requestMapData(coorX, coorY,isCity )
	local addMapTimesX, addMapTimesY = util.getAddMapTimes()
	local row_up = (coorX - addMapTimesX > 0 and coorX - addMapTimesX) or 1
	local row_down = (coorX + addMapTimesX <size and coorX + addMapTimesX) or size
	local col_left = (coorY - addMapTimesY  >0 and coorY - addMapTimesY) or 1
	local col_right = (coorY + addMapTimesY  < size and coorY + addMapTimesY) or size

	if not isCity then
		Net:send(netCmd.GET_WORLD_INFO_CMD, {row_up, row_down, col_left, col_right})
	else
		Net:send(netCmd.ENTER_CITY_CMD, {row_up, row_down, col_left, col_right})
	end
	-- loadingLayer.create(5)
	area = {row_up = row_up, row_down = row_down, col_left = col_left, col_right = col_right}

	-- tmp_cache_packet_from_server = nil
	-- tmp_tb_cache_packetPost_from_server = nil
end

function MapData:setRootLayer( layer )
	mRootLayer = layer
end

function MapData:getRealWid(tag )
	return tag%100000000
end

return MapData