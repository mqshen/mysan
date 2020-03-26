--[[
每个出现的界面（独立存在的一层）都分配一个唯一的编号（索引）；
预留10个空位用于处理可能需要的等级比较高的界面

打开或者关闭面板时在uimanager中提供统一的接口然后根据配置的类型来确定是加载到底层固定层还是浮动窗口层，这样在需要改变时不需要改动实现代码，
只需要配置代码部分修改；

因为界面关闭涉及到2种方式：关闭当前的（可以理解成后退功能）；关闭所有浮动窗口，所以打算每个界面有两个函数 remove_self, remove_all
当调用remove_self时关闭自己并发送统一请求去隐藏容器colorlayer，当调用remove_all时发送请求然后便利浮动窗口去逐一调用rmove_self。

--]]
cc.exports.uiIndexDefine = {}
uiIndexDefine.MAIN_INTERFACE_UI = 1 --主UI:无(无.json)
uiIndexDefine.MAIN_RIGHT_OPTION = 1 --主UI:无(mainRightbar.json)
uiIndexDefine.MAIN_MENU_MANAGER  = 1 --主UI:（主功能按钮）(secondToolUI.json)

uiIndexDefine.UI_SMALL_MAP = 1  -- 大地图:小地图
uiIndexDefine.MAP_MESSAGE_UI  = 1 --大地图:（土地详情）(City_details.json)
uiIndexDefine.UI_CITYLISTANDMAP = 1 --大地图:小地图(cityListAndMiniMapPanel.json)
uiIndexDefine.UI_TAISHOU = 1
uiIndexDefine.CITY_LIST_OPTION  = 1 --大地图:城市列表(city_clam.json)
uiIndexDefine.OP_CREATE_CITY  = 1 --大地图:筑城(newBuildUI.json)
uiIndexDefine.CREATE_CITY_UI = 1 --大地图:筑城(createCityUI.json)
uiIndexDefine.CREATE_TAISHOUFU_UI = 1 -- 大地图：建造太守府(createTaiShouFu.json)
uiIndexDefine.CREATE_CITY_DES_UI = 1 --大地图:筑城(createCityDesUI.json)
uiIndexDefine.JILVE_UI = 1          --计略选择(jilve.json)
uiIndexDefine.JILVE_MSG_UI = 1      --计略详情(jilvexiangqing.json)
uiIndexDefine.ARMY_SELECT_UI = 1 --大地图:出征部队选择(armySelectUI.json)
uiIndexDefine.ARMY_LIST_UI = 1 --大地图:部队列表(无.json)
uiIndexDefine.ARMY_LIENUP_UI = 1 --大地图:部队阵容(armyLineupUI.json)
uiIndexDefine.OP_ARMY_MOVE_CONFIRM  = 1 --大地图:行军确认(actionCheckUI.json)
uiIndexDefine.TASK_UI  = 1 --大地图:任务(task_interface.json)
uiIndexDefine.CARD_OVERVIEW_UI = 1 --大地图:武将卡(cardOverviewUI.json)
uiIndexDefine.ROLE_FORCES_MAIN = 1 --大地图:个人势力(role_forces_main.json)
uiIndexDefine.UI_CHAT_MAIN = 1 --大地图:聊天(ui_chat_main.json)
uiIndexDefine.UI_CHAT_UNION_GROUP_MEM_LIST = 1 -- 聊天： 同盟分组聊天--分组成员列表(yongfuliebiao.json)
uiIndexDefine.UI_CHAT_UNION_GROUP_SETTING = 1 -- 聊天： 同盟分组聊天--分组频道管理(pingdao_tanchang.json)
uiIndexDefine.COM_OP_MENU = 1 --大地图:确认(ui_op_menu.json)
uiIndexDefine.UI_DECREE_MANAGER = 1 --大地图 政令管理(maizhengling.json)
uiIndexDefine.UI_TAX_STATISTICAL_INFO = 1 -- 税收统计信息(shuishoutongji.jso)
uiIndexDefine.UI_DAILY_MANAGER = 1 --大地图 日常活动管理(huodong.json)
uiIndexDefine.UI_DAILY_HERO_COLLECTION_Shichangshi_PROGRESS_DETAIL = 1 -- 活动 （卡包搜集 十常侍 进度信息）
uiIndexDefine.UI_DAILY_SPRING_FESTIVAL_REWARD = 1 -- (活动-春节-红包特效 huodong_7_1.json)
uiIndexDefine.GAME_FUNCTIONAL_INTRO = 1 --大地图 功能介绍
uiIndexDefine.UI_SCENE_TIPS_OCCUPY_CITY = 1 -- 大地图 攻占城市特效
uiIndexDefine.UI_SCENE_TIPS_OCCUPIED = 1 -- 大地图 沦陷提示
uiIndexDefine.UI_SCENE_TIPS_PILLAGED = 1  -- 大地图被掠夺提示
uiIndexDefine.UI_SCENE_TIPS_BANDIT_TRANP = 1 -- 大地图被剿灭提示
uiIndexDefine.UI_OP_ARMY_MOVE_CONFIRM_NEWBIE = 1 --大地图:确认(actionCheckUI_2.json)
uiIndexDefine.COM_ALERT_CONFIRM = 1 --大地图:提示(Windows_prompts_n.json)
uiIndexDefine.UI_CHAT_DEFRIEND = 1 --大地图:确认加入黑名单(ui_chat_defriend.json)
uiIndexDefine.ROLLING_NOITCE = 1 --大地图:滚动公告(无.json)
uiIndexDefine.UI_CITYLIST_ARMY = 1 --大地图:城市(chengshirkou.json)
uiIndexDefine.UI_NEWBIE_PROTECT_DETAIL = 1 --大地图:新势力效果(newbie_protect_detail.json)
uiIndexDefine.UI_NEWBIE_PROTECT_DETAIL_A = 1 --大地图:新势力效果(newbie_protect_detail_a.json)
uiIndexDefine.UI_RES_PROFIT_BUFF = 1 --大地图:资源加成buff(shilizengyi.json)
uiIndexDefine.FC_TIPS_UI = 1 --大地图:筑城引导界面(waitingUI.json)

uiIndexDefine.EXERCISE_WHOLE_UI = 1 --沙盘演武:沙盘演武(shapanyanwu_1.json)
uiIndexDefine.EXERCISE_REWARD_UI = 1 --沙盘演武:部队战胜奖励(shapanyanwu_3.json)
uiIndexDefine.EXERCISE_PRE_REWARD_UI = 1 --沙盘演武:教学演武未开放管卡奖励(shapanyanwu_3_1.json)
uiIndexDefine.EXERCISE_FINISH_UI = 1 --沙盘演武:演武结束奖励(shapanyanwu_4.json)
uiIndexDefine.EXERCISE_ARMY_OVERVIEW_UI = 1 --沙盘演武:部队配置(shapanyanwu_5.json)
uiIndexDefine.EXERCISE_ENEMY_UI = 1 --沙盘演武:演武敌军阵容(shapanyanwu_2.json)
uiIndexDefine.EXERCISE_RECORD_ENEMY_UI = 1 --沙盘演武:演武敌军阵容(shapanyanwu_2_1.json)
uiIndexDefine.EXERCISE_DIFFICULT_UI = 1 --沙盘演武:演武难度选择(shapanyanwu_11.json)
uiIndexDefine.EXERCISE_FIGHT_DES_UI = 1 --沙盘演武:挑战奖励说明(shapanyanwu_8.json)
uiIndexDefine.EXERCISE_RECORD_UI = 1 --沙盘演武:查看战绩(shapanyanwu_9.json)

uiIndexDefine.LEGION_WHOLE_UI = 1 --军团:军团主体(legion_1.json)
uiIndexDefine.GATHER_ARMY_UI = 1 --军团:集结部队列表(legion_3.json)
uiIndexDefine.LEGION_CONDITION_UI = 1 --军团:军团集结条件(legion_4.json)
uiIndexDefine.LEGION_CZ_UI = 1 --大地图:军团出征(legion_5.json)

uiIndexDefine.ROLE_FORCES_EDIT_INTRO = 1 --个人势力:个人介绍(role_forces_edit_intro.json)
uiIndexDefine.UI_ROLE_FORCES_DETAIL = 1 --个人势力:势力信息(Forces_the_details_new.json)
uiIndexDefine.UI_ROLE_CHANGE_NAME_CONFIRM = 1 --个人势力：改名确认-shiligaiming.json
uiIndexDefine.RANGER_CONFIRM = 1 --个人势力:流浪确认(role_forces_ranger_confirm.json)
uiIndexDefine.BECOME_RANGER_CONFIRM = 1 --个人势力:流浪军确认(role_forces_ranger_confirm.json)
uiIndexDefine.UI_ROLE_BECOME_RANGER_SELECT_REGION = 1 --个人势力：流浪军选择出生州(role_become_ranger_select_region.json)
uiIndexDefine.UI_NPC_CITY_OCCUPIED_TIPS = 1 -- NPC 首占奖励提示（shouzhanjiangl_3.json）
uiIndexDefine.CITY_MSG  = 1 --城内:总览(cityOverviewUI.json)
uiIndexDefine.INNER_CITY_BUILDING_EFFECT = 1 --城内:建筑特效(无.json)
uiIndexDefine.BUILD_EXPAND_TITLE = 1 --城内:（扩建）(Expand_UI.json)
uiIndexDefine.BUILD_QUENE  = 1 --城内:建筑队列(buildingCD.json)
uiIndexDefine.BUILD_TREE_MANAGER  = 1 --城内:建筑(buildingTreeUI.json)
uiIndexDefine.BUILD_MSG_MANAGER  = 1 --城内:设施详情(buildMsgUI.json)
uiIndexDefine.UI_RESOURCE_TRADE = 1 --城内:资源交易(transaction.json)
uiIndexDefine.INNER_OPTION_RIGHT = 1 --城内:城内总览和队列(inner_option_right.json)
uiIndexDefine.INNER_OPTION_LEFT = 1 --城内:城内建筑分区按钮(inner_option_left.json)
uiIndexDefine.UI_BUILDING_AREA = 1 --城内:城内建筑(The_city_government等.json)
uiIndexDefine.UI_INTERNAL_AFFAIRS = 1 --城内:内政(neizhen_2.json)
uiIndexDefine.UI_BUILDING_EXPAND_CONFIRM = 1 --城内:扩建确认(kuojian.json)
uiIndexDefine.TAX_UI = 1 --城内:今日税收(Tax_2.json)
uiIndexDefine.UI_USER_OFFICIAL = 1 --城内:内政(neizenjiem_001.json)
uiIndexDefine.UI_USER_OFFICIAL_MOVE_CITY_SELECT_CITY = 1 -- 迁城（xuanzefencheng.json）
uiIndexDefine.UI_USER_OFFICIAL_MOVE_CITY_CONFIRM = 1 --迁城确认(qianchengqueren.json)

uiIndexDefine.ARMY_OVERVIEW_UI = 1 --部队:部队配置(newArmyUI.json)
uiIndexDefine.ARMY_ADDITION_UI = 1 --部队:部队加成(teamAdditionUI.json)
uiIndexDefine.ARMY_EXCHANGE_UI = 1 --部队:部队交换(armyExchangeUI.json)
uiIndexDefine.ZB_QUEUE_DES_UI = 1 --部队:征兵队列说明(zbQueueUI.json)
uiIndexDefine.SOLDIER_DISSOLVE_UI = 1 --部队:移除武将确认(soldierDissolveUI.json)
uiIndexDefine.CARD_ADD_SOLDIER  = 1 --部队:征兵(addSoldierUI.json)
uiIndexDefine.REDIF_CARREY_UI = 1   --部队:集结携带预备兵
uiIndexDefine.SHOUJIANG_OVERVIEW_UI = 1     --守军将领(scjlSetUI.json)
uiIndexDefine.TUJIAN_CARD_DETAIL_UI = 1 --部队:部队配置(newArmyUI.json)

uiIndexDefine.UI_HERO_RESET_CONFIRM = 1 -- 武将：武将重置确认（wujiangchongzhi.json）
uiIndexDefine.CARD_DETAIL_INFO  = 1 --武将:武将详情（旧）(cardDetailUI.json)
uiIndexDefine.CARD_VIEWER_BASIC = 1 --武将:武将详情（基础）(wujikaxiangqing.json)
uiIndexDefine.CARD_VIEWER_USER = 1 --武将:武将详情（拥有）(wujikaxiangqing.json)
uiIndexDefine.CARD_VIEWER_USER_LOCK = 1 --武将:武将详情（锁定）(wujikaxiangqing.json)
uiIndexDefine.CARD_VIEWER_OTHERS = 1
uiIndexDefine.CARD_SKILL_INFO  = 1 --武将:技能详情(cardSkillUI.json)
uiIndexDefine.UI_CARD_TIPS_INTRO = 1 --武将:觉醒提示(card_tips_intro.json)
uiIndexDefine.CARD_TEACH_INFO  = 1 --武将:可传授技能(teachSkillUI.json)
uiIndexDefine.CARD_WASH_POINT_CONFIRM = 1 --武将:洗点确认(washPointConfirm.json)
uiIndexDefine.CARD_HERO_GROW_DETAIL = 1 --武将:武将成长(chengzhang_0.json)
uiIndexDefine.HERO_TYPE_DETAIL_UI = 1 --武将兵种详情(bingzhongxiangqing.json)

uiIndexDefine.REPORT_UI  = 1 --战报:战报(new_report_interface.json)
uiIndexDefine.DETAIL_REPORT  = 1 --战报:战报详情(Report_items.json)
uiIndexDefine.BATTLA_ANIMATION_UI  = 1 --战报:战报播放(Report_items_1.json)

uiIndexDefine.SKILL_LEARN_SELECT_MANAGER  = 1 --技能:技能选择(skillLearnSelect.json)
uiIndexDefine.SKILL_CONFIRM_MANAGER  = 1 --技能:强化/学习确认(skillConfirmUI.json)
uiIndexDefine.UI_SKILL_GAINED = 1 --技能:获得新技能(jinengxiangqing_3.json)
uiIndexDefine.UI_SKILL_DETAIL = 1 --技能:技能详情(学习 强化 研究详情)(jinengxiangqing.json)
uiIndexDefine.UI_SKILL_OPERATE = 1 --技能:技能操作（研究，觉醒，进阶)(jinengxiangqing_2.json)
uiIndexDefine.UI_SKILL_OVERVIEW = 1 --技能:技能总览/学习技能选择(jinengxiangqing_1.json)
uiIndexDefine.CARD_DETAIL_INFO_UN_OPERABLE = 1 --武将:武将详情(cardDetailUI.json)

uiIndexDefine.UI_RANGERS_UNION_CREATE = 1 -- 聚义-发起聚义-juyi_01.json
uiIndexDefine.UI_RANGERS_UNION_MAIN_UI = 1 -- 聚义-主面板-juyi_02.json
uiIndexDefine.UI_RANGERS_ABLE_BE_INVITE_LIST = 1 --聚义-邀请成员-juyi_04.json
uiIndexDefine.UI_RANGERS_UNION_INVITE_LIST = 1 --聚义-聚义邀请-juyi_03.json

uiIndexDefine.UNION_MAIN_UI  = 1 --同盟:同盟(Alliance_main_interface_1.json)
uiIndexDefine.UNION_LOG_UI = 1 --同盟:同盟日志(unionLogUI.json)
uiIndexDefine.UNION_MEMBER_OFFICIAL_MANAGER = 1 --同盟:同盟成员官位管理(renmingguanli.json)
uiIndexDefine.UNION_APPOINT_NPC_CITY_OFFICIER_LSIT = 1 --同盟:同盟任命NPC城市太守(taishou_renming.json)
uiIndexDefine.UNION_APPOINT_OFFICIER_LIST = 1 -- 同盟：同盟任命官位列表（union_guanweirenming.json）
uiIndexDefine.UNION_DONATE_UI  = 1 --同盟:同盟捐献(The_alliance_xinjuanxian_0.json)
uiIndexDefine.UI_REBEL_MAIN = 1 --同盟:反叛(The_alliance_with.json)
uiIndexDefine.UNION_NAME_INPUT  = 1 --同盟:输入同盟名(input_interface_Alliance.json)
uiIndexDefine.NO_UNION_UI = 1 --同盟:同盟(alliance_create_main.json)
uiIndexDefine.ANNOUNCEMENT_EDIT_UI = 1 --同盟:同盟公告编辑(Allied_Edit_bulletin.json)
uiIndexDefine.UNION_TIPS = 1 --同盟:同盟提示(tongmeng_zaiye.json)
uiIndexDefine.UNION_MARK_1 = 1 		--同盟标记:标记界面(tongmengbiaoji_1.json)
uiIndexDefine.UNION_MARK_2 = 1 		--同盟标记:标记列表(tongmengbiaoji_2.json)
uiIndexDefine.UNION_MARK_3 = 1 		--同盟标记:标记详情(tongmengbiaoji_4.json)
uiIndexDefine.UI_UNION_RELATION_SETTING = 1 -- 同盟关系设置(shezhiguanxian_2.json)
uiIndexDefine.UI_UNION_RELATION_OVERVIEW = 1 -- 同盟关系查看(shezhiguanxian_3.json)
uiIndexDefine.UI_UNION_RELATION_SETTING_OP = 1 -- 同盟关系设置操作(shezhiguanxian_1.json)
uiIndexDefine.UNION_MEMBERS_UI = 1 -- 同盟成员(Alliance_members_main.json)
uiIndexDefine.UNION_POWER = 1 -- 同盟:同盟势力（alliance_goverment_stronghold.json）
uiIndexDefine.UNION_MEMBER_INVITE = 1 -- 同盟成员邀请成员(Alliance_invited.json)
uiIndexDefine.UNION_PROCESS_APPLICATION = 1 -- 同盟处理申请（Alliance_for_processing）
uiIndexDefine.UNION_QUIT = 1 -- 退出同盟
uiIndexDefine.UNION_DISMISS = 1 -- 解散同盟
uiIndexDefine.UNION_JOIN = 1    -- 加入同盟
uiIndexDefine.UNION_INVITATION = 1  -- 同盟邀请
uiIndexDefine.UNION_GROUP_UI = 1    -- 同盟分组
uiIndexDefine.UNION_GROUP_SET = 1   -- 同盟分组设置
uiIndexDefine.UNION_GROUP_LEADER_SET = 1      --同盟分组组长设置

uiIndexDefine.NATION_FOUND_SCREEN = 1 -- 建国过渡动画（nation_found_screen.json）

uiIndexDefine.NATION_TITLE_INTRO = 1                    -- 国都 国号介绍(guohaoshuoming.json)
uiIndexDefine.UNION_CREATE_NATION_INTRO = 1             -- 立国介绍(liguo_3.json)
uiIndexDefine.UNION_CREATE_NATION_DURING_CREATING = 1   -- 立国中(liguo_1.json)
uiIndexDefine.UNION_CREATE_NATION_CONFIG_DETAIL = 1     -- 立国详情(liguo_2.json)
uiIndexDefine.UI_QUIT_NATION_CONFIRM = 1                        -- 退出国家确认(guojia_tuichu.json)
uiIndexDefine.UI_DISINTERGRATE_NATION_CONFIRM = 1               -- 国家解体确认(guojia_jieti.json)
uiIndexDefine.UI_NATION_LEADER_GUARD_OPERATE = 1                -- 君主 护卫操作 (guojia_fuwei_1.json)

uiIndexDefine.UI_CHANGE_NATION_CAPITAL = 1                      -- 国家迁都操作 (guojia_qiandu_1.json)
uiIndexDefine.UI_CHANGE_NATION_CAPITAL_OP_CONFIRM = 1           -- 国家迁都操作确认(goojia_qiandu_2.json)
uiIndexDefine.UI_CHANGE_NATION_CAPITAL_SELECT_TARGET_CITY = 1   -- 国家迁都操作 选择城市(goojia_qiandu_3.json)
uiIndexDefine.UI_CHANGE_NATION_CAPITAL_TITLE_CONFIRM = 1           -- 国家迁都操作确认(goojia_qiandu_4.json)
uiIndexDefine.UI_CHANGE_NATION_CAPITAL_DURING_MOVING = 1        -- 国家迁都-迁都中（guojia_qiandu_5.json)

uiIndexDefine.MAIL_MAIN_UI  = 1 --邮件:邮件(Email_inbox.json)
uiIndexDefine.SEND_MAIL_UI  = 1 --邮件:写邮件(Mail_program_interface.json)
uiIndexDefine.RECEIVER_CHOOSE_UI  = 1 --邮件:收件人选择(Mail_program_interface_0.json)
uiIndexDefine.MAIL_CHANNEL_UI = 1       --邮件:频道选择(Mail_program_interface_0.json)
uiIndexDefine.MAIL_TEXT_UI  = 1 --邮件:邮件详情(mail_outbox.json)

uiIndexDefine.WORLD_PROCESS_MAIN_UI = 1 --世界进度:主界面(shijiejindu_1.json)
uiIndexDefine.WORLD_PROCESS_DETAIL_UI = 1 --世界进度:详情界面(shijiejindu_3.json)
uiIndexDefine.WORLD_PROCESS_FINISH_UI = 1   --世界进度:完成提示(shijiejindu_finish.json)
uiIndexDefine.SEASON_HISTORY_CHANNEL_UI = 1 --赛季历史:服务器选择(shijiejindu_8_1.json)

uiIndexDefine.CARD_EXTRACT_INFO = 1 --招募:招募(extractCardUI.json)
uiIndexDefine.CARD_PACKET_UI = 1 --招募:武将卡(cardOverviewUI.json)
uiIndexDefine.QUICK_CALL_UI = 1 	--招募:自定义招募(quickCallUI.json)
uiIndexDefine.QUICK_CALL_RESULT_UI = 1 	--招募:自定义招募结果(quickCallResultUI.json)
uiIndexDefine.TUJIAN_UI = 1             --图鉴(tjOverviewUI.json)

uiIndexDefine.UI_DAILY_BULLETIN = 1 --公告:区服公告(The_main_interface_of_announcement.json)
uiIndexDefine.UI_GM_GUI = 1 --gm指令的ui

uiIndexDefine.GM_MANAGER  = 1 --杂项:GM指令(gm_simple_version.json)
uiIndexDefine.UI_SETTING = 1 --杂项:设置(Setting.json)
uiIndexDefine.UI_PERSONAL_RELATIONSHIP_MANAGER = 1 --个人关系管理 personal_relationship_manager.json
uiIndexDefine.UI_GIFT_EXCHANGE = 1 --杂项:礼包兑换(shezhi_2.json)
uiIndexDefine.ALERTLAYER_MANAGER = 1 --杂项:提示(actionCheckUI_1.json)
uiIndexDefine.UI_OP_LOCATE_COORDINATE_CONFIRM = 1 --坐标跳转确认:跳转确认(dingwei_tishi.json)
uiIndexDefine.ALERT_CONFIRM_LAYER = 1 --杂项:新提示(alertConfirm.json)

uiIndexDefine.FORT_9_GRID_UI = 1
uiIndexDefine.INPUT_CITYNAME_INFO = 1 --大地图:输入分城/要塞名(input_interface_build.json)
uiIndexDefine.CREATE_MAIN_CITY_UI = 1 --流浪军建立势力 (create_main_city_confirm_ui.json)

uiIndexDefine.TECH_MSG_MANAGER  = 1 --城内:设施详情(kejixiangqing.json)

uiIndexDefine.RANKING_UI = 1 --扩展按钮:排行榜(rankingUI.json.json)
uiIndexDefine.RANK_DES_UI = 1 --扩展按钮:排行榜(rankingUI.json.json)
uiIndexDefine.POP_UP_UI = 1 --引导:特殊奖励提示(texiaobeijing.json)
uiIndexDefine.GROUND_LOG = 1 --大地图:事件结果(ground_event_log.json)
uiIndexDefine.UI_DAILY_LOGIN_REWARD_DETAIL = 1 --登陆奖励:本次奖励(Landing_a_reward_2.json)
uiIndexDefine.UI_REWARD_DETAIL = 1 --登陆奖励:悬浮TIPS(jiangli_tips.json)
uiIndexDefine.UI_REWARD_DETAIL_MIDDLE = 1 -- 大尺寸的奖励(jiangli_tips_01.json)
uiIndexDefine.UI_RES_PACKAGE_DETAIL = 1 -- 资源包 jiangli_tips_res_package.json
uiIndexDefine.UI_SPE_REWARD_DETAIL = 1 --登陆奖励:特殊悬浮TIPS(spe_jiangli_tips.json)
uiIndexDefine.UI_HELP_UI = 1 --帮助系统:游戏帮助(youxibangzhu.json)
uiIndexDefine.UI_PAY_UI = 1--充值界面chongzhijiemian.json
uiIndexDefine.UI_PHONE_BINDING = 1--手机绑定
uiIndexDefine.UI_BONUS_UI = 1--月卡领取
uiIndexDefine.UI_BATTLE_LOADING = 1--战斗动画loading界面
uiIndexDefine.UI_GAME_SPRITE = 1--游戏精灵
uiIndexDefine.UI_CARD_DOWNLOAD = 1 --卡牌下载
uiIndexDefine.UI_IOS_COMMENT = 1--ios游戏评价
uiIndexDefine.UI_SHARE = 1--分享界面
uiIndexDefine.UI_SELECT_CARD = 1--赛季奖励卡牌选择界面
uiIndexDefine.UI_PUSH = 1--推送设置界面
uiIndexDefine.UI_TECH_USER = 1--个人科技界面
uiIndexDefine.UI_CHANGE_SERVER = 1--转服界面
uiIndexDefine.UI_SHARE_URL = 1--分享界面
uiIndexDefine.UI_FORUM_WEBVIEW = 1--内嵌网页
uiIndexDefine.UI_NATION_TECH_TIPS = 1--国家科技说明tips
uiIndexDefine.BLACK_MARKET_TIPS = 1 -- 黑市商品说明界面
uiIndexDefine.UI_UNION_GROUP_MEMBERS = 1 -- 同盟分组界面
uiIndexDefine.UI_UNION_GROUP_MEM_MANAGER = 1 -- 同盟分组管理界面
uiIndexDefine.UI_UNION_GROUP_LIST = 1 -- 同盟分组列表
----------------------------------------------华丽的分割线-------------------------------------------------------------

local function CreatEnumTable(tbl, index) 
    local enumindex = index or 0 
    for i, v in pairs(tbl) do 
    	enumindex = enumindex + 1
        tbl[i] = enumindex
    end 
end 

CreatEnumTable(uiIndexDefine, 1)

----------------------------------------------华丽的分割线-------------------------------------------------------------


--[[列表内容信息 	1 类名（控制管理的全局名称）；
					2 标题；
					3 显示层次（-1 地图层之上 主界面静态层之下, 0 主界面静态层，1 浮动窗口层）；
				 	4 浮动窗口出现时对下层影响（0 直接遮挡，1 隐藏下层） 
                 	5 {界面淡入淡出方式（1，渐隐，缩放，2 渐隐）, 动画时间 （毫秒为单位）,缩放参数（0～1）, 渐隐参数（0～255）}
   					6 背景透明度              
--]]
cc.exports.panelPropInfo = {}
panelPropInfo[uiIndexDefine.MAIN_INTERFACE_UI] = {"mainOption","无", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.MAIN_RIGHT_OPTION] = {"mainRightOption","无", 0, 0,{0,0,0,0}, 150}

panelPropInfo[uiIndexDefine.UI_TAISHOU] = {"SatrapMap","小地图", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.MAP_MESSAGE_UI ] = {"mapMessageUI","（土地详情）", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_SMALL_MAP] = {"SmallMiniMap","右上角小地图", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_CITYLISTANDMAP] = {"miniMapManager","小地图", 1, 0,{1,200,0.85,0}, 0}
panelPropInfo[uiIndexDefine.CITY_LIST_OPTION ] = {"cityListOption","城市列表", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.OP_CREATE_CITY ] = {"opCreateCity","筑城", 1, 0,{0,0,0,0}, 0}
panelPropInfo[uiIndexDefine.CREATE_CITY_UI] = {"createCityManager","筑城", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CREATE_TAISHOUFU_UI] = {"createTaiShouFuManager","太守府建造", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CREATE_CITY_DES_UI] = {"createCityDesManager","筑城说明", 1, 0,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.JILVE_UI ] = {"jilveManager","计略", 1, 0,{0,0,0,0}, 0}
panelPropInfo[uiIndexDefine.JILVE_MSG_UI ] = {"jilveMsgManager","计略详情", 1, 0,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.ARMY_SELECT_UI] = {"armyMoveManager","出征部队选择", 1, 0,{0,0,0,0}, 0}
panelPropInfo[uiIndexDefine.ARMY_LIST_UI] = {"armyListManager","部队列表", 0, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.ARMY_LIENUP_UI] = {"armyLineupManager","部队阵容", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.OP_ARMY_MOVE_CONFIRM ] = {"opArmyMoveConfirm","行军确认", 1, 0,{1,200,0.85,0}, 220}
panelPropInfo[uiIndexDefine.TASK_UI ] = {"TaskUI","任务", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_OVERVIEW_UI] = {"cardOverviewManager","武将卡", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.ROLE_FORCES_MAIN] = {"UIRoleForcesMain","个人势力", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHAT_MAIN] = {"UIChatMain","聊天", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHAT_UNION_GROUP_MEM_LIST] = {"UIChatUnionGroupMemList","聊天", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHAT_UNION_GROUP_SETTING] = {"UIChatUnionGroupSetting","聊天", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DECREE_MANAGER] = {"UIDecreeManager","政令", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_TAX_STATISTICAL_INFO] = {"UITaxStatisticalInfo","税收统计", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DAILY_MANAGER] = {"UIDailyManager","日常活动", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DAILY_HERO_COLLECTION_Shichangshi_PROGRESS_DETAIL] = {"uiDailyHeroCollectionShichangshiProgressDetail","活动-十常侍", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DAILY_SPRING_FESTIVAL_REWARD] =  {"uiDailySpringFestivalReward","春节活动红包特效", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SCENE_TIPS_OCCUPY_CITY] = {"SceneTipsOccupyCity","占领城池提示",1,0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SCENE_TIPS_OCCUPIED] = {"SceneTipsOccupied","沦陷提示",1,0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SCENE_TIPS_PILLAGED] = {"SceneTipsPillaged","被掠夺提示",1,0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SCENE_TIPS_BANDIT_TRANP] = {"SceneTipsBanditTramp","被剿灭提示",1,0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.GAME_FUNCTIONAL_INTRO] = {"GameFunctionalIntro","城市介绍", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.COM_OP_MENU] = {"comOPMenu","确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_OP_ARMY_MOVE_CONFIRM_NEWBIE] = {"opArmyMoveConfirmNewbie","确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.COM_ALERT_CONFIRM] = {"comAlertConfirm","提示", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHAT_DEFRIEND] = {"UIChatDefriend","确认加入黑名单", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.ROLLING_NOITCE] = {"MainScreenNotification","滚动公告", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_CITYLIST_ARMY] = {"UICityListArmy","城市", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_NEWBIE_PROTECT_DETAIL] = {"NewbieProtectDetail","新势力效果", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_NEWBIE_PROTECT_DETAIL_A] = {"NewbieProtectDetailA","新势力效果", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_RES_PROFIT_BUFF] = {"UIResProfitBuff","资源加成buff", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.FC_TIPS_UI] = {"picTipsManager","筑城引导界面", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.EXERCISE_WHOLE_UI] = {"exerciseWholeManager","沙盘演武", 1, 1,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_REWARD_UI] = {"exerciseRewardManager","部队战胜奖励", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_PRE_REWARD_UI] = {"exercisePreRewardManager","教学奖励", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_FINISH_UI] = {"exerciseFinishManager","演武结束奖励", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_ARMY_OVERVIEW_UI] = {"exerciseArmyManager","部队配置", 1, 1,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_ENEMY_UI] = {"exerciseEnemyManager","演武敌军阵容", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_RECORD_ENEMY_UI] = {"exerciseRecordEnemyManager","演武敌军阵容", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_DIFFICULT_UI] = {"exerciseDifficultManager","演武难度选择", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_FIGHT_DES_UI] = {"exerciseFightDesManager","挑战奖励说明", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.EXERCISE_RECORD_UI] = {"exerciseRecordManager","演武战绩", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.LEGION_WHOLE_UI] = {"legionWholeManager","军团", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.GATHER_ARMY_UI] = {"gatherArmyManager","集结部队", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.LEGION_CONDITION_UI] = {"legionConditionManager","军团集结条件", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.LEGION_CZ_UI] = {"legionMoveManager","军团出征", 0, 0,{0,0,0,0}, 150}

panelPropInfo[uiIndexDefine.ROLE_FORCES_EDIT_INTRO] = {"UIRoleForcesEditIntro","个人介绍", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_ROLE_FORCES_DETAIL] = {"UIRoleForcesDetail","势力信息", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_ROLE_CHANGE_NAME_CONFIRM] = {"UIRoleChangeNameConfirm","改名确认", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.RANGER_CONFIRM] = {"UIRoleForcesRangerConfirm","流浪确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.BECOME_RANGER_CONFIRM] = {"UIRoleBecomeRangerConfirm","流浪军确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_ROLE_BECOME_RANGER_SELECT_REGION] = {"UIRoleBecomeRangerSelectRegion","流浪军选择出生州", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_GM_GUI] = {"GM_gui","gm", 1, 0,{1,200,0.85,0}, 150}


panelPropInfo[uiIndexDefine.UI_NPC_CITY_OCCUPIED_TIPS] = {"NpcCityOccupiedTips","首占奖励提示", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.CITY_MSG ] = {"cityMsg","总览", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.INNER_CITY_BUILDING_EFFECT] = {"buildingEffectObject","建筑特效", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.BUILD_EXPAND_TITLE] = {"buildingExpandTitle","（扩建）", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.BUILD_QUENE ] = {"buildQueue","建筑队列", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.BUILD_TREE_MANAGER ] = {"buildTreeManager","建筑", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.BUILD_MSG_MANAGER ] = {"buildMsgManager","设施详情", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_RESOURCE_TRADE] = {"UIResourceTrade","资源交易", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.INNER_OPTION_RIGHT] = {"innerOptionRight","城内总览和队列", 0, 0,{2,200,1,0}, 150}
panelPropInfo[uiIndexDefine.INNER_OPTION_LEFT] = {"innerOptionLeft","城内建筑分区按钮", 0, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_BUILDING_AREA] = {"UIBuildingArea","城内建筑", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_INTERNAL_AFFAIRS] = {"UIInternalAffairs","内政", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_BUILDING_EXPAND_CONFIRM] = {"BuildingExpandConfirm","扩建确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.TAX_UI] = {"TaxUI","今日税收", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_USER_OFFICIAL] = {"UserOfficial","内政", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_USER_OFFICIAL_MOVE_CITY_SELECT_CITY] = {"UserOfficialMoveCitySelectCity","迁城列表", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_USER_OFFICIAL_MOVE_CITY_CONFIRM] = {"UserOfficialMoveCityConfirm","迁城确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.ARMY_OVERVIEW_UI] = {"armyWholeManager","部队配置", 1, 1,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.ARMY_ADDITION_UI] = {"armyAdditionManager","部队加成", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.ARMY_EXCHANGE_UI] = {"armyExchangeManager","部队交换", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.ZB_QUEUE_DES_UI] = {"zbQueueDesManager","征兵队列说明", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.SOLDIER_DISSOLVE_UI] = {"soldierDissolveManager","移除武将确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_ADD_SOLDIER ] = {"cardAddSoldier","征兵", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.REDIF_CARREY_UI ] = {"redifCarryManager","携带预备兵", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.SHOUJIANG_OVERVIEW_UI] = {"sjArmyManager","守城将领", 1, 1,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.TUJIAN_CARD_DETAIL_UI] = {"tujianViewManager","图鉴卡牌详情", 1, 1,{0,0,0,0}, 220}

panelPropInfo[uiIndexDefine.UI_HERO_RESET_CONFIRM] = {"heroResetConfirm","兵种转换", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_DETAIL_INFO ] = {"cardDetailInfo","武将详情（旧）", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_VIEWER_BASIC] = {"basicCardViewer","武将详情（基础）", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_VIEWER_USER] = {"userCardViewer","武将详情（拥有）", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_VIEWER_OTHERS] = {"othersCardViewer","武将详情（拥有）", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.CARD_VIEWER_USER_LOCK] = {"userCardViewerLock","武将详情（锁定）", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_SKILL_INFO ] = {"cardSkillInfo","技能详情", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CARD_TIPS_INTRO] = {"CARD_TIPS_INTRO","觉醒提示", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_TEACH_INFO ] = {"cardTeachInfo","可传授技能", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_WASH_POINT_CONFIRM] = {"cardWashPointConfirm","洗点确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CARD_HERO_GROW_DETAIL] = {"cardHeroGrowDetail","武将成长", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.HERO_TYPE_DETAIL_UI] = {"heroTypeDetailManager","兵种详情", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.REPORT_UI ] = {"reportUI","战报", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_SELECT_CARD ] = {"SeasonSelectCardUI","选择奖励", 1, 1,{2,150,1,0}, 150}

panelPropInfo[uiIndexDefine.DETAIL_REPORT ] = {"detailReport","战报详情", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.BATTLA_ANIMATION_UI ] = {"BattleAnimationController","战报播放", 1, 1,{2,150,1,0}, 150}

panelPropInfo[uiIndexDefine.SKILL_LEARN_SELECT_MANAGER ] = {"skillLearnSelectManager","技能选择", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.SKILL_CONFIRM_MANAGER ] = {"skillConfirmManager","强化/学习确认", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_SKILL_GAINED] = {"SkillGainedLayer","获得新技能", 1, 0,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_SKILL_DETAIL] = {"SkillDetail","技能详情(学习 强化 研究详情)", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SKILL_OPERATE] = {"SkillOperate","技能操作（研究，觉醒，进阶)", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_SKILL_OVERVIEW] = {"SkillOverview","技能总览/学习技能选择", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.CARD_DETAIL_INFO_UN_OPERABLE] = {"cardDetailInfoUnoperable","武将详情", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.UI_RANGERS_UNION_CREATE ] = {"UIRangersUnionCreate","聚义", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_RANGERS_UNION_MAIN_UI ] = {"UIRangersUnionMainUI","聚义", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UI_RANGERS_ABLE_BE_INVITE_LIST] = {"UIRangersAbleBeInviteList","邀请成员", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UI_RANGERS_UNION_INVITE_LIST] = {"UIRangersUnionInviteList","聚义邀请", 1, 0, {1, 200, 0.85, 0}, 150}

panelPropInfo[uiIndexDefine.UNION_MAIN_UI ] = {"UnionMainUI","同盟", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.UNION_LOG_UI] = {"unionLogManager","同盟日志", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_MEMBER_OFFICIAL_MANAGER] = {"unionMemOfficialManager","同盟官位管理", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_APPOINT_NPC_CITY_OFFICIER_LSIT] = {"unionAppointNpcCityOfficierList","同盟任命太守列表", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_APPOINT_OFFICIER_LIST] = {"unionAppointOfficierList","同盟任命太守列表", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_DONATE_UI ] = {"UnionDonateUI","同盟捐献", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CARD_DOWNLOAD ] = {"DownLoadCardUI","卡牌下载", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_REBEL_MAIN] = {"UnionRebelUI","反叛", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_NAME_INPUT ] = {"UnionNameInput","输入同盟名", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.NO_UNION_UI] = {"UnionCreateUI","同盟", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.ANNOUNCEMENT_EDIT_UI] = {"UnionAnnouncement","同盟公告编辑", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_TIPS] = {"NoUnionTipsUI","同盟提示", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_MARK_1] = {"unionMarkManager","同盟标记", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_MARK_2] = {"unionMarkListManager","同盟标记", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_MARK_3] = {"unionMarkDetailManager","同盟标记", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.UI_UNION_RELATION_SETTING] = {"unionRelationSetting","同盟外交", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UI_UNION_RELATION_OVERVIEW] = {"unionRelationOverview","同盟外交", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UI_UNION_RELATION_SETTING_OP] = {"unionRelationSettingOp","同盟外交", 1, 0, {1, 200, 0.85, 0}, 150}

panelPropInfo[uiIndexDefine.UNION_MEMBERS_UI] = {"unionMembers", "同盟成员", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_POWER] = {"unionPower", "同盟势力", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_MEMBER_INVITE] = {"unionMemberInvite", "邀请成员", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_PROCESS_APPLICATION] = {"unionApplicationProcess", "处理申请", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_QUIT] = {"unionOfficialQuit", "退出同盟", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_DISMISS] = {"unionOfficialDismiss", "解散同盟", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_JOIN] = {"unionJoin", "加入同盟", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_INVITATION] = {"unionInviteNoUnion", "同盟邀请", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_GROUP_UI] = {"unionGroupManager", "同盟分组", 1, 0, {1, 200, 0.85, 0}, 150}
panelPropInfo[uiIndexDefine.UNION_GROUP_SET] = {"unionGroupSetManager","分组设置", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_GROUP_LEADER_SET] = {"unionGroupSetLeaderManager","分组设置", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.NATION_FOUND_SCREEN] = {"nationFundScreen", "立国动画", 1, 0, {1, 200, 0.85, 0}, 150}

panelPropInfo[uiIndexDefine.NATION_TITLE_INTRO] = {"unionNationTitleIntro","国号介绍", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_CREATE_NATION_INTRO] = {"unionCreateNationIntro","立国", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_CREATE_NATION_DURING_CREATING] = {"unionCreateNationDuringCreating","立国", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UNION_CREATE_NATION_CONFIG_DETAIL] = {"unionCreateNationConfigDetail","立国", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_QUIT_NATION_CONFIRM] = {"quitNationConfirm","退出国家", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DISINTERGRATE_NATION_CONFIRM] = {"disintegrateNationConfirm","国家解体", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_NATION_LEADER_GUARD_OPERATE] = {"nationLeaderGuardOperate","君主护卫操作", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHANGE_NATION_CAPITAL] = {"changeNationCapital","迁都操作", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHANGE_NATION_CAPITAL_OP_CONFIRM] = {"changeNationCapitalOpConfirm","迁都操作确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHANGE_NATION_CAPITAL_SELECT_TARGET_CITY] = {"changeNationCapitalSelectTargetCity","迁都操作选择城市", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHANGE_NATION_CAPITAL_TITLE_CONFIRM] = {"changeNationCapitalTileConfirm","迁都操作国号确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_CHANGE_NATION_CAPITAL_DURING_MOVING] = {"changeNationCapitalDuringMoving","迁都中", 1, 0,{1,200,0.85,0}, 150}


panelPropInfo[uiIndexDefine.TECH_MSG_MANAGER ] = {"techMsgManager","科技详情", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.MAIL_MAIN_UI ] = {"mailManager","邮件", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.SEND_MAIL_UI ] = {"SendMailUI","写邮件", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.RECEIVER_CHOOSE_UI ] = {"ReceiverChooseUI","收件人选择", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.MAIL_CHANNEL_UI ] = {"channelMailManager","频道选择", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.MAIL_TEXT_UI ] = {"MailTextUI","邮件详情", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.CARD_EXTRACT_INFO] = {"cardCallManager","招募", 1, 1,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.CARD_PACKET_UI] = {"cardPacketManager","武将卡", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.QUICK_CALL_UI ] = {"quickCallManager","自定义招募", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.QUICK_CALL_RESULT_UI ] = {"quickCallResultManager","招募简报", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.TUJIAN_UI] = {"tujianManager","武将图鉴", 1, 0,{1,200,0.85,0}, 220}

panelPropInfo[uiIndexDefine.WORLD_PROCESS_MAIN_UI ] = {"worldProcessManager","天下大势", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.WORLD_PROCESS_DETAIL_UI ] = {"worldProDetailManager","世界进度详情", 1, 0,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.WORLD_PROCESS_FINISH_UI] = {"worldProFinishManager","天下大势完成",1,0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.SEASON_HISTORY_CHANNEL_UI ] = {"seasonHistoryChannelManager","赛季区服选择", 1, 0,{2,150,1,0}, 150}

panelPropInfo[uiIndexDefine.UI_DAILY_BULLETIN] = {"UIDailyBulletin","区服公告", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.GM_MANAGER ] = {"gmManager","GM指令", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.UI_HELP_UI ] = {"HelpUI","游戏帮助", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SHARE ] = {"PlatformShare","游戏分享", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_GAME_SPRITE ] = {"GameSpriteMainUI","游戏精灵", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_IOS_COMMENT ] = {"IOSComment","游戏评价", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_PHONE_BINDING ] = {"BindingPhone","手机绑定", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_BONUS_UI ] = {"BonusUI","贡品礼包", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_PAY_UI ] = {"PayUI","充值", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_BATTLE_LOADING ] = {"BattleLoadingUI","战斗", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SETTING] = {"Setting","设置", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_PUSH] = {"PushUI","通知设置", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_PERSONAL_RELATIONSHIP_MANAGER] = {"PersonalRelationshipManager","个人关系管理", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_GIFT_EXCHANGE] = {"UIGiftExchange","礼包兑换", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.ALERTLAYER_MANAGER] = {"alertLayer","提示", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SHARE_URL] = {"ShareURL","分享", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_FORUM_WEBVIEW] = {"ForumWebView","分享", 1, 0,{1,200,0.85,0}, 150}


panelPropInfo[uiIndexDefine.UI_OP_LOCATE_COORDINATE_CONFIRM] = {"opLocateCoordinateConfirm","跳转确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.ALERT_CONFIRM_LAYER] = {"AlertConfirmLayer","新提示", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.INPUT_CITYNAME_INFO] = {"inputCityNameInfo","输入分城/要塞名", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.FORT_9_GRID_UI] = {"createFort9GridConfirm","确认", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_TECH_USER] = {"TechTreeManager","科技树", 1, 0,{1,200,0.85,0}, 240}
panelPropInfo[uiIndexDefine.UI_NATION_TECH_TIPS] = {"NationTechTips","说明", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.CREATE_MAIN_CITY_UI] = {"createSettleManager","确认", 1, 0,{1,200,0.85,0}, 150}


panelPropInfo[uiIndexDefine.RANKING_UI] = {"rankingManager","排行榜", 1, 1,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.RANK_DES_UI] = {"rankingDesManager","排行榜说明", 1, 0,{2,150,1,0}, 150}
panelPropInfo[uiIndexDefine.POP_UP_UI] = {"commonPopupManager","特殊奖励提示", 1, 0,{0,0,0,0}, 150}
panelPropInfo[uiIndexDefine.GROUND_LOG] = {"GroundEventDescribe","事件结果", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_DAILY_LOGIN_REWARD_DETAIL] = {"UIDailyLoginRewardDetail","本次奖励", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_REWARD_DETAIL] = {"UIRewardDetail","悬浮TIPS", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_REWARD_DETAIL_MIDDLE] = {"UIRewardDetailMiddle","悬浮TIPS中", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_RES_PACKAGE_DETAIL] = {"UIResPackageDetail","悬浮TIPS", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.UI_CHANGE_SERVER] = {"ChangeServerUI","转服", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_SPE_REWARD_DETAIL] = {"speRewardTipsManager","悬浮TIPS", 1, 0,{1,200,0.85,0}, 150}

panelPropInfo[uiIndexDefine.BLACK_MARKET_TIPS] = {"UserOfficialBlackMarketIntro","商品说明", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_UNION_GROUP_MEMBERS] = {"UIUnionGroupMembers","同盟分组", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_UNION_GROUP_MEM_MANAGER] = {"UIUnionGroupMemManager","同盟分组管理", 1, 0,{1,200,0.85,0}, 150}
panelPropInfo[uiIndexDefine.UI_UNION_GROUP_LIST] = {"UIUnionGroupList","同盟分组列表", 1, 0,{1,200,0.85,0}, 150}
----------------------------华丽的分割线-------------------------------------------------------------


local function get_main_class_by_index(new_index)
	local temp_prop_info = panelPropInfo[new_index]
	if temp_prop_info then
		return _G[temp_prop_info[1]]
	else
		return nil
	end
end

cc.exports.uiPanelInfo = {
				get_main_class_by_index = get_main_class_by_index
}
