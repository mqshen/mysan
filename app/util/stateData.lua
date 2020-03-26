--州数据
local des = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n"}
local temp = {}

for i,v in ipairs(des) do
	temp[v] = i-1
end

local npcCityInState = {}
local guangqiaInState = {}
local wharfInState = {}
for i=1, 13 do
	npcCityInState[i] = {}
	guangqiaInState[i] = {}
	wharfInState[i] = {}
end

local wid_x = nil
local wid_y = nil
local temp_state = {}
local capital_city = {}
local isInit = false

-- 获取州里面的所有npc城市，不包括关卡
local function getNpcCityInState(id)
	return npcCityInState[id]
end

-- 获取在州边界的关卡
local function getGuangqiaInState(id)
	return guangqiaInState[id]
end

local function getWharfInState( id )
	return wharfInState[id]
end

local function getCapitalWidByRegion( id )
	return capital_city[id]
end

local function getCapitalWidList()
	return capital_city
end

local function stateInMap(x, y )
	if x < 1 or x > 1501 or y < 1 or y > 1501 then
		return false
	end
	local state = string.sub(mapJunXianData,(x-1)*1501+y, (x-1)*1501+y)--string.sub(mapAllData,(x-1)*1501+y, (x-1)*1501+y)
	if state then
		state = string.byte(state)
		state = math.floor(state/16)
		-- if state == 15 then
		-- 	state = 13
		-- end
		return state
	else
		return false
	end
end

local function getStateName( wid )
	local id = stateInMap(math.floor(wid/10000),wid%10000)
	if id and Tb_cfg_region[id] then
		return Tb_cfg_region[id].name
	end
	return false
end

local function getStateNameById( id )
	if id and Tb_cfg_region[id] then
		return Tb_cfg_region[id].name
	end
	return false
end

-- 返回0代表是关卡,返回郡县的id
local function getCounty(x,y )
	if x < 1 or x > 1501 or y < 1 or y > 1501 then
		return false
	end
	local data = string.sub(mapJunXianData, (x-1)*1501+y, (x-1)*1501+y)
	if data then
		data = string.byte(data)
		local data_jun = data%16
		local state = math.floor(data/16)--stateInMap(x,y)
		if state then
			-- print(">>>>>>>>>>>>>>>>>>>>getCounty ="..(state*100 + data))
			return state*100 + data_jun
		end
	end
	return false
end

local function isHeadOfCounty(x, y)
	local countyId = getCounty(x, y)
	if not countyId or countyId == 0 then
		return false
	else
		if not Tb_cfg_world_junxian[countyId] then
			return false
		end
		return Tb_cfg_world_junxian[countyId].center_wid == x*10000+y
	end
end

local function getCountyName(x,y )
	local countyId = getCounty(x,y )
	if countyId then
		if countyId == 0 then
			return languagePack['guanqia']
		else
			return Tb_cfg_world_junxian[countyId].name
		end
	else
		return false
	end
end

-- 获取某个郡县里所有的NPC城池wid
local function getCountyAllNpcCityWid(countyId)
	-- 所在州
	local junxian_data = Tb_cfg_world_junxian[countyId]
	if not junxian_data then return {} end

    local tx,ty = math.floor(junxian_data.center_wid/10000), junxian_data.center_wid%10000
    local region_state = stateData.stateInMap(tx,ty)

    -- 所在郡县的所有
    local all_npc_list = stateData.getNpcCityInState(region_state)
    local ret = {}
    for k,wid in pairs(all_npc_list) do 
    	tx,ty = math.floor(wid/10000), wid%10000
    	if stateData.getCounty(tx,ty) == countyId then 
    		table.insert(ret,wid)
    	end
    end
    return ret
end

-- 通过某个坐标 获取坐标所在郡县里所有的NPC城池wid
local function getCountyAllNpcCityWidByCoordinate(coordiante)
	local tx,ty = math.floor(coordiante/10000), coordiante%10000
	local countyId = stateData.getCounty(tx,ty)
    if countyId == 0 then return {} end
    return getCountyAllNpcCityWid(countyId)
end

local function initData( )
	-- if isInit then return end
	-- isInit = true
	npcCityInState = {}
	guangqiaInState = {}
	wharfInState = {}
	for i=1, 13 do
		npcCityInState[i] = {}
		guangqiaInState[i] = {}
		wharfInState[i] = {}
	end
	capital_city = {}

	local temp_state_id = nil
	for i, v in pairs(Tb_cfg_world_city) do
		if v.city_type == cityTypeDefine.npc_cheng then
			if v.region ~= 0 then
				if v.param%100 >= 3 then
					table.insert(npcCityInState[v.region], v.wid)
				end
			else
				if Tb_cfg_region_connection[v.wid] then
					table.insert(guangqiaInState[Tb_cfg_region_connection[v.wid].region1], v.wid)
					table.insert(guangqiaInState[Tb_cfg_region_connection[v.wid].region2], v.wid)
				end
			end
		elseif v.city_type == cityTypeDefine.matou then
			if v.region == 0 then
				table.insert(wharfInState[Tb_cfg_region_connection[v.wid].region1], v.wid)
				table.insert(wharfInState[Tb_cfg_region_connection[v.wid].region2], v.wid)
			else
				table.insert(wharfInState[v.region], v.wid)
			end
		end
	end

	local capitalParam = {}
	for i, v in ipairs(REGION_CAPITAL_PARAM) do
		--if NPC_CAPITAL_PARAM ~= v then
	   		capitalParam[v] = 1
	   	--end
	end

	local function sortFunc(x,y )
		if isHeadOfCounty( x,y ) then
			return 1
		else
			return 2
		end
	end

	for i = 1, 13 do
		table.sort(npcCityInState[i], function ( a,b )
			local x1,y1 = math.floor(a/10000), a%10000
			local x2,y2 = math.floor(b/10000), b%10000
			local k1 = stateData.getCounty(x1,y1)*10000-Tb_cfg_world_city[a].param%100
			local k2 = stateData.getCounty(x2,y2)*10000-Tb_cfg_world_city[b].param%100
			return k1+sortFunc(x1,y1 ) < k2+sortFunc(x2,y2 )
		end)

		table.sort(guangqiaInState[i], function ( a,b )
			return Tb_cfg_world_city[a].param%100 > Tb_cfg_world_city[b].param%100
		end)
	end


	for i, v in pairs(Tb_cfg_world_city) do
		if capitalParam[v.param] then
			capital_city[v.region] = v.wid
		end
	end
	capitalParam = nil

	temp_state = nil
end


local function getBattleResourceLevel(wid)
	-- return terrain.getBattleResourceLevel(wid)
	local info = Tb_cfg_world_city[wid]
	if not info then
		return false
	end
	if info.city_type == cityTypeDefine.npc_battle_field then
		return info.param%10
	else
		return false
	end
end

cc.exports.stateData = {
			stateInMap = stateInMap,
			getStateName = getStateName,
			getStateNameById = getStateNameById,
			getNpcCityInState = getNpcCityInState,
			getGuangqiaInState = getGuangqiaInState,
			getWharfInState = getWharfInState,
			getCapitalWidList = getCapitalWidList,
			getCapitalWidByRegion = getCapitalWidByRegion,
			getCounty = getCounty,
			getCountyName = getCountyName,
			isHeadOfCounty = isHeadOfCounty,
			initData = initData,
			getCountyAllNpcCityWid = getCountyAllNpcCityWid,
			getCountyAllNpcCityWidByCoordinate = getCountyAllNpcCityWidByCoordinate,
			getBattleResourceLevel = getBattleResourceLevel,
}
