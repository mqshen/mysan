
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

cc.exports.MAIN_SCENE = 1 --主场景
cc.exports.UI_SCENE = 10 --ui层
cc.exports.SLIDE_SCENE = 15 --滑动表现层

local locationX = nil  --起始坐标X
local locationY = nil  --起始坐标

local userData = require("app.data.userData"):create()
local mRootLayer = nil
local mLayer = nil
local mCompareLayer = nil
local mSmokeLayer = nil
local mNodeLayer = nil
local mBuildEffectLayer = nil
local mHasRunAction = false
local mAngle = 0

local touchBeginPoint = nil --单指触摸
local touchOrigPoint = {x=nil,y=nil}

local coorXEdge_up = nil
local coorXEdge_down = nil
local coorYEdge_left = nil
local coorYEdge_right = nil


local begin_move_x, begin_move_y = nil, nil
local isMove = false  --是否移动


--计算与菱形边平行方向偏移量
local function offset(starPos, endPos )
	local x = (starPos.x - endPos.x)
	local y = (starPos.y- endPos.y)
	return (x - 2*y)/200, (x+2*y)/200
end

--具体在哪个点 
local function touchInMap(x, y,angle )
	--a+(x-x1)/w-(y-y1)/h
	--b+(x-x1)/w+(y-y1)/h
	if not angle then angle = mAngle end
	local rootX,rootY = util.countNodeSpace(x,y,angle)
	local point= mLayer:convertToNodeSpace(cc.p(rootX,rootY))
	local coorX = math.floor(locationX+(point.x-0)/200-(point.y-50)/100)
	local coorY = math.floor(locationY+(point.x-0)/200+(point.y-50)/100)
	if coorX > 1501 or coorX <1 or coorY >1501 or coorY <1 then
		return nil,nil
	else
		return coorX, coorY
	end
end

--根据偏移量做图片的增加和删除
local function moveAccordingOffset(posX,posY )
	local coorX, coorY = touchInMap(display.width/2, display.height/2)
	if coorX and coorY then
		local loadSprite = mapData:getLoadedMapLayer(coorX, coorY)
		if loadSprite then
			local offsetX, offsetY = offset(touchBeginPoint,{x=posX, y=posY})
			-- miniMapManager.setMarkPos(coorX, coorY )
			mapController:addMapWhenMove(offsetX, offsetY,
					loadSprite:getPositionX(), loadSprite:getPositionY(),coorX, coorY)
		end
	end
end

local function touchPoint( x,y  )
	local rootX,rootY = util.countNodeSpace(x,y,mAngle)
	local point= mLayer:convertToNodeSpace(cc.p(rootX,rootY))
	local coorX = math.floor(locationX+(point.x-0)/200-(point.y-50)/100)
	local coorY = math.floor(locationY+(point.x-0)/200+(point.y-50)/100)
	return coorX, coorY
end


local function onTouchBegan(touches, isfinger)
	if #touches == 3 then
		local rootX,rootY = util.countNodeSpace(touches[1], touches[2],mAngle)
		touchOrigPoint = {x= rootX, y= rootY}
		local pointInLayer = mCompareLayer:convertToNodeSpace(cc.p(rootX,rootY))
		touchBeginPoint = { x = pointInLayer.x, y = pointInLayer.y}
		begin_move_x = mLayer:getPositionX()
		begin_move_y = mLayer:getPositionY()
	end
	return true
end

local function onTouchMoved(touches)
	if #touches == 3 then
		-- if multiTouchMove then
		-- 	return false
		-- end

		if not touchOrigPoint.x or (not touchBeginPoint.x) then return end
		local coorX, coorY = touchPoint(display.width/2, display.height/2)
		local rootX,rootY = util.countNodeSpace(touches[1], touches[2],mAngle)
		local pointInLayer = mCompareLayer:convertToNodeSpace(cc.p(rootX,rootY))
		
		local offsetX, offsetY = offset(touchBeginPoint,{x=pointInLayer.x, y=pointInLayer.y})
		if (coorX <=1 and offsetX < 0) or (coorX >=1501 and offsetX > 0) or (coorY <=1 and offsetY < 0) or (coorY >= 1501 and offsetY > 0) then
			return false
		end

		if coorXEdge_down and coorYEdge_right then
			if (coorX <= coorXEdge_up and offsetX < 0) or (coorX>=coorXEdge_down and offsetX > 0) or (coorY <= coorYEdge_left and offsetY < 0) or (coorY >= coorYEdge_right and offsetY > 0) then
				return false
			end
		end
		
		local orginPoint = mCompareLayer:convertToNodeSpace(cc.p(touchOrigPoint.x, touchOrigPoint.y))
		if math.abs(pointInLayer.x-touchBeginPoint.x) > 100 or math.abs(pointInLayer.y-touchBeginPoint.y) >100 then
			return false
		end
		
		if math.abs(pointInLayer.x-orginPoint.x) > 10 or math.abs(pointInLayer.y-orginPoint.y) > 10 then
			isMove  = true
		end

		local rootX,rootY = util.countNodeSpace(touches[1], touches[2],mAngle)
		local parentPoint = mLayer:getParent():convertToNodeSpace(cc.p(rootX, rootY))
		local parentbeginPoint = mLayer:getParent():convertToNodeSpace(cc.p(touchOrigPoint.x, touchOrigPoint.y))
		
		local m_pos_x = begin_move_x + (parentPoint.x - parentbeginPoint.x)
		local m_pos_y = begin_move_y + (parentPoint.y - parentbeginPoint.y)
		mLayer:setPosition(cc.p(m_pos_x ,m_pos_y))
		
		-- SmallMiniMap.coordToPicture()

		-- WarFog.setStencilPos(begin_move_x + (parentPoint.x - parentbeginPoint.x)-cx,
		-- 				begin_move_y + (parentPoint.y - parentbeginPoint.y)-cy)
		moveAccordingOffset(pointInLayer.x, pointInLayer.y)
		touchBeginPoint= {x= pointInLayer.x, y=pointInLayer.y}

		-- --是否一段时间没点击屏幕
		-- if touch then
		-- 	touch = false
		-- 	setHandler()
		-- else
		-- 	setHandler()
	    --     touch = true
		-- end

		-- if m_touchAnimation then
		-- 	mtouchAnimation = false
		-- 	animationTouchHandler( )
		-- else
		-- 	animationTouchHandler( )
		-- 	m_touchAnimation = true
		-- end
	end
end

local function onTouchEnded(touches, isfinger)
end

local function onTouch(eventType, x, y)
	print("touch")
	if eventType == "began" then
		-- multiTouch = true
		-- ObjectCountDown.setReleaseLockArmy()
		-- armyMark.removeLockScreenWhenTouch()
		-- mapMessageUI.setMapTouchHook(true)
        -- -- return onTouchBegan(touches)
        return onTouchBegan({x,y,eventType})
    elseif eventType == "moved" then
        return onTouchMoved({x,y,eventType},true)
    elseif eventType == "ended" then
    	-- mapMessageUI.setMapTouchHook(false)
        return onTouchEnded({x,y,eventType})
    else
    	return true
    end
end


function MainScene:onCreate()

	local lockCoorx, lockCoory = math.floor(userData:getMainPos()/10000), userData:getMainPos()%10000
	locationX ,locationY = lockCoorx, lockCoory

    local rootLayer = cc.Layer:create()
	cc.Director:getInstance():getRunningScene():addChild(rootLayer, MAIN_SCENE)
	rootLayer:setAnchorPoint(cc.p(0,0))
	mRootLayer = rootLayer

    local layer = cc.Layer:create()
	-- layer:setContentSize(cc.size(display.width, display.height))
	layer:setContentSize(cc.size(200,100))
	mLayer = layer
	-- map.run3DAction(20)
	
	layer:setTouchEnabled(false)
	layer:registerScriptTouchHandler(onTouch, false, configData.layerPriorityList.map_priority)
	rootLayer:addChild(layer)
	layer:setAnchorPoint(cc.p(0,0))

	local x, y = util.countNodeSpace(display.width / 2, display.height / 2, 20)
	local point = mLayer:getParent():convertToNodeSpace(cc.p(x,y))
	mLayer:setPosition(cc.p(point.x, point.y))


	mCompareLayer = cc.LayerColor:create(cc.c4b(255,255,255,0),200, 100)
    rootLayer:addChild(mCompareLayer)

    local zorder = 1
	--显示出来的草地
	local grass = cc.SpriteBatchNode:create("gameResources/map/dibiao.png")
    layer:addChild(grass, zorder)
    
    -- 200x100的沙地
	zorder = zorder + 1
	local waterAndSand = cc.SpriteBatchNode:create("gameResources/map/water_and_sand.png")
	layer:addChild(waterAndSand,zorder)

	-- 沙地1的边缘过渡
	zorder = zorder + 1
	local sand_edge_1 = cc.SpriteBatchNode:create("gameResources/map/sand_edge_1.png")
	layer:addChild(sand_edge_1,zorder) 

	-- 沙地2的边缘过渡
	zorder = zorder + 1
	local sand_edge_2 = cc.SpriteBatchNode:create("gameResources/map/sand_edge_2.png")
	layer:addChild(sand_edge_2,zorder)

	-- 沙地3的边缘过渡
	zorder = zorder + 1
	local sand_edge_3 = cc.SpriteBatchNode:create("gameResources/map/sand_edge_3.png")
    layer:addChild(sand_edge_3,zorder)
    
    -- 200x100的水
	zorder = zorder + 1
	local waterLand = cc.SpriteBatchNode:create("gameResources/map/water_and_sand.png")
	layer:addChild(waterLand,zorder)

	-- 水1的边缘过渡
	zorder = zorder + 1
	local water_edge_1 = cc.SpriteBatchNode:create("gameResources/map/water_edge_1.png")
	layer:addChild(water_edge_1,zorder)  

	-- 水2的边缘过渡
	zorder = zorder + 1
	local water_edge_2 = cc.SpriteBatchNode:create("gameResources/map/water_edge_2.png")
	layer:addChild(water_edge_2,zorder)  

	-- 水3的边缘过渡
	zorder = zorder + 1
	local water_edge_3 = cc.SpriteBatchNode:create("gameResources/map/water_edge_3.png")
    layer:addChild(water_edge_3,zorder)  
    
    -- 战场之类的资源
	zorder = zorder + 1
	local battleRes = cc.SpriteBatchNode:create("gameResources/map/low_res.png")
	layer:addChild(battleRes,zorder)

	--资源
	zorder = zorder + 1
	local resBatchNode = cc.SpriteBatchNode:create("gameResources/map/res_1.png")
	layer:addChild(resBatchNode,zorder)

	zorder = zorder + 1
	local resBatchNode_3 = cc.SpriteBatchNode:create("gameResources/map/res_3.png")
	layer:addChild(resBatchNode_3,zorder)

	zorder = zorder + 1
	local animationNode = cc.SpriteBatchNode:create("gameResources/map/armyMark.png") 
	layer:addChild(animationNode,zorder)

	zorder = zorder + 1
	local wallHideNode = cc.SpriteBatchNode:create("gameResources/map/wall_not_hide.png") 
	layer:addChild(wallHideNode,zorder)

	--建筑batchnode
	zorder = zorder + 1
	local buildingBatchNode = cc.SpriteBatchNode:create("gameResources/map/cityComponent.png")
    layer:addChild(buildingBatchNode,zorder)
    
    zorder = zorder + 1
	local wallNotHideNode = cc.SpriteBatchNode:create("gameResources/map/wall_not_hide.png") 
	layer:addChild(wallNotHideNode,zorder)

	zorder = zorder + 1
	local view_outsideNode = cc.SpriteBatchNode:create("gameResources/map/component_outside.png")
	layer:addChild(view_outsideNode,zorder)
	
	zorder = zorder + 1
	local zhuzhaNode = cc.SpriteBatchNode:create("gameResources/map/additionCity.png")
	layer:addChild(zhuzhaNode,zorder)

	zorder = zorder + 1
	local xinshouNode = cc.SpriteBatchNode:create("gameResources/map/xinshou_smoke.png")
	layer:addChild(xinshouNode,zorder)

	zorder = zorder + 1
	local armyMarkNode = cc.SpriteBatchNode:create("gameResources/map/armyMark.png")
	layer:addChild(armyMarkNode,zorder)

	zorder = zorder + 1
	local groundArmyNode = cc.SpriteBatchNode:create("gameResources/map/armyMark.png")
    layer:addChild(groundArmyNode,zorder)
    
    --点击地块测试
	zorder = zorder + 1
	local touchLayer = cc.Sprite:createWithSpriteFrameName("fixground.png")
	layer:addChild(touchLayer,zorder)

	zorder = zorder + 1
	mSmokeLayer = cc.Layer:create()
	mSmokeLayer:setContentSize(cc.size(1024,768))
	layer:addChild(mSmokeLayer,zorder)

	zorder = zorder + 1
	mNodeLayer = cc.Layer:create()
	mNodeLayer:setContentSize(cc.size(1024,768))
	layer:addChild(mNodeLayer,zorder)

    zorder = zorder + 1
	mBuildEffectLayer = cc.Layer:create()
	mBuildEffectLayer:setContentSize(cc.size(1024,768))
    layer:addChild(mBuildEffectLayer, zorder)

    touchLayer:setVisible(false)
	touchLayer:setAnchorPoint(cc.p(0, 0))
    
    cc.exports.mapData = require("app.map.mapData"):create()
    MapSpriteManage.init()

    mapData:setTouchLayer(touchLayer)

	-- layer, grass,resLayer, building, zhuzha, animationNode,newGuideNode,armyPassNode,groundArmyNode,wallHideNode,wallNotHideNode,view_outsideNode,battleRes	
	mapData:setObject(
        {layer = mLayer, grass = grass, resLayer = resBatchNode, resLayer_3 = resBatchNode_3,
        building = buildingBatchNode, zhuzha = zhuzhaNode,animationNode = animationNode,
        newGuideNode = xinshouNode,armyPassNode = armyMarkNode, groundArmyNode = groundArmyNode,
        wallHideNode = wallHideNode,wallNotHideNode = wallNotHideNode, view_outsideNode = view_outsideNode,
        battleRes = battleRes, waterAndSand = waterAndSand, sand_edge_1 = sand_edge_1,
        sand_edge_2 = sand_edge_2, water_edge_1 = water_edge_1, water_edge_2 = water_edge_2,
		sand_edge_3 = sand_edge_3, waterLand = waterLand, water_edge_3 = water_edge_3})

	mapData:setRootLayer(rootLayer)

    cc.exports.mapController = require("app.map.mapController"):create()
	mapController:addMap(0, 0, lockCoorx, lockCoory)
	
	mapData:requestMapData(lockCoorx, lockCoory)

	MainScene:run3DAction(20)

	mainOption.create()
end

function MainScene:run3DAction(angle)
	if not mHasRunAction then
		mAngle = angle
		local orbit = cc.OrbitCamera:create(1,1, 0, 0, -angle, 90, 0)
		mRootLayer:runAction(cc.Sequence:create({orbit, cc.CallFunc:create(function ( )
			-- ObjectManager.setObjectLayerVisible()
			-- BirdAnimation.create()
			-- CloudAnimation.create()
			-- userData.on_enter_game_finish()
			mLayer:setTouchEnabled(true)
		end)}))
		mHasRunAction = true
		-- 删除掉登录相关的资源
		local cache = cc.SpriteFrameCache:getInstance()
		local textureCache = cc.Director:getInstance():getTextureCache()
		textureCache:removeTextureForKey("test/res/Login.png")
		cache:removeSpriteFramesFromFile("test/res/Login.plist")

		-- TaskData.taskUpdate()
	    -- mainOption.taskTips()
	    -- Setting.initState()
	    -- RollingNoticeManager.test()
	end
end

return MainScene
