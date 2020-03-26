cc.exports.MapNodeData = MapNodeData or {}
-- 用于地图模拟跳转时候边缘增加的地标数据
local tGrassCoverNode = {}

--地表的底层node数据
local tSufaceNode = {}

-- 地表的过渡
local tGrassEdgeNode = {}

local tSmoothEdgeNode = {}

local tSmoothSnowEdgeNode = {}

--建筑的node数据
local tBuildingNode = {}

-- 建筑中废墟，分城建造中，要塞建造中, 新手阶段的地表(贼兵，栅栏什么的)等图片的node
local tBetweenMountainNode = {}

--山脉那层node的数据
local tMountainNode = {}

--水的边缘那层上面的node
local tWaterEdgeNode = {}

-- 沙地边缘的node
local tSandEdgeNode = {}

--资源地的那层的node
local tResourcesNode = {}

--战争迷雾那层的node
local tFogNode = {}

--水的那层的node
local tWaterNode = {}

--显示出来的草地那层
local tGrassNode = {}

--援军的那层node
local tYuanjunNode = {}

--山寨，关卡跟山的相接那部分node
local tAdditionWallNode = {}

--丘陵的那层
local tQiulingNode = {}

--扩建那层
local tExpandNode = {}

-- 屯田的那层
local tFarmingNode = {}

--五级地动画
local tLevel5AnimationNode = {}

-- 被遮挡的城墙
local tWallHideNode = {}

-- 不被遮挡的城墙
local tWallNotHideNode = {}

--大地图的建筑，像要塞之类的
local tOutsideViewNode = {} 

-- 大地图的战场资源
local tBattleResourceNode = {}


-- 练兵的那层
local tTrainingNode = {}
function MapNodeData.remove( )
	tLevel5AnimationNode = {}
	tSufaceNode = {}
	tBuildingNode = {}
	tMountainNode = {}
	tWaterEdgeNode = {}
	tResourcesNode = {}
	tFogNode = {}
	tWaterNode = {}
	tGrassNode = {}
	tYuanjunNode = {}
	tAdditionWallNode = {}
	tQiulingNode = {}
	tExpandNode = {}
	tSandEdgeNode = {}
	tBetweenMountainNode = {}
	tFarmingNode = {}
	tGrassCoverNode = {}
	tTrainingNode = {}
	tWallHideNode = {}
	tWallNotHideNode = {}
	tOutsideViewNode = {} 
	tBattleResourceNode = {}
	tGrassEdgeNode = {}
	tSmoothEdgeNode = {}
	tSmoothSnowEdgeNode = {}
end

--获取最底层的地表数据
function MapNodeData.addSurfaceNode(node, tag, name )
	tSufaceNode[tag] = {node, name}
end

function MapNodeData.removeSurfaceNode( tag )
	if tSufaceNode[tag] then
		MapSpriteManage.pushSprite(mapElement.FOG, tSufaceNode[tag][2], tSufaceNode[tag][1] )
	end
	tSufaceNode[tag] = nil
end

function MapNodeData.removeAllSurfaceNode( )
	for i, v in pairs(tSufaceNode) do
		MapSpriteManage.pushSprite(mapElement.FOG, v[2], v[1])
	end
	tSufaceNode = {}
	
end

function MapNodeData.getSurfaceNode( )
	return tSufaceNode
end

--获取地表过渡数据
function MapNodeData.addSmoothEdgeNode(node, tag, name )
	tSmoothEdgeNode[tag] = {node, name}
end

function MapNodeData.removeSmoothEdgeNode( tag )
	if tSmoothEdgeNode[tag] then
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE_SMOOTH, tSmoothEdgeNode[tag][2], tSmoothEdgeNode[tag][1] )
	end
	tSmoothEdgeNode[tag] = nil
end

function MapNodeData.removeAllSmoothEdgeNode( )
	for i, v in pairs(tSmoothEdgeNode) do
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE_SMOOTH, v[2], v[1])
	end
	tSmoothEdgeNode = {}
end

function MapNodeData.getSmoothEdgeNode( )
	return tSmoothEdgeNode
end

--获取地表雪地过渡数据
function MapNodeData.addSmoothSnowEdgeNode(node, tag, name )
	tSmoothSnowEdgeNode[tag] = {node, name}
end

function MapNodeData.removeSmoothSnowEdgeNode( tag )
	if tSmoothSnowEdgeNode[tag] then
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE_SMOOTH_SNOW, tSmoothSnowEdgeNode[tag][2], tSmoothSnowEdgeNode[tag][1] )
	end
	tSmoothSnowEdgeNode[tag] = nil
end

function MapNodeData.removeAllSmoothSnowEdgeNode( )
	for i, v in pairs(tSmoothSnowEdgeNode) do
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE_SMOOTH_SNOW, v[2], v[1])
	end
	tSmoothSnowEdgeNode = {}
end

function MapNodeData.getSmoothSnowEdgeNode( )
	return tSmoothSnowEdgeNode
end

--获取最底层的地表过渡数据
function MapNodeData.addEdgeNode(node, tag, name )
	tGrassEdgeNode[tag] = {node, name}
end

function MapNodeData.removeEdgeNode( tag )
	if tGrassEdgeNode[tag] then
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE, tGrassEdgeNode[tag][2], tGrassEdgeNode[tag][1] )
	end
	tGrassEdgeNode[tag] = nil
end

function MapNodeData.removeAllEdgeNode( )
	for i, v in pairs(tGrassEdgeNode) do
		MapSpriteManage.pushSprite(mapElement.GRASS_EDGE, v[2], v[1])
	end
	tGrassEdgeNode = {}
end

function MapNodeData.getEdgeNode( )
	return tGrassEdgeNode
end
--------------------------------------------------------------------------------
--城市那层资源的接口
function MapNodeData.addBuildingNode(node, tag, name )
	tBuildingNode[tag] = {node,name}
end

function MapNodeData.removeBuildingNode( tag )
	if tBuildingNode[tag] then
		tBuildingNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.BUILDING, tBuildingNode[tag][2], tBuildingNode[tag][1])
	end
	tBuildingNode[tag] = nil
end

function MapNodeData.removeAllBuildingNode( )
	for i, v in pairs(tBuildingNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.BUILDING, v[2], v[1])
	end
	tBuildingNode = {}
end

function MapNodeData.getBuildingNode( )
	return tBuildingNode
end

--------------------------------------------------------------------------------
--大地图建筑那层资源的接口
function MapNodeData.addOutsideViewNode(node, tag, name )
	tOutsideViewNode[tag] = {node,name}
end

function MapNodeData.removeOutsideViewNode( tag )
	if tOutsideViewNode[tag] then
		tOutsideViewNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.OUTSIDE_VIEW, tOutsideViewNode[tag][2], tOutsideViewNode[tag][1])
	end
	tOutsideViewNode[tag] = nil
end

function MapNodeData.removeAllOutsideViewNode( )
	for i, v in pairs(tOutsideViewNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.OUTSIDE_VIEW, v[2], v[1])
	end
	tOutsideViewNode = {}
end

function MapNodeData.getOutsideViewNode( )
	return tOutsideViewNode
end

--------------------------------------------------------------------------------
--被遮挡那层资源的接口
function MapNodeData.addWallHideNode(node, tag, name )
	tWallHideNode[tag] = {node,name}
end

function MapNodeData.removeWallHideNode( tag )
	if tWallHideNode[tag] then
		tWallHideNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.WALL_HIDE, tWallHideNode[tag][2], tWallHideNode[tag][1])
	end
	tWallHideNode[tag] = nil
end

function MapNodeData.removeAllWallHideNode( )
	for i, v in pairs(tWallHideNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.WALL_HIDE, v[2], v[1])
	end
	tWallHideNode = {}
end

function MapNodeData.getWallHideNode( )
	return tWallHideNode
end

--------------------------------------------------------------------------------
--不被遮挡那层资源的接口
function MapNodeData.addWallNotHideNode(node, tag, name )
	tWallNotHideNode[tag] = {node,name}
end

function MapNodeData.removeWallNotHideNode( tag )
	if tWallNotHideNode[tag] then
		tWallNotHideNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.WALL_NOT_HIDE, tWallNotHideNode[tag][2], tWallNotHideNode[tag][1])
	end
	tWallNotHideNode[tag] = nil
end

function MapNodeData.removeAllWallNotHideNode( )
	for i, v in pairs(tWallNotHideNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.WALL_NOT_HIDE, v[2], v[1])
	end
	tWallNotHideNode = {}
end

function MapNodeData.getWallNotHideNode( )
	return tWallNotHideNode
end

-------------------------------------------------------------------------------
--建筑中废墟，分城建造中，要塞建造中, 新手阶段的地表(贼兵，栅栏什么的)等图片的node
function MapNodeData.addBetweenMountainNode(node, tag, name )
	tBetweenMountainNode[tag] = {node,name}
end

function MapNodeData.removeBetweenMountainNode( tag )
	if tBetweenMountainNode[tag] then
		MapSpriteManage.pushSprite(mapElement.BETWEENNODE, tBetweenMountainNode[tag][2],tBetweenMountainNode[tag][1])
	end
	tBetweenMountainNode[tag] = nil
end

function MapNodeData.removeAllBetweenMountainNode( )
	for i, v in pairs(tBetweenMountainNode) do
		MapSpriteManage.pushSprite(mapElement.BETWEENNODE, v[2],v[1])
	end
	tBetweenMountainNode = {}
end

function MapNodeData.getBetweenMountainNode( )
	return tBetweenMountainNode
end

-------------------------------------------------------------------------------
--山脉那层的接口
function MapNodeData.addMountainNode(node, tag, name )
	tMountainNode[tag] = {node,name}
end

function MapNodeData.removeMountainNode( tag )
	if tMountainNode[tag] then
		tMountainNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.MOUNTAIN, tMountainNode[tag][2], tMountainNode[tag][1])
	end
	tMountainNode[tag] = nil
end

function MapNodeData.removeAllMountainNode( )
	for i, v in pairs(tMountainNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.MOUNTAIN, v[2], v[1])
	end
	tMountainNode = {}
end

function MapNodeData.getMountainNode( )
	return tMountainNode
end


-----------------------------------------------------------------------------------
--水的边缘和沙地的边缘那层
function MapNodeData.addWaterEdgeNode(node, tag, name )
	tWaterEdgeNode[tag] = {node, name}
end

function MapNodeData.removeWaterEdgeNode( tag )
	if tWaterEdgeNode[tag] then
		MapSpriteManage.pushSprite(mapElement.WATEREAGE, tWaterEdgeNode[tag][2], tWaterEdgeNode[tag][1])
	end
	tWaterEdgeNode[tag] = nil
end

function MapNodeData.removeAllWaterEdgeNode( )
	for i, v in pairs(tWaterEdgeNode) do
		MapSpriteManage.pushSprite(mapElement.WATEREAGE, v[2], v[1])
	end
	tWaterEdgeNode = {}
end

function MapNodeData.getWaterEdgeNode( )
	return tWaterEdgeNode
end

-----------------------------------------------------------------------------------
--沙地的边缘那层
function MapNodeData.addSandEdgeNode(node, tag,name )
	tSandEdgeNode[tag] = {node,name}
end

function MapNodeData.removeSandEdgeNode( tag )
	if tSandEdgeNode[tag] then
		MapSpriteManage.pushSprite(mapElement.SANDEAGE, tSandEdgeNode[tag][2], tSandEdgeNode[tag][1])
	end
	tSandEdgeNode[tag] = nil
end

function MapNodeData.removeAllSandEdgeNode( )
	for i, v in pairs(tSandEdgeNode) do
		MapSpriteManage.pushSprite(mapElement.SANDEAGE, v[2], v[1])
	end
	tSandEdgeNode = {}
end

function MapNodeData.getSandEdgeNode( )
	return tSandEdgeNode
end

-----------------------------------------------------------------------------------
--战场资源地的那层node接口
function MapNodeData.addBattleResourceNode(node, tag, name )
	tBattleResourceNode[tag] = {node,name}
end

function MapNodeData.removeBattleResourceNode( tag )
	if tBattleResourceNode[tag] then
		tBattleResourceNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.RES, tBattleResourceNode[tag][2], tBattleResourceNode[tag][1])
	end
	tBattleResourceNode[tag] = nil
	local tagwid = mapData:getRealWid(tag )
	local tagX = math.floor(tagwid/10000)+1
	local tagY = tagX*10000-tagwid
	MapNodeData.removeLevel5AnimationNode(tagX*10000+tagY)
end

function MapNodeData.removeAllBattleResourceNode( )
	for i, v in pairs(tBattleResourceNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.RES, v[2], v[1])
	end
	tBattleResourceNode = {}
	MapNodeData.removeAllLevel5AnimationNode()
end

function MapNodeData.getBattleResourceNode( )
	return tBattleResourceNode
end


-----------------------------------------------------------------------------------
--资源地的那层node接口
function MapNodeData.addResourceNode(node, tag, name )
	tResourcesNode[tag] = {node,name}
end

function MapNodeData.removeResourceNode( tag )
	if tResourcesNode[tag] then
		tResourcesNode[tag][1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.RES, tResourcesNode[tag][2], tResourcesNode[tag][1])
	end
	tResourcesNode[tag] = nil

	local tagwid = mapData:getRealWid(tag )
	local tagX = math.floor(tagwid/10000)+1
	local tagY = tagX*10000-tagwid
	MapNodeData.removeLevel5AnimationNode(tagX*10000+tagY)
end

function MapNodeData.removeAllResourceNode( )
	for i, v in pairs(tResourcesNode) do
		v[1]:removeAllChildren(true)
		MapSpriteManage.pushSprite(mapElement.RES, v[2], v[1])
	end
	tResourcesNode = {}
	MapNodeData.removeAllLevel5AnimationNode()
end

function MapNodeData.getResourceNode( )
	return tResourcesNode
end

-----------------------------------------------------------------------------------
--战争迷雾的那层node接口
function MapNodeData.addFogNode(node, tag,name )
	tFogNode[tag] = {node,name}
end

function MapNodeData.removeFogNode( tag )
	if tFogNode[tag] then
		MapSpriteManage.pushSprite(mapElement.FOGEAGE, tFogNode[tag][2], tFogNode[tag][1] )
	end
	tFogNode[tag] = nil
end

function MapNodeData.removeAllFogNode( )
	for i, v in pairs(tFogNode) do
		-- v:removeFromParent(true)
		MapSpriteManage.pushSprite(mapElement.FOGEAGE, v[2], v[1] )
	end
	tFogNode = {}
end

function MapNodeData.getFogNode( )
	return tFogNode
end

-----------------------------------------------------------------------------------
--水的那层node接口
function MapNodeData.addWaterNode(node, tag, name )
	tWaterNode[tag] = {node,name}
end

function MapNodeData.removeWaterNode( tag )
	if tWaterNode[tag] then
		MapSpriteManage.pushSprite(mapElement.WATER, tWaterNode[tag][2], tWaterNode[tag][1] )
	end
	tWaterNode[tag] = nil
end

function MapNodeData.removeAllWaterNode( )
	for i, v in pairs(tWaterNode) do
		MapSpriteManage.pushSprite(mapElement.WATER, v[2], v[1])
	end
	tWaterNode = {}
end

function MapNodeData.getWaterNode( )
	return tWaterNode
end

-----------------------------------------------------------------------------------
--显示出来的模拟移动时候增加那层node接口
function MapNodeData.addGrassCoverNode(node, tag,name )
	tGrassCoverNode[tag] = {node,name}
end

function MapNodeData.removeGrassCoverNode( tag )
	if tGrassCoverNode[tag] then
		MapSpriteManage.pushSprite(mapElement.GRASS_COVER, tGrassCoverNode[tag][2], tGrassCoverNode[tag][1])
	end
	tGrassCoverNode[tag] = nil
end

function MapNodeData.removeAllGrassCoverNode( )
	for i, v in pairs(tGrassCoverNode) do
		MapSpriteManage.pushSprite(mapElement.GRASS_COVER, v[2], v[1])
	end
	tGrassCoverNode = {}
end

function MapNodeData.getGrassCoverNode( )
	return tGrassCoverNode
end

-----------------------------------------------------------------------------------
--显示出来的草地那层node接口
function MapNodeData.addGrassNode(node, tag,name )
	tGrassNode[tag] = {node,name}
end

function MapNodeData.removeGrassNode( tag )
	if tGrassNode[tag] then
		MapSpriteManage.pushSprite(mapElement.GRASS, tGrassNode[tag][2], tGrassNode[tag][1])
	end
	tGrassNode[tag] = nil
end

function MapNodeData.removeAllGrassNode( )
	for i, v in pairs(tGrassNode) do
		MapSpriteManage.pushSprite(mapElement.GRASS, v[2], v[1])
	end
	tGrassNode = {}
end

function MapNodeData.getGrassNode( )
	return tGrassNode
end

-----------------------------------------------------------------------------------
--援军那层node接口
function MapNodeData.addYuanjunNode(node, tag,name )
	tYuanjunNode[tag] = {node,name}
	MapNodeData.setLevel5AnimationVisible(tag,false)
end

function MapNodeData.removeYuanjunNode( tag )
	if tYuanjunNode[tag] then
		MapSpriteManage.pushSprite(mapElement.YUANJUN, tYuanjunNode[tag][2], tYuanjunNode[tag][1])
		tYuanjunNode[tag] = nil
		setLevel5AnimationVisible(tag,true)
	end
end

function MapNodeData.removeAllYuanjunNode( )
	for i, v in pairs(tYuanjunNode) do
		MapSpriteManage.pushSprite(mapElement.YUANJUN, v[2], v[1])
		tYuanjunNode[i] = nil
		MapNodeData.setLevel5AnimationVisible(i,true)
	end
	tYuanjunNode = {}
end

function MapNodeData.getYuanjunNode( )
	return tYuanjunNode
end

-----------------------------------------------------------------------------------
--山寨，关卡跟山的相接那部分node
function MapNodeData.addAdditionWallNode(node, tag, name)
	tAdditionWallNode[tag] = {node,name}
end

function MapNodeData.removeAdditionWallNode( tag )
	if tAdditionWallNode[tag] then
		MapSpriteManage.pushSprite(mapElement.ADDITION,tAdditionWallNode[tag][2], tAdditionWallNode[tag][1])
	end
	tAdditionWallNode[tag] = nil
end

function MapNodeData.removeAllAdditionWallNode( )
	for i, v in pairs(tAdditionWallNode) do
		MapSpriteManage.pushSprite(mapElement.ADDITION,v[2], v[1])
	end
	tAdditionWallNode = {}
end

function MapNodeData.getAdditionWallNode( )
	return tAdditionWallNode
end

-----------------------------------------------------------------------------------
--丘陵那部分node
function MapNodeData.addQiuLingNode(node, tag, name )
	tQiulingNode[tag] = {node,name}
end

function MapNodeData.removeQiuLingNode( tag )
	if tQiulingNode[tag] then
		MapSpriteManage.pushSprite(mapElement.QIULING,tQiulingNode[tag][2],tQiulingNode[tag][1] )
	end
	tQiulingNode[tag] = nil
end

function MapNodeData.removeAllQiuLingNode( )
	for i, v in pairs(tQiulingNode) do
		MapSpriteManage.pushSprite(mapElement.QIULING, v[2],v[1] )
	end
	tQiulingNode = {}
end

function MapNodeData.getQiuLingNode( )
	return tQiulingNode
end

-----------------------------------------------------------------------------------
--扩建那部分node
function MapNodeData.addExpandNode(node, tag )
	tExpandNode[tag] = node
end

function MapNodeData.removeExpandNode( tag )
	tExpandNode[tag] = nil
end

function MapNodeData.removeAllExpandNode( )
	for i, v in pairs(tExpandNode) do
		v:removeFromParent(true)
	end
	tExpandNode = {}
end

function MapNodeData.getExpandNode( )
	return tExpandNode
end

--------------------------------------------------------------------------------
--屯田那层资源的接口
function MapNodeData.addFarmingNode(node, tag, name )
	tFarmingNode[tag] = {node,name}
	MapNodeData.setLevel5AnimationVisible(tag,false)
end

function MapNodeData.removeFarmingNode( tag )
	if tFarmingNode[tag] then
		MapSpriteManage.pushSprite(mapElement.FARMING, tFarmingNode[tag][2], tFarmingNode[tag][1])
		tFarmingNode[tag] = nil
		MapNodeData.setLevel5AnimationVisible( tag,true )
	end
end

function MapNodeData.removeAllFarmingNode( )
	for i, v in pairs(tFarmingNode) do
		MapSpriteManage.pushSprite(mapElement.FARMING, v[2], v[1])
		tFarmingNode[i] = nil
		MapNodeData.setLevel5AnimationVisible( i,true )
	end
	tFarmingNode = {}
end

function MapNodeData.getFarmingNode( )
	return tFarmingNode
end


--------------------------------------------------------------------------------
--练兵那层资源的接口
function MapNodeData.addTrainingNode(node, tag, name )
	tTrainingNode[tag] = {node,name}
	setLevel5AnimationVisible(tag,false)
end

function MapNodeData.removeTrainingNode( tag )
	if tTrainingNode[tag] then
		MapSpriteManage.pushSprite(mapElement.TRAINING, tTrainingNode[tag][2], tTrainingNode[tag][1])  
		tTrainingNode[tag] = nil
		setLevel5AnimationVisible(tag,true)
	end
end

function MapNodeData.removeAllTrainingNode( )
	for i, v in pairs(tTrainingNode) do
		MapSpriteManage.pushSprite(mapElement.TRAINING, v[2], v[1])
		tTrainingNode[i] = nil
		setLevel5AnimationVisible(i,true)
	end
	tTrainingNode = {}
end

function MapNodeData.getTrainingNode( )
	return tTrainingNode
end

function MapNodeData.getLevel5AnimationNode( wid )
	return tLevel5AnimationNode[wid]
end

function MapNodeData.getAllLevel5AnimationNode( )
	return tLevel5AnimationNode
end

function MapNodeData.addLevel5AnimationNode(wid,node,totalCount,total_index,name )
	if not tLevel5AnimationNode[wid] then
		tLevel5AnimationNode[wid] = {}
	end
	table.insert(tLevel5AnimationNode[wid], {node,totalCount,total_index,name})
end

function MapNodeData.removeLevel5AnimationNode( wid )
	if tLevel5AnimationNode[wid] then
		for i, v in pairs(tLevel5AnimationNode[wid]) do
			v[1]:removeFromParent(true)
		end
	end
	tLevel5AnimationNode[wid] = nil
end

function MapNodeData.removeAllLevel5AnimationNode( )
	for i, v in pairs(tLevel5AnimationNode) do
		for m, n in pairs(v) do
			n[1]:removeFromParent(true)
		end
	end
	tLevel5AnimationNode = {}
end

function MapNodeData.setLevel5AnimationVisible( tag,visible )
	local tagwid = mapData:getRealWid(tag )
	local tagX = math.floor(tagwid/10000)+1
	local tagY = tagX*10000-tagwid
	mapController.setLevel5animationVisible(tagX*10000+tagY,visible)
end
