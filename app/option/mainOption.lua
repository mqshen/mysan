cc.exports.mainOption = {}

--主操作界面按钮和显示
local main_serface_layer = nil

function mainOption.create()
    if main_serface_layer then
        return
    end

    ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("Export/35_renwu.ExportJson")
	ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("Export/btn_effect_shuishou.ExportJson")

    main_serface_layer = cc.Layer:create()

    SmallMiniMap.create(main_serface_layer)
    uiManager.add_panel_to_layer(main_serface_layer, uiIndexDefine.MAIN_INTERFACE_UI)
end

return mainOption