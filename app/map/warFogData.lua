--战争迷雾数据层
local allFogData = {}

local function getAllFogData(  )
	return allFogData
end

local function insertFogEgdeData(coorX,coorY )

	allFogData[coorX*10000+coorY] = 1
end


-- return 1 有视野 0无视野
local function getFogDataByWid( wid )
	return allFogData[wid]
end

--超出范围的迷雾删除
local function deleteStencilByArea() 
	allFogData = {}
end

cc.exports.WarFogData = { 
				insertFogEgdeData = insertFogEgdeData,
				getAllFogData = getAllFogData,
				deleteStencilByArea = deleteStencilByArea,
				getFogDataByWid = getFogDataByWid,
				}