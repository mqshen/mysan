--定义部队可以进行的行动 1：出征；2 援军；3驻扎；11 练兵；12 屯田；13扫荡 14 军团集结
cc.exports.armyOp = {
	chuzheng = 1,
	yuanjun = 2,
	zhuzha = 3, 
	training = 11,
	farm = 12,
	rake = 13,
	army_group_assemble = 14,
	army_group_chuzheng = 15,
	army_group_yuanjun = 16,
	army_group_zhuzha = 17,
	pillage = 18, 	-- 掠夺
	yazhi = 19, 	-- 压制
	chuzheng_tech_strategies = 100, 			-- 计略出征选项
	chuzheng_tech_strategies_liaowang = 101, 	-- 计略出征【瞭望】
	chuzheng_tech_strategies_zhencha = 102, 	-- 计略出征【侦查】
	chuzheng_tech_strategies_xiubu = 103, 		-- 计略出征【修补】
	chuzheng_tech_strategies_maifu = 104, 		-- 计略出征【埋伏】
}

-- 定义分享的场景
cc.exports.shareOp = {
	battleReport = 1, 
	battleSum = 2, 
	heroInfoUI = 3,
	cardUI = 4,
}

-- 通知设置的定义
-- byte NOTIFY_BUILD = 1;//城内建筑
-- byte NOTIFY_CONSTRUCTION = 2;//城外建筑
-- byte NOTIFY_POLITICS = 3;//内政
-- byte NOTIFY_AMRY = 4;//部队
-- byte NOTIFY_USER_FIGHT = 5;//个人战斗
-- byte NOTIFY_UNION_FIGHT = 6;//同盟战斗
-- byte NOTIFY_CALLBACK = 7;//流失
-- byte NOTIFY_FIELD_EVENT = 8;//地表事件
-- byte NOTIFY_CARD = 9 //免费抽卡
cc.exports.notification_setting = {
	NOTIFY_BUILD = 1,
	NOTIFY_CONSTRUCTION = 2,
	NOTIFY_POLITICS = 3,
	NOTIFY_AMRY = 4,
	NOTIFY_USER_FIGHT = 5,
	NOTIFY_UNION_FIGHT = 6,
	NOTIFY_CALLBACK = 7,
	NOTIFY_FIELD_EVENT = 8,
	NOTIFY_CARD = 9,
	NOTIFY_MAIL = 10,
}


--------------------------- 一些收益buff
cc.exports.gProfitBuffType = {
	hero_exp_add = 1, 	-- 武将经验
	wood_add = 2,		-- 木材产量
	stone_add = 3,		-- 石头产量
	iron_add = 4,		-- 铁矿产量
	food_add = 5,		-- 粮食产量
	gong_attack_add = 6,	-- 弓兵攻击
	gong_defend_add = 7,	-- 弓兵防御
	gong_intel_add = 8,		-- 弓兵谋略
	gong_speed_add = 9,		-- 弓兵速度

	qiang_attack_add = 10,	-- 枪兵攻击
	qiang_defend_add = 11,	-- 枪兵防御
	qiang_intel_add = 12,	-- 枪兵谋略
	qiang_speed_add = 13,	-- 枪兵速度

	qi_attack_add = 14,		-- 骑兵攻击
	qi_defend_add = 15,		-- 骑兵防御
	qi_intel_add = 16,		-- 骑兵谋略
	qi_speed_add = 17,		-- 骑兵速度

	money_add = 18,			-- 税收加成

	building_speed_add = 19 , -- 建造速度提升
}

cc.exports.gProfitBuffTypeName = {}
gProfitBuffTypeName[gProfitBuffType.hero_exp_add] = languagePack['profit_buff_name_1']
gProfitBuffTypeName[gProfitBuffType.wood_add] = languagePack['profit_buff_name_2']
gProfitBuffTypeName[gProfitBuffType.stone_add] = languagePack['profit_buff_name_3']
gProfitBuffTypeName[gProfitBuffType.iron_add] = languagePack['profit_buff_name_4']
gProfitBuffTypeName[gProfitBuffType.food_add] = languagePack['profit_buff_name_5']
gProfitBuffTypeName[gProfitBuffType.gong_attack_add] = languagePack['profit_buff_name_6']
gProfitBuffTypeName[gProfitBuffType.gong_defend_add] = languagePack['profit_buff_name_7']
gProfitBuffTypeName[gProfitBuffType.gong_intel_add] = languagePack['profit_buff_name_8']
gProfitBuffTypeName[gProfitBuffType.gong_speed_add] = languagePack['profit_buff_name_16']
gProfitBuffTypeName[gProfitBuffType.qiang_attack_add] = languagePack['profit_buff_name_9']
gProfitBuffTypeName[gProfitBuffType.qiang_defend_add] = languagePack['profit_buff_name_10']
gProfitBuffTypeName[gProfitBuffType.qiang_intel_add] = languagePack['profit_buff_name_11']
gProfitBuffTypeName[gProfitBuffType.qiang_speed_add] = languagePack['profit_buff_name_17']
gProfitBuffTypeName[gProfitBuffType.qi_attack_add] = languagePack['profit_buff_name_12']
gProfitBuffTypeName[gProfitBuffType.qi_defend_add] = languagePack['profit_buff_name_13']
gProfitBuffTypeName[gProfitBuffType.qi_intel_add] = languagePack['profit_buff_name_14']
gProfitBuffTypeName[gProfitBuffType.qi_speed_add] = languagePack['profit_buff_name_18']
gProfitBuffTypeName[gProfitBuffType.money_add] = languagePack['profit_buff_name_15']
gProfitBuffTypeName[gProfitBuffType.building_speed_add] = languagePack['profit_buff_name_15']


cc.exports.gProfitBuffTypeIconSmall = {}
gProfitBuffTypeIconSmall[gProfitBuffType.hero_exp_add] = ResDefineUtil.ui_resource_icon_small[9]
gProfitBuffTypeIconSmall[gProfitBuffType.wood_add] = ResDefineUtil.ui_resource_icon_small[1]
gProfitBuffTypeIconSmall[gProfitBuffType.stone_add] = ResDefineUtil.ui_resource_icon_small[3]
gProfitBuffTypeIconSmall[gProfitBuffType.iron_add] = ResDefineUtil.ui_resource_icon_small[2]
gProfitBuffTypeIconSmall[gProfitBuffType.food_add] = ResDefineUtil.ui_resource_icon_small[4]
gProfitBuffTypeIconSmall[gProfitBuffType.gong_attack_add] = ResDefineUtil.ui_resource_icon_small[10]
gProfitBuffTypeIconSmall[gProfitBuffType.gong_defend_add] = ResDefineUtil.ui_resource_icon_small[11]
gProfitBuffTypeIconSmall[gProfitBuffType.gong_intel_add] = ResDefineUtil.ui_resource_icon_small[12]
gProfitBuffTypeIconSmall[gProfitBuffType.gong_speed_add] = ResDefineUtil.ui_resource_icon_small[13]
gProfitBuffTypeIconSmall[gProfitBuffType.qiang_attack_add] = ResDefineUtil.ui_resource_icon_small[10]
gProfitBuffTypeIconSmall[gProfitBuffType.qiang_defend_add] = ResDefineUtil.ui_resource_icon_small[11]
gProfitBuffTypeIconSmall[gProfitBuffType.qiang_intel_add] = ResDefineUtil.ui_resource_icon_small[12]
gProfitBuffTypeIconSmall[gProfitBuffType.qiang_speed_add] = ResDefineUtil.ui_resource_icon_small[13]
gProfitBuffTypeIconSmall[gProfitBuffType.qi_attack_add] = ResDefineUtil.ui_resource_icon_small[10]
gProfitBuffTypeIconSmall[gProfitBuffType.qi_defend_add] = ResDefineUtil.ui_resource_icon_small[11]
gProfitBuffTypeIconSmall[gProfitBuffType.qi_intel_add] = ResDefineUtil.ui_resource_icon_small[12]
gProfitBuffTypeIconSmall[gProfitBuffType.qi_speed_add] = ResDefineUtil.ui_resource_icon_small[13]
gProfitBuffTypeIconSmall[gProfitBuffType.money_add] = ResDefineUtil.ui_resource_icon_small[5]
gProfitBuffTypeIconSmall[gProfitBuffType.building_speed_add] = ResDefineUtil.ui_resource_icon_small[8]

cc.exports.gProfitBuffTypeIconBig = {}
gProfitBuffTypeIconBig[gProfitBuffType.wood_add] = ResDefineUtil.ui_resource_icon_big[12]
gProfitBuffTypeIconBig[gProfitBuffType.stone_add] = ResDefineUtil.ui_resource_icon_big[13]
gProfitBuffTypeIconBig[gProfitBuffType.iron_add] = ResDefineUtil.ui_resource_icon_big[14]
gProfitBuffTypeIconBig[gProfitBuffType.food_add] = ResDefineUtil.ui_resource_icon_big[15]
gProfitBuffTypeIconBig[gProfitBuffType.building_speed_add] = ResDefineUtil.ui_resource_icon_big[11]



--资源索引定义 1 木材，2 石头，3 铁块，4 粮食，5 钱
cc.exports.resType = {
	wood = 1,	--木
	stone = 2,	--石
	iron = 3,	--铁
	food = 4,	--粮
	money = 5,	--铜钱
	hero = 8,	--卡牌
	gold = 99,	--元宝
	sameNameHero = 16,		--同名武将卡
	buildingQueue = 13,		--建筑队列
	renown = 11,			--名望
	decree = 17, 			--政令
	skills = 18, 			--技巧值
	profit_buf = 20,		--收益buff
	card_extract = 14,		--卡包
	exp_roll = 12, 			--经验卡包
	wu_xun = 23, 			--武勋
	res_pack = 24, 			--资源包（木石铁粮）
}


cc.exports.gResTypeIconSmall = {}
gResTypeIconSmall[resType.wood] = ResDefineUtil.ui_resource_icon_small[1]
gResTypeIconSmall[resType.stone] = ResDefineUtil.ui_resource_icon_small[3]
gResTypeIconSmall[resType.iron] = ResDefineUtil.ui_resource_icon_small[2]
gResTypeIconSmall[resType.food] = ResDefineUtil.ui_resource_icon_small[4]
gResTypeIconSmall[resType.money] = ResDefineUtil.ui_resource_icon_small[5]
gResTypeIconSmall[resType.gold] = ResDefineUtil.ui_resource_icon_small[6]
gResTypeIconSmall[resType.decree] = ResDefineUtil.ui_resource_icon_small[7]
gResTypeIconSmall[resType.hero] = ResDefineUtil.ui_resource_icon_small[9]
gResTypeIconSmall[resType.card_extract] = ResDefineUtil.ui_resource_icon_small[9]
gResTypeIconSmall[resType.skills] = ResDefineUtil.ui_res_icon[18]
gResTypeIconSmall[resType.exp_roll] = ResDefineUtil.ui_resource_icon_small[14]
gResTypeIconSmall[resType.wu_xun] = ResDefineUtil.ui_resource_icon_small[23]
gResTypeIconSmall[resType.res_pack] = ResDefineUtil.ui_resource_icon_small[24]

cc.exports.gResTypeIconBig = {}
gResTypeIconBig[resType.wood] = ResDefineUtil.ui_resource_icon_big[1]
gResTypeIconBig[resType.stone] = ResDefineUtil.ui_resource_icon_big[2]
gResTypeIconBig[resType.iron] = ResDefineUtil.ui_resource_icon_big[3]
gResTypeIconBig[resType.food] = ResDefineUtil.ui_resource_icon_big[4]
gResTypeIconBig[resType.money] = ResDefineUtil.ui_resource_icon_big[5]
gResTypeIconBig[resType.gold] = ResDefineUtil.ui_resource_icon_big[6]
gResTypeIconBig[resType.skills] = ResDefineUtil.ui_resource_icon_big[8]
gResTypeIconBig[resType.renown] = ResDefineUtil.ui_resource_icon_big[9]
gResTypeIconBig[resType.decree] = ResDefineUtil.ui_resource_icon_big[10]
gResTypeIconBig[resType.wu_xun] = ResDefineUtil.ui_resource_icon_big[23]
gResTypeIconBig[resType.res_pack] = ResDefineUtil.ui_resource_icon_big[24]

--城市城防对应的等级
cc.exports.cityConvertToLevel = {2,4,6,8,10}
--要塞城防对应的等级
cc.exports.yaosaiConvertToLevel = {2,3,3,5,7}
-- 城防建筑（警戒所兵力配置）
cc.exports.cfgbuildingDefenceTroops = {500,700,900,1200,1500,1700,1900,2100,2300,2500}
-- 城防建筑（鹿寨兵力配置）
cc.exports.luzhaiDefenceTroops = {0,0,0,0,500,700,900,1200,1500}

cc.exports.specialCallDefine = {
						xinshouyindao = 2,
						mingjiang = 801
}

--[[
0:无主的废墟， 1:玩家主城, 2：玩家领地, 3：玩家分城, 4:要塞,5:玩家城区, 6:码头,7:npc城区,8:npc城,9:npc要塞
public static byte CITY_TYPE_PLAYER_MAIN_CITY = 1;
public static byte CITY_TYPE_PLAYER_LAND = 2;
public static byte CITY_TYPE_PLAYER_BRANCH_CITY = 3;
public static byte CITY_TYPE_PLAYER_FORT = 4;
public static byte CITY_TYPE_PLAYER_SUBURB = 5;
public static byte CITY_TYPE_NPC_HARBOR = 6;
public static byte CITY_TYPE_NPC_SUBURB = 7;
public static byte CITY_TYPE_NPC_CITY = 8;
public static byte CITY_TYPE_NPC_FORT = 9;
public static byte CITY_TYPE_PLAYER_SHI_GONG_SUO = 10;
public static byte CITY_TYPE_PLAYER_CHI_HOU_YING = 11;
public static byte CITY_TYPE_PLAYER_BIG_FORT = 12;
public static byte CITY_TYPE_PLAYER_LU_ZHAI = 13;
public static byte CITY_TYPE_PLAYER_LIAO_WANG_TA = 14;
public static byte CITY_TYPE_MAX = 30;
--]]


cc.exports.cityTypeDefine = {
	own_free = 0,
	zhucheng = 1,
	lingdi = 2,
	fencheng = 3,
	yaosai = 4,
	player_chengqu = 5,
	matou = 6,
	npc_chengqu = 7,
	npc_cheng = 8,
	npc_yaosai = 9,
	shi_gong_suo = 10,
	chi_hou_ying = 11,
	big_yaosai = 12,
	lu_zhai = 13,
	liao_wang_ta = 14,
	bandit_city = 15, -- 流浪军
	npc_battle_field = 20, -- 战场
}

-- 是不是科技特有的建筑类型
function cc.exports.gCheckIsTechCityType(city_type)
	if (city_type == cityTypeDefine.shi_gong_suo or
		city_type == cityTypeDefine.chi_hou_ying or
		city_type == cityTypeDefine.big_yaosai or
		city_type == cityTypeDefine.lu_zhai or
		city_type == cityTypeDefine.liao_wang_ta) then 
		return true 
	else
		return false
	end
end

cc.exports.cityTypeSortTable = {}
cityTypeSortTable[cityTypeDefine.bandit_city] = 0
cityTypeSortTable[cityTypeDefine.zhucheng] = 1
cityTypeSortTable[cityTypeDefine.fencheng] = 2
cityTypeSortTable[cityTypeDefine.yaosai] = 3
cityTypeSortTable[cityTypeDefine.npc_yaosai] = 4
cityTypeSortTable[cityTypeDefine.lingdi] = 5
cityTypeSortTable[cityTypeDefine.player_chengqu] = 6
cityTypeSortTable[cityTypeDefine.matou] = 7
cityTypeSortTable[cityTypeDefine.npc_chengqu] = 8
cityTypeSortTable[cityTypeDefine.npc_cheng] = 9
cityTypeSortTable[cityTypeDefine.chi_hou_ying] = 10
cityTypeSortTable[cityTypeDefine.big_yaosai] = 11
cityTypeSortTable[cityTypeDefine.lu_zhai] = 12
cityTypeSortTable[cityTypeDefine.liao_wang_ta] = 13
cityTypeSortTable[cityTypeDefine.shi_gong_suo] = 14
cityTypeSortTable[cityTypeDefine.npc_battle_field] = 15
cityTypeSortTable[cityTypeDefine.own_free] = 16



cc.exports.cityTypeName = {}
cityTypeName[cityTypeDefine.own_free] = languagePack["cityTypeName_own_free"]
cityTypeName[cityTypeDefine.zhucheng] = languagePack["cityTypeName_zhucheng"]
cityTypeName[cityTypeDefine.lingdi] = languagePack["cityTypeName_lingdi"]
cityTypeName[cityTypeDefine.fencheng] = languagePack["cityTypeName_fencheng"]
cityTypeName[cityTypeDefine.yaosai] = languagePack["cityTypeName_yaosai"]
cityTypeName[cityTypeDefine.matou] = languagePack["cityTypeName_matou"]
cityTypeName[cityTypeDefine.npc_chengqu] = languagePack["cityTypeName_cunzhuang"]
cityTypeName[cityTypeDefine.npc_cheng] = languagePack["cityTypeName_npc_cheng"]
cityTypeName[cityTypeDefine.player_chengqu] = languagePack["cityTypeName_player_chengqu"]
cityTypeName[cityTypeDefine.shi_gong_suo] = languagePack["cityTypeName_shigongsuo"]
cityTypeName[cityTypeDefine.chi_hou_ying] = languagePack["cityTypeName_chihouying"]
cityTypeName[cityTypeDefine.big_yaosai] = languagePack["cityTypeName_dayaosai"]
cityTypeName[cityTypeDefine.lu_zhai] = languagePack["cityTypeName_luzhai"]
cityTypeName[cityTypeDefine.liao_wang_ta] = languagePack["cityTypeName_liaowangta"]
cityTypeName[cityTypeDefine.bandit_city] = languagePack['cityTypeName_liulangjun'] 
cityTypeName[cityTypeDefine.npc_battle_field] = languagePack['cityTypeName_npcBattleField']
--地图地块同自己的关系	
--0 无主 1 自己 2 自由状态-盟友 3 自由状态-下属 4 自由状态-敌对 5 附属状态-上级 6 附属状态-同上级 7 附属状态-敌对 8 附属状态-无主
cc.exports.mapAreaRelation = {	all_free = 0,
					own_self = 1,
					free_ally = 2,
					free_underling = 3,
					free_enemy = 4,
					attach_higher_up = 5,
					attach_same_higher = 6,
					attach_enemy = 7,
					attach_free = 8
				}
cc.exports.mapAreaRelationName = {}
mapAreaRelationName[mapAreaRelation.all_free] = languagePack["mapAreaRelationName_all_free"]
mapAreaRelationName[mapAreaRelation.own_self] = languagePack["mapAreaRelationName_own_self"]
mapAreaRelationName[mapAreaRelation.free_ally] = languagePack["mapAreaRelationName_free_ally"]
mapAreaRelationName[mapAreaRelation.free_underling] = languagePack["mapAreaRelationName_free_underling"]
mapAreaRelationName[mapAreaRelation.free_enemy] = languagePack["mapAreaRelationName_free_enemy"]
mapAreaRelationName[mapAreaRelation.attach_higher_up] = languagePack["mapAreaRelationName_attach_higher_up"]
mapAreaRelationName[mapAreaRelation.attach_same_higher] = languagePack["mapAreaRelationName_attach_same_higher"]
mapAreaRelationName[mapAreaRelation.attach_enemy] = languagePack["mapAreaRelationName_attach_enemy"]
mapAreaRelationName[mapAreaRelation.attach_free] = languagePack["mapAreaRelationName_attach_free"]

cc.exports.mapRelationColor = {}
mapRelationColor[mapAreaRelation.own_self] = {
	"green_1.png",
	"green_2.png"
}
mapRelationColor[mapAreaRelation.free_ally] = {
	"blue_1.png",
	"blue_2.png"
}
mapRelationColor[mapAreaRelation.attach_same_higher] = {
	"purple_1.png",
	"purple_2.png"
}
mapRelationColor[mapAreaRelation.attach_higher_up] = {
	"purple_1.png",
	"purple_2.png"
}
mapRelationColor[mapAreaRelation.free_underling] = {
	"yellow_1.png",
	"yellow_2.png"
}
mapRelationColor[mapAreaRelation.free_enemy] = {
	"red_1.png", 
	"red_2.png"
}
mapRelationColor[mapAreaRelation.attach_enemy] = {
	"red_1.png", 
	"red_2.png"
}

--地图建筑（归属权归同盟）
function cc.exports.isOwnLeague(cityType)
	return cityType == cityTypeDefine.npc_cheng
end

--领地/个人建筑（归属权归个人）
function cc.exports.isOwnPerson(cityType)
	return (not isOwnLeague(cityType))
end

cc.exports.numOrderList = {
				languagePack["one"], languagePack["two"], languagePack["three"], 
				languagePack["four"], languagePack["five"], languagePack["six"], 
				languagePack['seven'], languagePack['eight'], languagePack['nine'],
				languagePack['ten']
				}

--城市状态 0：正常，1：正在建，2：正在拆
cc.exports.cityState = {normal = 0, building = 1, removing = 2}

cc.exports.armyIconState = {
	move_icon = 1, 				--行军
	return_icon = 2, 			--返回
	reside_icon = 3, 			--驻守
	normal_icon = 4, 			--待命
	zb_icon = 5, 				--征兵
	hurt_icon = 6, 				--重伤
	pilao_icon = 7, 			--疲劳
	diaodong_icon = 8, 			--调动
	jijie_icon = 9, 			--集结
	liaowang_icon = 30, 		--瞭望  (历史问题，从30开始)
	xiubu_icon = 31, 			--修补
	maifu_icon = 32, 			--埋伏
}

-- army表中target_type字段含义 目的地类型：0普通、1地表事件、2屯田、3新手、4练兵、5修补、6瞭望
cc.exports.armyTargetTypeList = {
	normal = 0,
	dibiao_event = 1,
	tuntian = 2,
	xinshou = 3,
	lianbing = 4,
	xiubu = 5,
	liaowang = 6
}

--部队状态 
cc.exports.armyState = {
	normal 		= 0, 	-- 正常
	chuzhenging = 1, 	-- 出征中
	zhuzhaing 	= 2, 	-- 驻扎路上(调动)
	yuanjuning 	= 3, 	-- 援军路上(驻守)
	returning 	= 4,  	-- 返回中
	zhuzhaed 	= 5,   	-- 驻扎
	yuanjuned 	= 6,  	-- 援军
	sleeped 	= 7,    -- 战间休息
	decreed 	= 8,    -- 屯田
	training 	= 9,	-- 练兵
	STATE_GROUP_WAITING 		= 10, 	-- 军团稳定
	STATE_GROUP_FIGHTING 		= 11, 	-- 军团第一块地战斗
	STATE_GROUP_MARCH_GOING_1 	= 12, 	-- 去往集结点路上 
	STATE_GROUP_BACK_ING_1 		= 13, 	-- 从集结点返回出发点
	STATE_GROUP_MARCH_GOING_2 	= 14, 	-- 从集结点二次出征
	STATE_GROUP_BACK_ING_2 		= 15, 	-- 从二次出征点返回集结点
	STATE_REPAIRING  	= 16, 	-- 科技-部队调动-修补
	STATE_WATCHING 		= 17, 	-- 科技-部队调动-瞭望
}

--[[
	public static byte STATE_NORMAL = 0;//正常
	public static byte STATE_MARCH_GOING = 1;//出征中 
	public static byte STATE_RESIDE_GOING = 2;//驻扎路上
	public static byte STATE_REINFORCE_GOING = 3;//援军路上
	public static byte STATE_BACK_ING = 4;//返回中
	public static byte STATE_RESIDE = 5;//驻扎
	public static byte STATE_REINFORCE = 6;//援军
	public static byte STATE_FIGHTING = 7;//集结点战斗
	public static byte STATE_WAITING = 8;//二次目标战斗
--]]
cc.exports.legionState = {normal = 0, chuzhenging = 1, zhuzhaing = 2, yuanjuning = 3, returning = 4, zhuzhaed = 5, yuanjuned = 6, fighting = 7,waiting = 8}

--武将状态，0：正常，1：征兵中 3：锁定 
cc.exports.cardState = {normal = 0, zhengbing = 1, lock = 3}

--武将品质
cc.exports.cardQuality = {one_star = 0, two_star = 1, three_star = 2, four_star = 3, five_star = 4}

--武将招募类型 共享，激活，每日次数用完，未开放
cc.exports.cardCallType = {share = 1, actived = 2, no_daily = 3, unopen = 4}

--建筑状态 0：正常， 1：升级， 2：拆除
cc.exports.buildState = {normal = 0, upgrade = 1, demolition = 2}

--科技状态 0；正常， 1：升级
cc.exports.techState = {normal = 0, upgrade = 1}

-- public static byte STATE_NORMAL = 0 正常;  
-- 	public static byte STATE_MARCH_GOING = 1 出征中;
-- 	public static byte STATE_RESIDE_GOING = 2 驻扎路上(调动);
-- 	public static byte STATE_REINFORCE_GOING = 3 援军路上(驻守);
-- 	public static byte STATE_BACK_ING = 4 返回中;
-- 	public static byte STATE_RESIDE = 5 驻扎;
-- 	public static byte STATE_REINFORCE = 6 援军;
-- 	public static byte STATE_FIGHTING = 7 集结点战斗;
-- 	public static byte STATE_WAITING = 8 二次目标战斗;
cc.exports.armyGroupState = {STATE_NORMAL = 0, STATE_MARCH_GOING = 1, STATE_RESIDE_GOING = 2, STATE_REINFORCE_GOING = 3, STATE_BACK_ING = 4,
					STATE_RESIDE = 5, STATE_REINFORCE = 6, STATE_FIGHTING = 7, STATE_WAITING = 8}


-- 兵系
cc.exports.heroTypeSeries = {
	gong = 1,
	bu = 2,
	qi = 3,
}
cc.exports.heroTypeSeriesName = {}
heroTypeSeriesName[heroTypeSeries.gong] = languagePack['heroTypeSeriesName_1']
heroTypeSeriesName[heroTypeSeries.bu] = languagePack['heroTypeSeriesName_2']
heroTypeSeriesName[heroTypeSeries.qi] = languagePack['heroTypeSeriesName_3']

--武将类型 1 弓兵；2 枪兵；3 骑兵
cc.exports.heroType = {
	archer = 1, 
	spearman = 2, 
	sowar = 3,

	gong_bing = 1,
	chang_gong_bing = 11,
	nu_bing = 21,
	si_shi = 31,
	lian_nu_bing = 41,
	

	bu_bing = 2,
	zhong_bu_bing = 12,
	chang_qiang_bing = 22,
	jin_jun = 32,
	teng_jia_bing = 42,
	man_bing = 52,

	qi_bing = 3,
	zhong_qi_bing = 13,
	qing_qi_bing = 23,
	gong_qi_bing = 33,
	tie_qi_bing = 43,
	xiang_bing = 53,
	
}

cc.exports.taskAwardType = {
	TYPE_CARD_EXTRACT_MODE = 1,-- 获取武将卡新的招募方式 
	TYPE_BUILD_QUEUE = 2,-- 获取新的建筑队列
	TYPE_GOLD = 3,-- 获取金
	TYPE_CARD_HERO = 4,--获取新的武将,
	TYPE_NEW_SKILL = 5, -- 获取新战法
}

--国家类型
cc.exports.countryType = {han = 1, wei = 2, shu = 3, wu = 4, qun = 5}
cc.exports.countryNameDefine = {
	languagePack["countryName_1"],
	languagePack["countryName_2"],
	languagePack["countryName_3"],
	languagePack["countryName_4"],
	languagePack["countryName_5"],
}
--（技能类型）1：被动技，2：战前技，3：攻前技，4：攻后技，5：军师加成，
--61：建筑加成一，62：建筑加成二，7：国家加成，8：兵种加成，9：称号加成，10：兵种相克
cc.exports.heroSkillTypeName = {}
heroSkillTypeName[1] = languagePack["heroSkillTypeName_1"]
heroSkillTypeName[2] = languagePack["heroSkillTypeName_2"]
heroSkillTypeName[3] = languagePack["heroSkillTypeName_3"]
heroSkillTypeName[4] = languagePack["heroSkillTypeName_4"]
heroSkillTypeName[5] = languagePack["heroSkillTypeName_5"]
heroSkillTypeName[61] = languagePack["heroSkillTypeName_61"]
heroSkillTypeName[62] = languagePack["heroSkillTypeName_62"]
heroSkillTypeName[7] = languagePack["heroSkillTypeName_7"]
heroSkillTypeName[8] = languagePack["heroSkillTypeName_8"]
heroSkillTypeName[9] = languagePack["heroSkillTypeName_9"]
heroSkillTypeName[10] = languagePack["heroSkillTypeName_10"]

cc.exports.skillLimitForCounsellor = {
	languagePack["skillLimitForCounsellor_1"],
	languagePack["skillLimitForCounsellor_2"],
	languagePack["skillLimitForCounsellor_3"],
}

cc.exports.skillUseRateInfo = {
	languagePack["skillUserRate_1"],
	languagePack["skillUserRate_2"],
	languagePack["skillUserRate_3"],
	languagePack["skillUserRate_4"],
}


function cc.exports.get_skill_attack_des(attack_type, select_type, attack_max)
	local dst_content = " "
	local dis_content = " "
	if attack_type == 0 then
		dst_content = languagePack["skillAttackDes_1"]
	elseif attack_type == 11 then
		dst_content = languagePack["skillAttackDes_2"]
	elseif attack_type == 21 then
		dst_content = languagePack["skillAttackDes_3"]
	elseif attack_type == 41 then
		dst_content = languagePack["skillAttackDes_4"]
	elseif attack_type == 23 then
		if select_type == 0 then
			--当配置表中的目标类型为 随机 时，目标后的括号内说明文字新增加一类：有效距离内n个目标
			dst_content = languagePack["skillAttackDes_5"]
			dis_content = languagePack["skillAttackDes_15"] .. attack_max .. languagePack["skillAttackDes_14"]
		elseif select_type == 34 then
			dst_content = languagePack["skillAttackDes_6"]
			dis_content = languagePack["skillAttackDes_12"]
		else
			dst_content = languagePack["skillAttackDes_6"]
			dis_content = languagePack["skillAttackDes_13"] .. attack_max .. languagePack["skillAttackDes_14"]
		end
	elseif attack_type == 13 then
		if select_type == 0 then
			--当配置表中的目标类型为 随机 时，目标后的括号内说明文字新增加一类：有效距离内n个目标
			dst_content = languagePack["skillAttackDes_7"]
			dis_content = languagePack["skillAttackDes_15"] .. attack_max .. languagePack["skillAttackDes_14"]
		elseif select_type == 34 then
			dst_content = languagePack["skillAttackDes_8"]
			dis_content = languagePack["skillAttackDes_12"]
		else
			dst_content = languagePack["skillAttackDes_8"]
			dis_content = languagePack["skillAttackDes_13"] .. attack_max .. languagePack["skillAttackDes_14"]
		end
	elseif attack_type == 43 then
		if select_type == 0 then
			--当配置表中的目标类型为 随机 时，目标后的括号内说明文字新增加一类：有效距离内n个目标
			dst_content = languagePack["skillAttackDes_9"]
			dis_content = languagePack["skillAttackDes_15"] .. attack_max .. languagePack["skillAttackDes_14"]
		elseif select_type == 34 then
			dst_content = languagePack["skillAttackDes_10"]
			dis_content = languagePack["skillAttackDes_12"]
		else
			dst_content = languagePack["skillAttackDes_10"]
			dis_content = languagePack["skillAttackDes_13"] .. attack_max .. languagePack["skillAttackDes_14"]
		end
	elseif attack_type == 99 then
		dst_content = languagePack["skillAttackDes_11"]
	end

	return dst_content, dis_content
end

cc.exports.cityTechBuildDefine = {}
cityTechBuildDefine[cityTypeDefine.shi_gong_suo] = {
	[5] = 15,
	[6] = 16,
	[7] = 17,
	[8] = 18,
	[9] = 19,
}
cityTechBuildDefine[cityTypeDefine.chi_hou_ying] = {
	[5] = 46,
	[6] = 47,
	[7] = 48,
	[8] = 49,
	[9] = 50,
}
cityTechBuildDefine[cityTypeDefine.big_yaosai] = {
	[5] = 76,
	[6] = 77,
	[7] = 78,
	[8] = 79,
	[9] = 80,
}
cityTechBuildDefine[cityTypeDefine.lu_zhai] = {
	[5] = 71,
	[6] = 72,
	[7] = 73,
	[8] = 74,
	[9] = 75,
}
cityTechBuildDefine[cityTypeDefine.liao_wang_ta] = {
	[5] = 70,
	[6] = 70,
	[7] = 70,
	[8] = 70,
	[9] = 70,
}

function cc.exports.gCheckIsTechBuildFort(bid)
	local ret = false
	for k,v in pairs(cityTechBuildDefine) do 
        for kk,vv in pairs(v) do 
            if bid == vv then 
                ret = true
                break
            end
        end
    end
    return ret
end


cc.exports.cityBuildDefine = {
					chengzhufu = 10,
					baolei = 11,
					dudufu = 12,
					minju = 13,
					cangku = 20,
					famuchang = 21,
					caishichang = 22,
					liantiechang = 23,
					mofang = 24,
					jishi = 25,
					bingying = 30,
					handian = 31,
					weidian = 32,
					shudian = 33,
					wudian = 34,
					qunxiongdian = 35,
					yubeisuo = 36,
					mubingsuo = 37,
					jiaochang = 40,
					dianjiangtai = 42,
					shejitan = 43,
					fengshantai = 44,
					shangwuying = 51,
					tiebiying = 52,
					junjiying = 53,
					jifengying = 54,
					chengqiang_1 = 61,
					fenghuotai = 63,
					wushenjuxiang_1 = 64,
					shapanzhentu_1 = 65,
					jingjiesuo = 66,
					nv_qiang = 62,
					qianzhuang = 81,
					jigongsuo = 82,
					talou = 83,
					jiuguan = 84,
					chengduo = 86,
}



cc.exports.techDefine = {
				lingdifangyu = 1,
				huchenghe = 2,
				jingjiesuoqianghua = 3,
				huchengheqianghua = 4,
				shoujiangfu = 5,
				liaowangta = 6,
				buduiliaowang = 7,
				maifu = 8,
				jinjieqianghua = 9,

				shigongsuo = 101,
				zhushouqianghua = 102,
				shigongsuoqianghua = 103,
				xiubu = 104,
				chihouyingdi = 105,
				chihouqianghua = 106,
				weizhuang = 107,
				xiubuqianghua = 108,
				luzhai = 109,
				luzhaiqianghua = 110,
				luzhaizhiyuan = 111,
				liaowangqianghua = 112,
				daxingyaosai = 113,
				daxingyaosaiqianghua = 114,
				daxingyaosaifangyu = 115,
}

--卡牌需要显示的状态
cc.exports.heroStateDefine = {
	not_deploy = 1, 			-- 不能配置
	other_place = 2, 			-- 其他地方
	chuzheng = 3, 				-- 出征
	returning = 4,  			-- 返回
	yuanjun = 5, 				-- 援军
	zhuzha = 6,  				-- 驻扎
	zengbing = 7, 				-- 征兵中
	zjsleep = 8, 				-- 战间休息
	inarmy = 9,					-- 部队中
	hurted = 10, 				-- 重伤中
	selected_nomal = 11, 		-- 正常选中状态
	selected_attention = 12,	-- 被选中但需要玩家注意
	no_energy = 13, 			-- 体力不足
	prepare = 14, 				-- 队伍中有武将处于征兵、重伤、体力不足的状态 
	unnormal = 15, 				-- 部队不在正常状态下
	shoujiang = 16, 			-- 城市守军
}
--卡牌属性索引定义
cc.exports.heroPorpDefine = {attack = 1, defence = 2, intel= 3, speed = 4, destroy = 5, hit = 6}
--颜色RGB以及显示文字
cc.exports.fightPowerEstimate = {
						{125, 187, 139, languagePack["fightPowerEstimate_1"]},
						{255, 243, 195, languagePack["fightPowerEstimate_2"]},
						{219, 173, 100, languagePack["fightPowerEstimate_3"]},
						{168, 76, 76, languagePack["fightPowerEstimate_4"]},
						--地表事件卡包和经验卡
						{125,187,139,languagePack["fightPowerEstimate_5"]},
						--领地数上限
						{168,73,75,languagePack["fightPowerEstimate_6"]},
						{168,73,75,languagePack["fightPowerEstimate_7"]},
						--对NPC城市、*敌方*玩家的领地（包括城市、要塞、领地）
						--和野外建筑出征时的战力评价统一写成“敌情难测，请斟酌行事”
						--（字体颜色：fdd75c）；
						{253,215,92,languagePack["fightPowerEstimate_8"]},
						{168,73,75,languagePack["fightPowerEstimate_9"]},
						{168,73,75,languagePack["fightPowerEstimate_10"]},
						{168,73,75,languagePack["fightPowerEstimate_11"]},
						--地表事件贼兵
						{168,73,75,languagePack["fightPowerEstimate_12"]},
						{253,215,92,languagePack["fightPowerEstimate_13"]},
					}

--地表事件的定义
cc.exports.GROUND = {
	FIELD_EVENT_CARD  = 1,
	FIELD_EVENT_EXP = 2,
	FIELD_EVENT_THIEF = 3,
	FIELD_EVENT_EXP_BLACK_MARKET = 4,
}


--消费类型 5 铜钱 99 元宝
cc.exports.consumeType = {common_money = 5, yuanbao = 99}
--玩家物品类型 1虎符·汉、2虎符·魏、3虎符·蜀、4虎符·吴、6虎符·群、7将军印
cc.exports.itemType = {hufu_han = 1, hufu_wei = 2, hufu_shu = 3, hufu_wu = 4, hufu_qun = 6, jiangjunyin = 7}

-- /** 盟主 */
-- 	public static final int UNION_OFFICIAL_ID_LEADER = 1
-- 	/** 副盟主 */
-- 	public static final int UNION_OFFICIAL_ID_VICE_LEADER = 2
-- 	/** 林掾史 */
-- 	public static final int UNION_OFFICIAL_ID_LINYUANSHI = 3
-- 	/** 石坊令 */
-- 	public static final int UNION_OFFICIAL_ID_SHIFANGLING = 4
-- 	/** 武库史 */
-- 	public static final int UNION_OFFICIAL_ID_WUKUSHI = 5
-- 	/** 籍田令 */
-- 	public static final int UNION_OFFICIAL_ID_JITIANLING = 6
-- 	/** 监市吏 */
-- 	public static final int UNION_OFFICIAL_ID_JIANSHILI = 7
-- 	/** 黄门中丞 */
-- 	public static final int UNION_OFFICIAL_ID_HUANGMENZHONGCHENG = 8
-- 	/** 西园廷卫 */
-- 	public static final int UNION_OFFICIAL_ID_XIYUANTINGWEI = 9
-- 	/** 兵曹 */
-- 	public static final int UNION_OFFICIAL_ID_BINGCAO = 10
-- 	/** 祭酒 */
-- 	public static final int UNION_OFFICIAL_ID_JIJIU = 11



cc.exports.resNameDefine = {}
resNameDefine[1] = languagePack["mucai"]
resNameDefine[2] = languagePack["shikuai"]
resNameDefine[3] = languagePack["tiekuai"]
resNameDefine[4] = languagePack["liangshi"]
--战斗和邮件附件掉落
-- // 资源、奖励（类别奖励的配置方式：具体物品id * 100 + 类别id）
-- 	/** 木 */
-- 	public static final int RES_ID_WOOD = 1;
-- 	/** 石 */
-- 	public static final int RES_ID_STONE = 2;
-- 	/** 铁 */
-- 	public static final int RES_ID_IRON = 3;
-- 	/** 粮 */
-- 	public static final int RES_ID_FOOD = 4;
-- 	/** 钱 */
-- 	public static final int RES_ID_MONEY = 5;
-- 	/** 资源类 */
-- 	public static final int RES_ID_RES_TYPE = 6;
-- 	/** 经验 */
-- 	public static final int RES_ID_EXP = 7;
-- 	/** 卡牌类 */
-- 	public static final int RES_ID_HERO = 8;
-- 	/** 道具类 */
-- 	public static final int RES_ID_ITEM = 9;
-- 	/** 预备兵 */
-- 	public static final int RES_ID_REDIF = 10;
-- 	/** 名望 */
-- 	public static final int RES_ID_RENOWN = 11;
-- 	/** 增加所有部队的cost上限 */
-- 	public static final int RES_ID_ARMY_COST = 12;
-- 	/** 建筑队列 */
-- 	public static final int RES_ID_BUILD_QUEUE = 13;
-- 	/** 卡包类（抽卡方式） */
-- 	public static final int RES_ID_CARD_EXTRACT = 14;
-- 	/** 开放内政 */
-- 	public static final int RES_ID_INTERNAL_AFFAIRS = 15;
-- 	/** 同名武将卡 */
-- 	public static final int RES_ID_SAME_NAME_HERO = 16;
-- /** 战法类 */
-- 	public static final int RES_ID_SKILL = 19;
-- /** 卡牌选择   card_select_id * 100 + 21*/
--  public static final int RES_ID_CARD_SELECT = 21;
-- 	/** 元宝  */
-- 	public static final int RES_ID_YUAN_BAO = 99;
cc.exports.dropType = {
				RES_ID_WOOD = 1,
				RES_ID_STONE = 2,
				RES_ID_IRON = 3,
				RES_ID_FOOD = 4,
				RES_ID_MONEY = 5,--// 1表示木材，2石头，3铁块，4粮食，5钱
				RES_ID_RES_TYPE = 6,--// 资源类
				RES_ID_EXP = 7,--// 经验
				RES_ID_HERO = 8,--// 英雄
				RES_ID_ITEM = 9,--// 道具
				RES_ID_REDIF = 10,--// 预备兵
				RES_ID_RENOWN = 11,--// 名望
				RES_ID_COUPON = 12,--// 礼券
				RES_ID_QUEUE = 13,
				RES_ID_CARD_EXTRACT = 14,
				RES_ID_INTERNAL_AFFAIRS = 15,
				RES_ID_DECREE = 17,--政令
				-- RES_ID_SAME_NAME_HERO = 16,
				RES_ID_SKILL = 19, --战法
				RES_ID_CARD_SELECT = 21, --卡牌选择
				RES_ID_YUAN_BAO = 99,--// 元宝
}

cc.exports.rewardName = {
				[1] = languagePack["mucai"],
				[2] = languagePack["shikuai"],
				[3] = languagePack["tiekuai"],
				[4] = languagePack["liangshi"],
				[5] = languagePack["tongqian"],
				[7] = languagePack["jingyan"],
				[10] = languagePack["tongzhidian"],
				[11] = languagePack["mingwang"],
				[12] = languagePack["liquan"],
				[13] = languagePack["jianzhuduilie"],
				[14] = languagePack["xinchouka"],
				[17] = languagePack["zhengling"],
				[18] = languagePack["jiqiao"],
				[99] = languagePack["jin"],
				[23] = languagePack["wuxun"],
				[24] = languagePack["res_pack"],
}

--所有掉落的小图标名字
cc.exports.itemTextureName = ResDefineUtil.ui_res_icon

--战斗结果定义
cc.exports.REPORT_RESULT = {FALSE = 0, WIN_NO_RESULT = 1, SUC_OCCP = 2, UNION_OCCP = 3, FUSHU = 4, JIEJIU = 5,
				 PINGJU = 6, ALLDIE = 7, DRAWfAIL = 8, NOWAR = 9, DESTORY = 10, REPRESS_SUC = 11}
--攻方
cc.exports.REPORT_STR = {  
				[2] = languagePack["REPORT_STR_2"],
				[3] = languagePack["REPORT_STR_3"],
				[4] = languagePack["REPORT_STR_4"],
				[5] = languagePack["REPORT_STR_5"],
				[10] = languagePack["REPORT_STR_10"],
				[11] = languagePack["REPORT_STR_11"],
			}
--守方
cc.exports.REPORT_DEF_STR = {
				[2] = languagePack["REPORT_DEF_STR_2"],
				[3] = languagePack["REPORT_DEF_STR_3"],
				[4] = languagePack["REPORT_DEF_STR_4"],
				[5] = languagePack["REPORT_DEF_STR_5"],
				[11] = languagePack["REPORT_DEF_STR_11"],
}

--攻方文字战报结果说明
cc.exports.REPORT_ACT_ = {
				[1] = languagePack["REPORT_ACT_1"],
				[2] = languagePack["REPORT_ACT_2"],
				[3] = languagePack["REPORT_ACT_3"],
				[4] = languagePack["REPORT_ACT_4"],
				[5] = languagePack["REPORT_ACT_5"],
				[10] = languagePack["REPORT_ACT_10"],
}

--守方文字战报结果说明
cc.exports.REPORT_DEF_ = {
				[1] = languagePack["REPORT_DEF_1"],
				[2] = languagePack["REPORT_DEF_2"],
				[3] = languagePack["REPORT_DEF_3"],
				[4] = languagePack["REPORT_DEF_4"],
				[5] = languagePack["REPORT_DEF_5"],
				[10] = languagePack["REPORT_DEF_10"],
}


-- `task_type`'任务类型：1＝主线、2＝每日、3＝活动',
cc.exports.taskType = {
	languagePack["taskType_1"],
	languagePack["taskType_2"],
	languagePack["taskType_3"]
}

--建筑提示对应的名字
cc.exports.buildingInclude = { 
	[1] = {name={languagePack["buildingName_10"],languagePack["buildingName_11"],languagePack["buildingName_12"],languagePack["buildingName_15"]},id = {10,11,12,70,15,16,17,18,19,46,47,48,49,50,71,72,73,74,75,76,77,78,79,80,86}},
	[2] = {name={languagePack["buildingName_2"]},id = {20,21,23,22,24,82,25,81}},
	[3] = {name={languagePack["buildingName_3"]},id = {40,37,54,52,53,51,36,30}},
	[4] = {name={languagePack["buildingName_4"]},id = {42,31,32,33,34,35,84}},
	[5] = {name={languagePack["buildingName_5"]},id = {61,66,63,64,65,83}},
	[6] = {name={languagePack["buildingName_6"]},id = {43}},
	[7] = {name={languagePack["buildingName_7"]},id = {44}},
}

--建筑对应的区域
cc.exports.buildingInArea = {
	[10] = 1,
	[11] = 1,
	[12] = 1,
	[13] = 2,
	[20] = 2,
	[21] = 2,
	[23] = 2,
	[22] = 2,
	[24] = 2,
	[82] = 2,
	[25] = 2,
	[81] = 2,
	[40] = 3,
	[37] = 3,
	[54] = 3,
	[52] = 3,
	[53] = 3,
	[51] = 3,
	[36] = 3,
	[30] = 3,
	[42] = 4,
	[31] = 4,
	[32] = 4,
	[33] = 4,
	[34] = 4,
	[35] = 4,
	[84] = 4,
	[61] = 5,
	[66] = 5,
	[63] = 5,
	[64] = 5,
	[65] = 5,
	[83] = 5,
	[43] = 6,
	[44] = 7,
}

cc.exports.BUILDING_TYPE = {
	[1] = {[33] =1, [34] =1, [35] =1, [36] =1, [37] = 1, [119] =1, [120] = 1},
	[2] = {[89] =1, [90] =1, [91] = 1},
	[3] = {[59] =1, [60] =1, [61] = 1},
	[4] = {[69] =1, [70] =1, [71] = 1},
	[5] = {["zuomen"] =1, ["zuomen2"] = 1},
	[6] = {[109] =1, [110] =1, [111] = 1},
	[7] = {[79] =1, [80] =1, [81] = 1},
}

-- --州首府的唯一id，对应是cfg_world_city的param字段
-- capitalParam = {}
-- capitalParam[10110] = 1
-- capitalParam[12109] = 1
-- capitalParam[14209] = 1
-- capitalParam[17109] = 1
-- capitalParam[19608] = 1
-- capitalParam[22208] = 1
-- capitalParam[24408] = 1
-- capitalParam[26608] = 1
-- capitalParam[29408] = 1
-- capitalParam[31708] = 1
-- capitalParam[33908] = 1
-- capitalParam[36608] = 1
-- capitalParam[39108] = 1

--部队出征或返回的操作名字
cc.exports.armyEnterState = {}
armyEnterState[armyState.chuzhenging] = languagePack["armyEnterState_1"]
armyEnterState[armyState.zhuzhaing] = languagePack["armyEnterState_2"]
armyEnterState[armyState.yuanjuning] = languagePack["armyEnterState_3"]
armyEnterState[armyState.returning] = languagePack["armyEnterState_4"]
armyEnterState[99] = languagePack["armyEnterState_5"]


cc.exports.union_add_defined = {}
union_add_defined["exp_add"] = languagePack["union_add_defined_1"]
union_add_defined["wood_npc_add"] = languagePack["union_add_defined_2"]
union_add_defined["stone_npc_add"] = languagePack["union_add_defined_3"]
union_add_defined["iron_npc_add"] = languagePack["union_add_defined_4"]
union_add_defined["food_npc_add"] = languagePack["union_add_defined_5"]
union_add_defined["gong_attack_add"] = languagePack["union_add_defined_6"]
union_add_defined["gong_defend_add"] = languagePack["union_add_defined_7"]
union_add_defined["gong_intel_add"] = languagePack["union_add_defined_8"]
union_add_defined["qiang_attack_add"] = languagePack["union_add_defined_9"]
union_add_defined["qiang_defend_add"] = languagePack["union_add_defined_10"]
union_add_defined["qiang_intel_add"] = languagePack["union_add_defined_11"]
union_add_defined["qi_attack_add"] = languagePack["union_add_defined_12"]
union_add_defined["qi_defend_add"] = languagePack["union_add_defined_13"]
union_add_defined["qi_intel_add"] = languagePack["union_add_defined_14"]
union_add_defined["money_npc_add"] = languagePack["union_add_defined_15"]
union_add_defined["tech_point_add_base"] = languagePack["union_add_defined_16"]
union_add_defined["tech_point_add"] = languagePack["union_add_defined_17"]



-- 玩家坚守状态
cc.exports.userGuardState = { 
	normal = 0,    -- 正常状态 
	preparing = 1, -- 准备状态
	guarding = 2,  -- 坚守中
	during_cd = 3, -- 冷却CD 中
}


function cc.exports.gGetProfitBuffIcon(buff_type,size_type)
	if not size_type then size_type = gResIconSize.big end
	if size_type == gResIconSize.big then
        return gProfitBuffTypeIconBig[buff_type] 
    elseif size_type == gResIconSize.small then
        return gProfitBuffTypeIconSmall[buff_type] 
    end
end





cc.exports.gResIconSize = {
	small = 1,
	big = 2,
}
--获取资源图标
-- res_id 资源ID 
-- size_type 大小类型
function cc.exports.gGetResIcon(res_id,size_type)
    if not size_type then size_type = gResIconSize.big end

    if res_id % 100 == resType.profit_buf then 
    	local cfgBuff = Tb_cfg_buff[math.floor(res_id / 100)]
    	if not cfgBuff then return nil end
    	return gGetProfitBuffIcon(cfgBuff.buff_type,size_type)
    end

    if size_type == gResIconSize.big then
    	if res_id %100 == resType.hero then 
	        -- 武将卡根据品质来
	        local res_icon_hero = ResDefineUtil.ui_login_res_icon_hero

	        local temp_hero_cfg_id = math.floor(res_id/100)
	        if temp_hero_cfg_id > 10000000 then 
	            temp_hero_cfg_id = math.floor(temp_hero_cfg_id/100)
	        end

	        local basic_hero_info = Tb_cfg_hero[temp_hero_cfg_id]
	        if basic_hero_info then 
	            ret = res_icon_hero[basic_hero_info.quality]
	        else
	            ret = res_icon_hero[0]
	        end
	        return ret
	    elseif res_id % 100 == resType.card_extract then
	        -- 卡包
	        -- res_id = math.floor(res_id / 100)
	        -- local quality = res_id % 10
	        -- ret = ResDefineUtil.ui_card_extract[quality]
	        -- if not ret then 
	        -- 	ret = ResDefineUtil.ui_card_extract[1]
	        -- end
	        -- return ret
	        res_id = math.floor(res_id / 100)
	        local temp_refresh_info = Tb_cfg_card_extract[res_id]
	        local quality = 1
	        if temp_refresh_info then 
	        	quality = temp_refresh_info.color_type
	        end
	        ret = ResDefineUtil.ui_card_extract[quality]
	        return ret
	    elseif res_id % 100 == resType.exp_roll then 
	    	res_id = math.floor(res_id / 100)
	    	local quality = res_id % 10
	    	ret = ResDefineUtil.groundEvent_blackMarket[quality]
	    	if not ret then 
	    		ret = ResDefineUtil.groundEvent_blackMarket[1]
	    	end
	    	return ret
	    else
	    	return gResTypeIconBig[res_id]
	    end
    elseif size_type == gResIconSize.small then
    	if res_id % 100 == resType.hero or 
    		res_id % 100 == resType.card_extract or 
    		res_id % 100 == resType.exp_roll then 
    		res_id = res_id % 100
    	end
    	return gResTypeIconSmall[res_id]
    end
end


function cc.exports.gGetProfitBuffName(buff_type)
	return gProfitBuffTypeName[buff_type] or "unknow"
end



function cc.exports.gGetResName(res_id)
	local ColorUtil = require("game/utils/color_util")
    if res_id % 100 == resType.hero then

    	local temp_hero_cfg_id = math.floor(res_id/100)
        if temp_hero_cfg_id > 10000000 then 
            temp_hero_cfg_id = math.floor(temp_hero_cfg_id/100)
        end
        
        local basic_hero_info = Tb_cfg_hero[temp_hero_cfg_id]
        if basic_hero_info then 
            return ColorUtil.getHeroNameWrite(basic_hero_info.heroid )
        else
            return ""
        end
    elseif res_id % 100 == resType.card_extract then 
    	res_id = math.floor(res_id / 100)
    	if Tb_cfg_card_extract[res_id] then
    		return Tb_cfg_card_extract[res_id].refresh_name
    	else
    		return rewardName[resType.card_extract]
    	end
        -- local quality = res_id % 10
        -- return quality .. languagePack['heroCardLvName'] .. rewardName[resType.card_extract]
        
        
    elseif res_id % 100 == resType.profit_buf then 
    	local res_id = math.floor(res_id / 100)
    	local cfgBuff = Tb_cfg_buff[res_id]
    	if cfgBuff then 
    		return gProfitBuffTypeName[cfgBuff.buff_type] .. languagePack['act_promote']
    	else
    		return "unknow"
    	end
    else
        if rewardName[res_id] then 
            return rewardName[res_id]
        else
            return ""
        end
    end
end



function cc.exports.gIsResOverFlow(res_id)
	if res_id == resType.wood or 
		res_id == resType.stone or 
		res_id == resType.iron or 
		res_id == resType.food then
		local res_cur_nums, res_max_nums, res_add_speed = politics.getResNumsByType(res_id)
		return res_cur_nums >= res_max_nums
	end

	if res_id == resType.decree then 
		local curNum,maxNum = userData.getUserDecreeNum()
		return curNum >= maxNum
	end

	if res_id == resType.hero or (res_id % 100 == resType.hero) then 
		local cur = heroData.getHeroNums()
		local max = sysUserConfigData.get_card_bag_nums()
		return cur >= maxNum
	end

	return false
end

function cc.exports.gConsumeIsResEnough(res_id,cost_num)
	if res_id == resType.gold then 
		return userData.getYuanbao() >= cost_num
	elseif res_id == resType.money then
		local money_nums = 0
	    local selfCommonRes = politics.getSelfRes()
	    if selfCommonRes then
	        money_nums = selfCommonRes.money_cur
	    end
	    return money_nums >= cost_num
	elseif res_id == resType.decree then
		local curNum,maxNum = userData.getUserDecreeNum()
		return curNum >= cost_num
	elseif res_id == resType.wu_xun then 
		local curNum = userData.getUserWuxunVal()
		return curNum >= cost_num
	elseif res_id == resType.wood 
		or res_id == resType.stone
		or res_id == resType.iron 
		or res_id == resType.food then
		-- 资源类
		return politics.getResNumsByType(res_id) >= cost_num
	end

	return false
end






