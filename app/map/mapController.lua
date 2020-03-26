local MapController = class("MapController")

local size = 1501
local offset = {x=0,y=0}

local actionTable = {} --所有在闪烁的地

local MOVE_UP = 1
local MOVE_DOWN = 2
local MOVE_LEFT = 3
local MOVE_RIGHT = 4

function MapController:ctor()

end


function MapController:additionMap(posX, posY, coorX, coorY, i, j )
	if i < 1 or i > size or j < 1 or j > size then return end
	local w = 200
	local h = 100
	local rect
	if not terrain.isInMap(i,j) then return end
	local locationX, locationY = util.getMapSpritePos(posX,posY, coorX,coorY, i,j) 
	if terrain.returnTerrain(i,j) =="1" then
		rect = "water.png"
		local tag = mapData:getTagFunction(i,j, mapElement.WATER)
		if not MapNodeData.getWaterNode()[tag] then
			local name,parent = MapSpriteManage.getSpirteNameAndParent(mapElement.WATER, rect, i*10000+j)
			local pWaterSprite = MapSpriteManage.popSprite(mapElement.WATER, name, parent)
			MapNodeData.addWaterNode(pWaterSprite,tag,name)
			pWaterSprite:setAnchorPoint(cc.p(0,0))
			pWaterSprite:setPosition(cc.p(locationX, locationY))
			pWaterSprite:setVisible(true)
			pWaterSprite:setTag(tag)
			parent:reorderChild(pWaterSprite,tag)
		end
	end

	--沙地现在和水的边缘放在同一层
	if resourceData.resourceLevel(i,j) == 11 then
		local tag = mapData:getTagFunction(i,j,mapElement.WATER)
		if not MapNodeData.getWaterNode()[tag] then
			local name,parent = MapSpriteManage.getSpirteNameAndParent(mapElement.SAND, "sand.png", i*10000+j)
			local pWaterSprite = MapSpriteManage.popSprite(mapElement.WATER, name, parent)
			MapNodeData.addWaterNode(pWaterSprite,tag,name)
			pWaterSprite:setAnchorPoint(cc.p(0,0))
			pWaterSprite:setPosition(cc.p(locationX, locationY))
			pWaterSprite:setVisible(true)
			pWaterSprite:setTag(tag)
			parent:reorderChild(pWaterSprite,tag)
		end
		MapController:addWaterEdge(2,2*i-1, 2*j-1, 50, 50,locationX, locationY, 3)
		MapController:addWaterEdge(2,2*i-1, 2*j, 100, 75,locationX, locationY,1)
		MapController:addWaterEdge(2,2*i, 2*j-1, 100, 25,locationX, locationY,2)
		MapController:addWaterEdge(2,2*i, 2*j, 150, 50,locationX, locationY,4)
	end

	if terrain.isWaterTerrain(i,j) then
		MapController:addWaterEdge(1,2*i-1, 2*j-1, 50, 50,locationX, locationY, 3)
		MapController:addWaterEdge(1,2*i-1, 2*j, 100, 75,locationX, locationY,1)
		MapController:addWaterEdge(1,2*i, 2*j-1, 100, 25,locationX, locationY,2)
		MapController:addWaterEdge(1,2*i, 2*j, 150, 50,locationX, locationY,4)
	end

	-- addQiuLin(locationX, locationY,i,j)
end

function MapController:addWaterEdge(pngtype,coorX, coorY, posX, posY,localX, localY,index)
	local count = 0
	local isFix = nil
	if pngtype == 1 then
		isFix = terrain.isSmallWater
	else
		isFix = terrain.isSmallSand
	end

	for i=coorX-1, coorX+1 do
		for j = coorY-1, coorY + 1 do
			if not isFix(i, j) then
				count = count + 1
			end
		end
	end

	local function addEdge(x, y, imageIndex)
		local posx, posy = nil, nil
		local tag = nil
		if pngtype == 1 then
			tag = mapData:getTagFunction(x, y, mapElement.WATEREAGE)
			if MapNodeData.getWaterEdgeNode()[tag] then return end
		else
			tag = mapData:getTagFunction(x, y, mapElement.SANDEAGE)
			if MapNodeData.getSandEdgeNode()[tag] then return end
		end
		--上下夹角
		if imageIndex == 421 then
			posx, posy = localX+100, localY
		--左右夹角
		elseif imageIndex == 431 then
			posx, posy = localX, localY + 50
		else
			posx, posy = util.getMapSpritePos(localX+posX,localY+posY, coorX,coorY, x,y, 100, 50  )
		end
		
		local image = nil
		local parent_node,realName = nil,nil
		if pngtype == 1 then
			image =terrain.returnCCRectAndPos(imageIndex)
		else
			image =terrain.returnSandCCRectAndPos(imageIndex)
		end
		if not image then return end
		local waterEdge = nil
		-- cc.SpriteFrameCache:getInstance():addSpriteFrames("gameResources/map/smallwater.plist")
		-- local waterEdge= cc.Sprite:createWithSpriteFrameName(image)
		if pngtype == 1 then
			realName ,parent_node = MapSpriteManage.getSpirteNameAndParent(mapElement.WATEREAGE, image, math.ceil(x/2)*10000+math.ceil(y/2) )
			waterEdge = MapSpriteManage.popSprite(mapElement.WATEREAGE, realName, parent_node)
			MapNodeData.addWaterEdgeNode(waterEdge,tag,realName)
		else
			realName ,parent_node = MapSpriteManage.getSpirteNameAndParent(mapElement.SANDEAGE, image, math.ceil(x/2)*10000+math.ceil(y/2) )
			waterEdge = MapSpriteManage.popSprite(mapElement.SANDEAGE, realName, parent_node)
			MapNodeData.addSandEdgeNode(waterEdge,tag,realName)
		end
		waterEdge:setAnchorPoint(cc.p(0.5, 0.5))
		waterEdge:setPosition(cc.p(posx,posy))
		waterEdge:setTag(tag)
		parent_node:reorderChild(waterEdge,tag)
		waterEdge:setVisible(true)
	end

	local quejiao = {
					{{coorX-1, coorY},{coorX, coorY},{coorX, coorY+1}},
					{{coorX, coorY-1},{coorX, coorY},{coorX+1, coorY}},
					{{coorX-1, coorY},{coorX, coorY},{coorX, coorY-1}},
					{{coorX, coorY+1},{coorX, coorY},{coorX+1, coorY}},
				}


	local function zhibianIndex( _index, k )
		return (k==1 and 3*100+_index*10+1) or 3*100+_index*10+2
	end

	--直边
	if count == 3 then
		--左直边
		if not isFix(coorX-1, coorY) then
			addEdge(coorX,coorY, zhibianIndex( 3,(coorX+coorY)%2+1))
		--上直边
		elseif not isFix(coorX, coorY+1) then
			addEdge(coorX,coorY, zhibianIndex( 1,(coorX+coorY)%2+1))
		--右直边
		elseif not isFix(coorX+1, coorY) then
			addEdge(coorX,coorY, zhibianIndex( 4,(coorX+coorY)%2+1))
		--下直边
		elseif not isFix(coorX, coorY-1) then
			addEdge(coorX,coorY, zhibianIndex( 2,(coorX+coorY)%2+1))
		end
	--缺角
	elseif count == 1 then
		for i = 1 ,3 do
			addEdge(quejiao[index][i][1], quejiao[index][i][2], count*100+index*10+i)
		end
	--转角
	elseif count == 5 then
		addEdge(coorX,coorY, count*100+index*10+2)
	--上下夹角
	elseif count == 4 and index == 2 then
		if pngtype == 2 and terrain.isWaterTerrain(math.ceil(coorX/2),math.ceil(coorY/2)-1) then
			return
		end
		addEdge(coorX,coorY, count*100+index*10+1)
	--左右夹角
	elseif count == 4 and index == 3 then
		if pngtype == 2 and terrain.isWaterTerrain(math.ceil(coorX/2),math.ceil(coorY/2)-1) then
			return
		end
		addEdge(coorX,coorY, count*100+index*10+1)
	end
end

function MapController:addObjecBySort(confirm, x, y,coorX, coorY,posX, posY, dis, fangxiang)
	local locationX, locationY = nil,nil
	local npcCity = nil
	local view_str = nil
	local wall_str = nil
	local coorx, coory = nil, nil
	local area = 9
	local centerX, centerY = nil--area*x-4, area*y-4
	for i=x , y do
		if fangxiang then
			if not mapData:getLoadedMapLayer(i, confirm) then
				MapController:additionMap(posX, posY, coorX, coorY, i, confirm)
				MapController:addGrass(dis,posX, posY, coorX, coorY,i,confirm)
			end
			MapController:addTopObject(posX, posY, coorX, coorY, i, confirm)
			locationX, locationY = util.getMapSpritePos(posX,posY, coorX,coorY, i, confirm)
			MapController:addRes(locationX, locationY, i, confirm)
			MapController:addGrassEdge( locationX, locationY, i, confirm )
			coorx, coory = i, confirm
		else
			if not mapData:getLoadedMapLayer(confirm, i) then
				MapController:additionMap(posX, posY, coorX, coorY, confirm, i)
				MapController:addGrass(dis,posX, posY, coorX, coorY,confirm,i)
			end
			MapController:addTopObject(posX, posY, coorX, coorY, confirm, i)
			locationX, locationY = util.getMapSpritePos(posX,posY, coorX,coorY, confirm, i)
			MapController:addRes(locationX, locationY, confirm, i)
			MapController:addGrassEdge( locationX, locationY, confirm, i)
			coorx, coory = confirm, i
		end
		-- npcCity = Tb_cfg_world_city[coorx*10000+coory]
		-- centerX, centerY = area*coorx-4, area*coory-4
		-- if npcCity then
		-- 	if not MapNodeData.getBuildingNode()[mapData.getTagFunction(centerX, centerY, mapElement.BUILDING)] then--(not mapData.getCityComponentData(i, confirm)) then
		-- 		addBuilding(coorx, coory,CityComponentType.getMainCityView(coorx, coory),CityComponentType.getWallLevelData(coorx, coory))
		-- 	end
		-- else
		-- 	view_str = mapData.getBuildingView(coorx, coory )
		-- 	wall_str = mapData.getBuildingWall(coorx, coory )
		-- 	if view_str and wall_str then
		-- 		if view_str == CityComponentType.getFengchengView() or view_str == CityComponentType.getOutsideBuildingView() or view_str == CityComponentType.getTotalRuinsView() then
		-- 			if not MapNodeData.getBetweenMountainNode()[mapData.getTagFunction(centerX, centerY, mapElement.BETWEENNODE)] then
		-- 				addBuilding(coorx, coory,view_str, wall_str)
		-- 			end
		-- 		else
		-- 			if not MapNodeData.getBuildingNode()[mapData.getTagFunction(centerX, centerY, mapElement.BUILDING)] 
		-- 				and not MapNodeData.getOutsideViewNode()[mapData.getTagFunction(centerX, centerY, mapElement.OUTSIDE_VIEW)]  then
		-- 				addBuilding(coorx, coory,view_str, wall_str)
		-- 			end
		-- 		end
		-- 	end
		-- end
		-- if groud_army_background then
		-- 	mapController.addGroudBackgroundImage(coorx, coory)
		-- end
	end
end

function MapController:addGrass(isMove,posX, posY,coorX, coorY, i, j )
	local yuX  = i%3
	local yuY  = j%3
	local realX, realY = nil, nil
	realX = i
	realY = j

	if yuX == 1 then
		realX = i+1
	elseif yuX == 0 then
		realX = i-1
	end

	if yuY == 1 then
		realY = j+1
	elseif yuY == 0 then
		realY = j-1
	end

	local tag = mapData:getTagFunction(realX,realY,mapElement.GRASS)
	if MapNodeData.getGrassNode()[tag] then return end
	local locationX, locationY = util.getMapSpritePos(posX,posY, coorX,coorY, realX,realY)	
	local name, parent = MapSpriteManage.getSpirteNameAndParent(mapElement.GRASS, "dibiao.png", realX*10000+realY )
	local sprite = MapSpriteManage.popSprite(mapElement.GRASS, name, parent)
	sprite:setPosition(cc.p(locationX+100,locationY+50))
	MapNodeData.addGrassNode(sprite, tag, name)
	sprite:setVisible(true)
	sprite:setTag(tag)
	parent:reorderChild(sprite, tag)
end

function MapController:addRes( posX, posY, i, j )
	local object = mapData.getObject()
	-- local relation = mapData.getRelation(i,j)
	local w = 200
	local h = 100
	local rect
	local res = resourceData.resourceLevel(i,j)
	local battle_res = stateData.getBattleResourceLevel(i*10000+j)
	
	if not res then return end
	
	-- if object.resLayer:getChildByTag(mapData.getTagFunction(i,j)) then return end
	if MapNodeData.getResourceNode()[mapData:getTagFunction(i,j, mapElement.RES)] then return end
	if MapNodeData.getBattleResourceNode()[mapData:getTagFunction(i,j, mapElement.LOW_RES)] then return end
	-- if not res or (not terrain.returnTerrain(i,j)) or terrain.isWaterTerrain(i,j)
	-- 	or terrain.isMountain(i,j) or (Tb_cfg_world_city[i*10000+j] and not battle_res) then return end

	if (res == 12 or res == 36) and not battle_res then
		return 
	end

	local sprite
	if res ==11 and not battle_res then
		
	else
		local tag  = nil
		local partent = nil
		if battle_res then
			rect = "battle_resource_"..battle_res
			tag = mapData:getTagFunction(i,j,mapElement.LOW_RES)
			local name, parentNode = MapSpriteManage.getSpirteNameAndParent(mapElement.LOW_RES, rect..".png", i*10000+j )
			sprite = MapSpriteManage.popSprite(mapElement.LOW_RES, name, parentNode)
			partent = parentNode
			MapNodeData.addBattleResourceNode(sprite,tag, name)
		else
			rect = "land_"..res
			tag = mapData:getTagFunction(i,j,mapElement.RES)
			local name, parentNode = MapSpriteManage.getSpirteNameAndParent(mapElement.RES, rect..".png", i*10000+j )
			sprite = MapSpriteManage.popSprite(mapElement.RES, name, parentNode)
			partent = parentNode
			MapNodeData.addResourceNode(sprite,tag, name)
		end
		sprite:setAnchorPoint(cc.p(0.5,0))
		sprite:setPosition(cc.p(posX+100, posY))
		sprite:setVisible(true)
		sprite:setTag(tag)
		partent:reorderChild(sprite, tag)

		-- if res >= 50 and res < 60 then
		-- 	setLevel5Animation(i,j )
		-- end

		if res <61 or res >84 then return end
	end
end

function MapController:addGrassEdge( posX, posY, i, j )
	local region_index = nil
	local tag = mapData:getTagFunction(i,j,mapElement.GRASS_EDGE)
	if MapNodeData.getEdgeNode()[tag] then
		return
	end

	local name, parentNode = MapSpriteManage.getSpirteNameAndParent(mapElement.GRASS_EDGE, "state_edge.png", i*10000+j )

	if not name then
		return
	end

	if name ~= "state_edge_3.png" then
		local sprite = MapSpriteManage.popSprite(mapElement.GRASS_EDGE, name, parentNode)
		local partent = parentNode
		MapNodeData.addEdgeNode(sprite,tag, name)
		sprite:setAnchorPoint(cc.p(0.5,0.5))
		sprite:setPosition(cc.p(posX+100, posY+50))
		sprite:setVisible(true)
		sprite:setTag(tag)
		partent:reorderChild(sprite, tag)
	end

	local smooth_name = nil
	if name == "state_edge_3.png" then
		smooth_name = "smooth_3.png"
	else
		smooth_name = "smooth_1.png"
	end

	local flag = nil
	for m = i-2, i+2 do
		for n = j-2, j+2 do
			-- 水
			if terrain.returnTerrain(m,n) == "1" then
				flag = true
				return
			end
		end
	end

	if terrain.returnTerrain(i,j) ~="1" and smooth_name then
		local sprite_smooth = nil
		local tag = nil
		if smooth_name == "smooth_1.png" then
		 	tag = mapData:getTagFunction(i,j,mapElement.GRASS_EDGE_SMOOTH)
			sprite_smooth = MapSpriteManage.popSprite(mapElement.GRASS_EDGE_SMOOTH, smooth_name, parentNode)
			MapNodeData.addSmoothEdgeNode(sprite_smooth,tag, name)
		else
			tag = mapData:getTagFunction(i,j,mapElement.GRASS_EDGE_SMOOTH_SNOW)
			sprite_smooth = MapSpriteManage.popSprite(mapElement.GRASS_EDGE_SMOOTH_SNOW, smooth_name, parentNode)
			MapNodeData.addSmoothSnowEdgeNode(sprite_smooth,tag, name)
		end
		
		local partent = parentNode
		sprite_smooth:setAnchorPoint(cc.p(0.5,0.5))
		sprite_smooth:setPosition(cc.p(posX+100, posY+50))
		sprite_smooth:setVisible(true)
		sprite_smooth:setTag(tag)
		partent:reorderChild(sprite_smooth, tag)
	end

end

function MapController:addTopObject( posX, posY, coorX, coorY, i, j)
	local tag = mapData:getTagFunction(i,j, mapElement.FOG)
	if MapNodeData.getSurfaceNode()[tag] then return end
	if not terrain.isInMap(i,j) then return end
	local arrFogData = WarFogData.getAllFogData()
	local rect = "grass.png"

	local locationX, locationY = util.getMapSpritePos(posX,posY, coorX,coorY, i,j)
	local name, parent = MapSpriteManage.getSpirteNameAndParent(mapElement.FOG, rect, i*10000+j )
	local sprite = MapSpriteManage.popSprite(mapElement.FOG, name, parent)
	sprite:setTag(tag)
	parent:reorderChild(sprite, tag)
	MapNodeData.addSurfaceNode(sprite,tag, name)
	if arrFogData[i*10000+j] then
		sprite:setVisible(false)
	else
		sprite:setVisible(true)
	end
	sprite:setAnchorPoint(cc.p(0,0))
	sprite:setPosition(cc.p(locationX, locationY))
	MapController:addMountain(posX, posY, coorX, coorY, i, j)
end

function MapController:addMountain( posX, posY, coorX, coorY, i, j)
	local w = 200
	local h = 100
	local rect
	local v = terrain.isMountain(i,j)
	local cityChild
	local hillSprite

	if v and (v =="1" or v =="2" or v =="3" or v == "4" or v == "5" or v == "6") then
		if v =="2" then
			if i%2 == 0 then
				rect = "hill5.png"
			else
				rect = "hill2.png"
			end
		elseif v== "3" then
			if i%2 == 0 then
				rect = "hill3.png"
			else
				rect = "hill4.png"
			end
		else
			rect = "hill1.png"
		end

		-- 是否是过渡的1x1山,往右偏
		local oneSquareRight = nil--v == "5"
		-- 是否是过渡的1x1山,往下偏
		local oneSquareDown = nil--v == "4"

		if v == "4" then
			oneSquareRight = true
		elseif v == "5" then
			oneSquareDown = true
		-- 6代表都有
		elseif v == "6" then
			oneSquareRight = true
			oneSquareDown = true
		end

		if v == "2" or v== "3" or (not oneSquareDown and not oneSquareRight) then--"b4" or v== "B5" or v== "9" or v=="b4#" or v=="B5#" then
			local zorder = nil

			local tag = mapData:getTagFunction(i,j,mapElement.MOUNTAIN)
			if MapNodeData.getMountainNode()[tag] then return end
			zorder = mapData:getTagFunction(i,j,mapElement.MOUNTAIN)
			local name, parent  = MapSpriteManage.getSpirteNameAndParent(mapElement.MOUNTAIN, rect, i*10000+j )
			hillSprite = MapSpriteManage.popSprite(mapElement.MOUNTAIN, name, parent)
			local sprite = mapData:getLoadedMapLayer(i,j)
			if sprite then
				MapNodeData.addMountainNode(hillSprite, tag, name)
				hillSprite:setAnchorPoint(cc.p(0.5, hillSprite:getContentSize().width/4/hillSprite:getContentSize().height))
					
				if v== "2" then
					hillSprite:setPosition(cc.p(sprite:getPositionX()+200, sprite:getPositionY()+50))
				elseif v== "3" then
					hillSprite:setPosition(cc.p(sprite:getPositionX()+300, sprite:getPositionY()+50))
				elseif v == "1" then
					hillSprite:setAnchorPoint(cc.p(0, 0))
					hillSprite:setPosition(cc.p(sprite:getPositionX(), sprite:getPositionY()))
				end
				hillSprite:setTag(tag)
				parent:reorderChild(hillSprite, zorder)
				hillSprite:setVisible(true)
			end
		end

		local otherSprite = nil
		local temp_x, temp_y = nil, nil
		if oneSquareDown then
			local tag = mapData:getTagFunction(i,j,mapElement.MOUNTAIN)
			otherSprite = MapNodeData.getMountainNode()[tag]--object.city:getChildByTag(tag)

			temp_x, temp_y = util.getMapSpritePos(posX+ 50,-25+posY, coorX,coorY, i,j)
			if not otherSprite then
				local name, parent  = MapSpriteManage.getSpirteNameAndParent(mapElement.MOUNTAIN, "hill1.png", i*10000+j )
				hillSprite = MapSpriteManage.popSprite(mapElement.MOUNTAIN, name, parent)
				MapNodeData.addMountainNode(hillSprite, tag, name)

				hillSprite:setAnchorPoint(cc.p(0, 0))
				hillSprite:setPosition(cc.p(temp_x, temp_y))
				hillSprite:setVisible(true)
				parent:reorderChild(hillSprite, tag)
				hillSprite:setTag(tag)
			else
			end
		end

		if oneSquareRight then
			local tag = mapData:getTagFunction(i,j,mapElement.MOUNTAIN)
			otherSprite = MapNodeData.getMountainNode()[tag] --object.city:getChildByTag(mapData.getTagFunction(i,j))
			if not otherSprite then
				local name, parent  = MapSpriteManage.getSpirteNameAndParent(mapElement.MOUNTAIN, "hill1.png", i*10000+j )
				hillSprite = MapSpriteManage.popSprite(mapElement.MOUNTAIN, name, parent)
				MapNodeData.addMountainNode(hillSprite, tag, name)

				temp_x, temp_y = util.getMapSpritePos(posX+ 50,25+posY, coorX,coorY, i,j)
				hillSprite:setPosition(cc.p(temp_x, temp_y))
				hillSprite:setAnchorPoint(cc.p(0, 0))
				hillSprite:setVisible(true)
				parent:reorderChild(hillSprite, tag)
				hillSprite:setTag(tag)
			else
			end
		end
	end
end

function MapController:addMap(posX, posY, coorX, coorY )
    local addMapTimesX, addMapTimesY = util.getAddMapTimes()
	local row_up = (coorX - addMapTimesX > 0 and coorX - addMapTimesX) or 1
	local row_down = (coorX + addMapTimesX < size and coorX + addMapTimesX) or size
	local col_left = (coorY - addMapTimesY  >0 and coorY - addMapTimesY) or 1
	local col_right = (coorY + addMapTimesY  < size and coorY + addMapTimesY) or size
	for i = row_up, row_down do
		MapController:addObjecBySort(i, col_left, col_right, coorX, coorY, posX, posY )
	end

	mapData:setMapArea(row_up, row_down, col_left, col_right)
end

--每次移动判断应该向哪个方向增加地图 todo
function MapController:addMapWhenMove(offsetX, offsetY, posX, posY, coorX, coorY )
	local mapArea
	local rang = 1
	local addX, addY = util.getAddMapTimes()
	offset.x = offset.x + offsetX
	offset.y = offset.y + offsetY
	while offset.x <=-rang do
		mapArea = mapData:getMapArea()
		local up, down = mapArea.row_up, mapArea.row_down
		if mapArea.row_up - 1 >= 1 then 
			MapController:addObjecBySort(mapArea.row_up-1, mapArea.col_left, mapArea.col_right,coorX, coorY,posX, posY, MOVE_UP)
			up = mapArea.row_up - 1

			if coorX + addX <= size then
				for j= mapArea.col_left, mapArea.col_right do
					MapController:removeGrass( mapArea.row_down, j, MOVE_DOWN)
					MapController:removeAdditionMap(mapArea.row_down, j)
					down = mapArea.row_down-1
				end
			end
			mapData:setMapArea(up, down, mapArea.col_left, mapArea.col_right)
		end
		offset.x = offset.x + rang
	end

	while offset.x >= rang do
		mapArea = mapData:getMapArea()
		local up, down = mapArea.row_up, mapArea.row_down
		if mapArea.row_down + 1 <= size then
			MapController:addObjecBySort(mapArea.row_down+1, mapArea.col_left, mapArea.col_right,coorX, coorY,posX, posY,MOVE_DOWN  )
			down = mapArea.row_down+1

			-- if (mapArea.row_down+1) - (mapArea.row_up+1) >= 2*addX then
			if coorX - addX >= 1 then
				for j= mapArea.col_left, mapArea.col_right do
					MapController:removeGrass( mapArea.row_up, j,MOVE_UP)
					MapController:removeAdditionMap(mapArea.row_up, j)
					up = mapArea.row_up+1
				end
			end
			mapData:setMapArea(up, down, mapArea.col_left, mapArea.col_right)
		end
		offset.x = offset.x - rang
	end

	while offset.y <=-rang do
		mapArea = mapData:getMapArea()
		local left, right = mapArea.col_left, mapArea.col_right
		if mapArea.col_left - 1 >= 1 then
			MapController:addObjecBySort(mapArea.col_left-1, mapArea.row_up, mapArea.row_down,coorX, coorY,posX, posY,MOVE_LEFT,true  )
			left = mapArea.col_left-1

			if coorY + addY <= size then
				for i= mapArea.row_up, mapArea.row_down do
					MapController:removeGrass( i, mapArea.col_right,MOVE_RIGHT)
					MapController:removeAdditionMap(i, mapArea.col_right)
				end
				right = mapArea.col_right-1
			end
			mapData:setMapArea(mapArea.row_up, mapArea.row_down, left, right)
		end
		offset.y = offset.y +rang
	end

	while offset.y >=rang do
		mapArea = mapData:getMapArea()
		local left, right = mapArea.col_left, mapArea.col_right
		if mapArea.col_right + 1 <= size then
			MapController:addObjecBySort(mapArea.col_right+1, mapArea.row_up, mapArea.row_down,coorX, coorY,posX, posY,MOVE_RIGHT,true  )
			right = mapArea.col_right+1

			if coorY - addY >= 1 then
				for i= mapArea.row_up, mapArea.row_down do
					MapController:removeGrass( i, mapArea.col_left, MOVE_LEFT)
					MapController:removeAdditionMap(i, mapArea.col_left)
				end
				left = mapArea.col_left+1
			end
			mapData:setMapArea(mapArea.row_up, mapArea.row_down, left, right)
		end
		offset.y = offset.y - rang
	end
end

function MapController:removeGrass(coorX,coorY,isMove)
	local yuX  = coorX%3
	local yuY  = coorY%3
	local realX, realY = nil, nil
	realX = coorX
	realY = coorY

	if yuX == 1 then
		realX = coorX+1
	elseif yuX == 0 then
		realX = coorX-1
	end

	if yuY == 1 then
		realY = coorY+1
	elseif yuY == 0 then
		realY = coorY-1
	end
	
	if (isMove == MOVE_UP and coorX%3 == 0) 
		or (isMove == MOVE_DOWN and coorX%3==1 )
		or (isMove == MOVE_LEFT and coorY%3 == 0) 
		or (isMove == MOVE_RIGHT and coorY%3 == 1) then
		local tag = mapData:getTagFunction(realX, realY, mapElement.GRASS)
		local temp = MapNodeData.getGrassNode()[tag] 
		if temp then
			-- mapData.getObject().grass:removeChild(temp,true)
			MapNodeData.removeGrassNode(tag)
		end
	end
end

--删除多余的地图
function MapController:removeAdditionMap(coorX, coorY)
	local loadSprite, spr_type = mapData:getLoadedMapLayer(coorX, coorY)
	if loadSprite then
		local flag  = false
		for i, v in pairs (actionTable) do
			if coorX*10000+coorY == v.wid then
				flag = true
				break
			end
		end
		if flag then
			for i, v in pairs(actionTable) do
				v.sprite:removeFromParent(true)
			end
			actionTable = {}
		end

		local tag = mapData:getTagFunction(coorX,coorY, mapElement.WATER)
		local water = MapNodeData.getWaterNode()[tag]
		if water then
			MapNodeData.removeWaterNode(tag)
		end


		--这个应该是基本的格子，现在是战争迷雾的显示格子
		tag = mapData:getTagFunction(coorX,coorY, mapElement.FOG)
		local surface = MapNodeData.getSurfaceNode()[tag]
		if surface then
			MapNodeData.removeSurfaceNode(tag)
		end
		--删除山脉
		tag = mapData:getTagFunction(coorX,coorY, mapElement.MOUNTAIN)
		local city = MapNodeData.getMountainNode()[tag] 
		if city then
			MapNodeData.removeMountainNode(tag)
		end
		-- todo
		MapController:removeRes(coorX, coorY)
		MapController:removeQiulin(coorX, coorY)
		MapController:removeGrassEdge(coorX, coorY )
	end
end

--删除资源
function MapController:removeRes(coorX, coorY )
	local tag = mapData:getTagFunction(coorX, coorY, mapElement.RES)
	local res = MapNodeData.getResourceNode()[tag] 
	if res and res[1]:getChildrenCount() == 0 then
		MapNodeData.removeResourceNode(tag)
	end

	local tag = mapData:getTagFunction(coorX, coorY, mapElement.LOW_RES)
	local res = MapNodeData.getBattleResourceNode()[tag]
	if res and res[1]:getChildrenCount() == 0 then
		MapNodeData.removeBattleResourceNode(tag)
	end
end

function MapController:removeQiulin(coorX, coorY )
	local tag = mapData:getTagFunction(coorX, coorY, mapElement.QIULING)
	local qiulin = MapNodeData.getQiuLingNode()[tag]
	if qiulin then
		MapNodeData.removeQiuLingNode(tag)
	end
end

function MapController:removeGrassEdge(coorX, coorY )
	local tag = mapData:getTagFunction(coorX, coorY, mapElement.GRASS_EDGE)
	MapNodeData.removeEdgeNode(tag)

	local tag = mapData:getTagFunction(coorX, coorY, mapElement.GRASS_EDGE_SMOOTH)
	MapNodeData.removeSmoothEdgeNode(tag)

	local tag = mapData:getTagFunction(coorX, coorY, mapElement.GRASS_EDGE_SMOOTH_SNOW)
	MapNodeData.removeSmoothSnowEdgeNode(tag)
end

return MapController