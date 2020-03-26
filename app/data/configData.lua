cc.exports.configData = { }

configData.layerPriorityList = {ui_priority = -129, ui_assist_priority = -130, com_guide_priority = -130, 
					guide_swallow_priority = -130, guide_priority = -131, pos_priority = -132, 
					guide_tool_priority = -133, map_object =0 ,map_priority = 1, global_priority = -999}

					-- 记录所有加载过的cfg表
local loaded_cfg_table = {}

function configData.init()
	local require_cfg = {
		["Tb_cfg_world_city"] = "app/data/cfg/Tb_cfg_world_city"
	}

	local load_str = nil
	for i, v in pairs(require_cfg) do
		load_str = v
		
		table.insert(loaded_cfg_table, load_str)
	end

	for i, v in ipairs(loaded_cfg_table) do
		require(loaded_cfg_table[i])
	end

end