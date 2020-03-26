cc.exports.uiManager = {}

local xy_layer = nil
local panel_in_bottom_list = nil 	--显示在底层静态层的面板索引列表
local bottom_fix_layer = nil		--用来加载底层的窗口，也就是俗称的主界面
local basic_ui_layer = nil
local suspend_layer_list = nil


local SUSPEND_LAYER_OPACITY = 220
local SUSPEND_OPACITY_2 = 150

local MOVE_SENSITIVE_DIS = 5

local SUSPEND_LAYER_INCREASE_STEP = 3

local function onLayerTouch(arg1, arg2, arg3)
end

local function onXYTouch(arg1, arg2, arg3)
end

local function add_suspend_layer()
	if not suspend_layer_list then 
		suspend_layer_list = {}
	end

	--每次增加数量设置为3，即在找不到空闲的layer时会增加3个
	for i=1,SUSPEND_LAYER_INCREASE_STEP do
		local temp_color_layer = cc.LayerColor:create(cc.c4b(14, 17, 24, SUSPEND_LAYER_OPACITY), display.width, display.height)
		temp_color_layer:setVisible(false)
		basic_ui_layer:addChild(temp_color_layer)
		local layer_info_list = {}
		layer_info_list[1] = temp_color_layer
		layer_info_list[2] = 0
		table.insert(suspend_layer_list, layer_info_list)
	end
end

local function init_ui_layer()
	bottom_fix_layer = cc.Layer:create()
	basic_ui_layer:addChild(bottom_fix_layer)
	panel_in_bottom_list = {}

	add_suspend_layer()
end

local function create()
	basic_ui_layer = cc.Layer:create()
	basic_ui_layer:registerScriptTouchHandler(onLayerTouch, false, configData.layerPriorityList.ui_priority, true)
	basic_ui_layer:setTouchEnabled(true)
	cc.Director:getInstance():getRunningScene():addChild(basic_ui_layer, UI_SCENE)

	xy_layer = cc.Layer:create()
	xy_layer:registerScriptTouchHandler(onXYTouch, false, configData.layerPriorityList.pos_priority, false)
	xy_layer:setTouchEnabled(true)
	cc.Director:getInstance():getRunningScene():addChild(xy_layer, SLIDE_SCENE)

	init_ui_layer()

end

local function get_suspend_layer_ui_num()
	local ret = 0
	local suspend_nums = #suspend_layer_list
	for i = suspend_nums, 1, -1 do
		local show_index = suspend_layer_list[i][2]
		if show_index ~= 0 then
			ret = ret + 1
		end
	end
	return ret
end

local function get_next_empty_layer_index()
	local result_index = 0
	local suspend_nums = #suspend_layer_list

	local cur_suspend_ui_num = get_suspend_layer_ui_num()
	for i = suspend_nums,1,-1 do
		if i > 1 then
			if (suspend_layer_list[i][2] == 0 ) and (suspend_layer_list[i - 1][2] ~= 0 ) then
				result_index = i
			end
		end
    end

	if cur_suspend_ui_num == 0 then
		result_index = 1
	end

	local need_increase = false

	if cur_suspend_ui_num > 0 and (result_index ~= 0) then
		for i = result_index,suspend_nums do
			if suspend_layer_list[i][2] ~= 0 then
				need_increase = true
			end
		end
	end

	if need_increase then
		result_index = 0
	end
	if result_index == 0 then
		result_index = #suspend_layer_list + 1
		add_suspend_layer()
	end

	return result_index
end

function uiManager.add_panel_to_layer(temp_touch_group, panel_index)
    if not basic_ui_layer then
		create()
    end
    local temp_prop_info = panelPropInfo[panel_index]
	if temp_prop_info then
		if temp_prop_info[3] == 0 then
			bottom_fix_layer:addChild(temp_touch_group)
			table.insert(panel_in_bottom_list, panel_index)
        else
            local show_layer_index = get_next_empty_layer_index()
			suspend_layer_list[show_layer_index][1]:addChild(temp_touch_group)
            suspend_layer_list[show_layer_index][1]:setVisible(true)
            suspend_layer_list[show_layer_index][2] = panel_index
			if temp_prop_info[4] == 1 then
				if show_layer_index ~= 1 then
					-- suspend_layer_list[show_layer_index - 1][1]:setVisible(false)
				end
			end

            -- todo
			-- update_layer_opacity()
			-- update_layer_show_level()
        end
    end
end

return uiManager