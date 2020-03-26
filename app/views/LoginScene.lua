require "app.net.netObserver"
require "app.net.netCmd"
require "app.require"

local cjson = require "cjson"

local LoginScene = class("LoginScene", cc.load("mvc").ViewBase)

local login_layer = nil
local loginLoadingBar = nil

local file_list = {
	"test/res/Main_UI_1",
    "test/res/Main_UI_2",
	"test/res/Main_UI_5",
    "test/res/Main_UI_12",
    "gameResources/map/additionCity",
    "gameResources/map/water_and_sand",
    "gameResources/map/sand_edge_1",
    "gameResources/map/sand_edge_2",
    "gameResources/map/sand_edge_3",
    "gameResources/map/water_edge_2",
    "gameResources/map/low_res",

    "gameResources/map/res_1",
    "gameResources/map/res_3",
    "gameResources/map/wall_not_hide",
    "gameResources/map/dibiao",
    "gameResources/map/armyMark"
}

local m_count = 0

function LoginScene:onCreate()

    cc.Director:getInstance():getTextureCache():removeAllTextures()
	local cache = cc.SpriteFrameCache:getInstance()
	cache:removeSpriteFrames()
	cache:addSpriteFrames("test/res/Login.plist")
    cache:addSpriteFrames("test/res/Login_common.plist")

    login_layer = cc.Layer:create()

	local temp_widget = ccs.GUIReader:getInstance():widgetFromJsonFile("test/login_loading_layer.json")
	temp_widget:setTag(999)
	temp_widget:setIgnoreAnchorPointForPosition(false)
	temp_widget:setAnchorPoint(cc.p(0.5,0.5))
	temp_widget:setPosition(cc.p(display.width/2, display.height/2))
    temp_widget:move(display.center)
	login_layer:addChild(temp_widget)
    local image = tolua.cast(temp_widget:getChildByName("name_img_0"),"ccui.ImageView")

    local temp_widget = ccs.GUIReader:getInstance():widgetFromJsonFile("test/login_enter_game.json")
	temp_widget:setTag(998)
	temp_widget:setIgnoreAnchorPointForPosition(false)
	temp_widget:setAnchorPoint(cc.p(0.5,0.5))
    temp_widget:setPosition(cc.p(display.width/2, display.height/2))
	login_layer:addChild(temp_widget)
    temp_widget:setVisible(true)

    local btn_enter_game = tolua.cast(temp_widget:getChildByName("btn_enter_game"),"ccui.Button")
 	btn_enter_game:addTouchEventListener(function(eventType, sender)
        LoginScene.dealWithClickEnterGame(eventType, sender)
 	end)

    login_layer:addTo(self)

end

function LoginScene:dealWithClickEnterGame(eventType, sender)
    if eventType == ccui.TouchEventType.ended then
		LoginScene:sendLogin()
	end
end

local function onLogin(packet)
    local netObserver = NetObserver.getInstance()
    netObserver:removeObserver(netCmd.ON_LOGIN)
	if packet == cjson.null then
		return
    end
    LoginScene:beforeEnterGame()
end

function LoginScene:sendLogin()
    cc.exports.Net = require("app.net.net"):create()
    -- local netObserver = NetObserver.getInstance()
    -- netObserver.addObserver(netCmd.ON_LOGIN, onLogin)
    -- local net = Net.getInstance()
    -- net:connect("192.168.1.86", "9527")
    -- LoginScene:requestLogin()
    onLogin()
end

local function getConvertChildByName(parent, childName)
	assert(childName, "why get a nil child")
    local child = parent:getChildByName(childName)
	if child then
		tolua.cast(child, "ccui." .. child:getDescription())
    else
        -- print("node named["..childName.."]not found")
        -- print(debug.traceback())
    end
    return child
end

local function createLoadingBar()
    loginLoadingBar = ccs.GUIReader:getInstance():widgetFromJsonFile("test/login_loading_bar.json")
    loginLoadingBar:setAnchorPoint(cc.p(0.5,0))
	loginLoadingBar:setPosition(cc.p(display.width/2, 0))
    login_layer:addChild(loginLoadingBar)

    local panel_img_words = getConvertChildByName(loginLoadingBar, "panel_img_words")
	panel_img_words:setVisible(true)

	local m_tLoadedWord = {}
	local img_word = nil
	for i = 1 ,16 do 
		img_word = getConvertChildByName(panel_img_words, "word_" .. i)
		img_word:setVisible(false)
		m_tLoadedWord[i] = false
	end

	local patch_percent = getConvertChildByName(loginLoadingBar,"patch_percent")
	patch_percent:setVisible(false)
	local img_patch_name = getConvertChildByName(loginLoadingBar,"img_patch_name")
	img_patch_name:setVisible(false)
	local patch_name = getConvertChildByName(loginLoadingBar,"patch_name")
	patch_name:setVisible(false)

	local main_panel = getConvertChildByName(loginLoadingBar,"main_panel")
	local loading_bar_line = getConvertChildByName(main_panel,"loading_bar_line")
	loading_bar_line:setPercent(0)

	local img_flag = getConvertChildByName(loading_bar_line,"img_flag")
	img_flag:setPositionX( - loading_bar_line:getContentSize().width/2 )
	local img_flag_2 = getConvertChildByName(loading_bar_line,"img_flag_2")
	img_flag_2:setPositionX( - loading_bar_line:getContentSize().width/2 + 10 )
	local action = cc.Sequence:create(cc.FadeOut:create(0.5),cc.FadeIn:create(0.5))
	img_flag:runAction(cc.RepeatForever:create(action))

	local loading_bar_loaded = getConvertChildByName(loading_bar_line,"loading_bar_loaded")
	loading_bar_loaded:setPercent(0)
	local loading_bar_unload = getConvertChildByName(loading_bar_line,"loading_bar_unload")

	local word_percent_begin = (loading_bar_line:getContentSize().width - loading_bar_loaded:getContentSize().width)/loading_bar_line:getContentSize().width
	word_percent_begin = word_percent_begin/2

	local word_percent_end = word_percent_begin + loading_bar_loaded:getContentSize().width/loading_bar_line:getContentSize().width

	word_percent_begin = word_percent_begin * 100
	word_percent_end = word_percent_end * 100

	local img_tips = getConvertChildByName(loginLoadingBar,"img_tips")
	local label_tips = getConvertChildByName(img_tips,"label_tips")
	-- local indx_tab = {}
	-- for k,v in pairs(languageBeforeLogin.game_tips) do
	-- 	table.insert(indx_tab,k)
	-- end
	-- math.randomseed(os.time())  

	-- local indx = math.random(1,#indx_tab)
    -- label_tips:setString(languageBeforeLogin.game_tips[indx])
end

local function onPreLoadFinish(index)
    if not loginLoadingBar then
        createLoadingBar()
    end

	local main_panel = getConvertChildByName(loginLoadingBar,"main_panel")
	local loading_bar_line = getConvertChildByName(main_panel,"loading_bar_line")

	local loading_bar_loaded = getConvertChildByName(loading_bar_line,"loading_bar_loaded")

    loading_bar_loaded:setPercent(100 * index/(#g_fileTable + #file_list))
    loading_bar_line:setPercent(100 * index/(#g_fileTable + #file_list))
    
    if index == (#g_fileTable + #file_list) then
        login_layer:removeFromParent(true)
        configData.init()
        local MainScene = require("app.views.MainScene"):create()
        -- MainScene:showWithScene()
    end
end

local function dealWithTextureLoadFinished()
    -- loginGUI.on_pre_load_finish(num_finished,num_needed)
    onPreLoadFinish(#g_fileTable + m_count)
    if m_count == #file_list then
        -- SceneBeforeLogin.setPreload( preloaded )
    else
        m_count = m_count + 1;
        if file_list[m_count] then
            -- local textureCache = cc.Director:getInstance():getTextureCache()
            -- textureCache:addImageAsync(file_list[m_count]..".plist", deal_with_texture_load_finished)
            local action = cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function (  )
                cc.SpriteFrameCache:getInstance():addSpriteFrames(file_list[m_count]..".plist")
                dealWithTextureLoadFinished()
                -- if async_layer then
                --     async_layer:load_async_texture(file_list[num_finished+1])
                -- end
            end))
            cc.Director:getInstance():getRunningScene():runAction(action)
        end
    end
end

local function dealWithPngLoadFinished()
    -- loginGUI.on_pre_load_finish(num_finished,num_needed)
    m_count = m_count + 1;
    if m_count == #file_list then
        m_count = 0
        dealWithTextureLoadFinished()
    end
end

local function loadTextrueFileAsync()
    -- CCTexture2D:setDefaultAlphaPixelFormat(kCCTexture2DPixelFormat_RGBA4444)
    if #file_list > 0 then
        for i=1 , #file_list do
            local textureCache = cc.Director:getInstance():getTextureCache()
            textureCache:addImageAsync(file_list[i]..".png", dealWithPngLoadFinished)
        end
    end
end

local function loadLuaFile( )
    local index = 1
    -- local count = #g_fileTable
    local action = cc.RepeatForever:create(cc.Sequence:create({cc.CallFunc:create(function ( )
        for i = 1 , 2 do
            if g_fileTable[index] then
                require(g_fileTable[index])
                onPreLoadFinish(index)
                index = index + 1
            else
                cc.Director:getInstance():getRunningScene():stopActionByTag(12)
                -- onPreLoadLuaFinish(true)
                loadTextrueFileAsync()
                break
            end
        end
    end), cc.DelayTime:create(0.1)}))
    action:setTag(12)
    cc.Director:getInstance():getRunningScene():runAction(action)
end

function LoginScene:beforeEnterGame()
    loadLuaFile()
end

function LoginScene:requestLogin()
end

return LoginScene
