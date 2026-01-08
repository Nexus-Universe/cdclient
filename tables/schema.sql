CREATE TABLE "AICombatRoles"
(
    [id] INT32,
    [preferredRole] INT32,
    [specifiedMinRangeNOUSE] REAL,
    [specifiedMaxRangeNOUSE] REAL,
    [specificMinRange] REAL,
    [specificMaxRange] REAL);

CREATE TABLE "AccessoryDefaultLoc"
(
    [GroupID] INT32,
    [Description] TEXT4,
    [Pos_X] REAL,
    [Pos_Y] REAL,
    [Pos_Z] REAL,
    [Rot_X] REAL,
    [Rot_Y] REAL,
    [Rot_Z] REAL);

CREATE TABLE "Activities"
(
    [ActivityID] INT32,
    [locStatus] INT32,
    [instanceMapID] INT32,
    [minTeams] INT32,
    [maxTeams] INT32,
    [minTeamSize] INT32,
    [maxTeamSize] INT32,
    [waitTime] INT32,
    [startDelay] INT32,
    [requiresUniqueData] INT_BOOL,
    [leaderboardType] INT32,
    [localize] INT_BOOL,
    [optionalCostLOT] INT32,
    [optionalCostCount] INT32,
    [showUIRewards] INT_BOOL,
    [CommunityActivityFlagID] INT32,
    [gate_version] TEXT4,
    [noTeamLootOnDeath] INT_BOOL,
    [optionalPercentage] REAL);

CREATE TABLE "ActivityRewards"
(
    [objectTemplate] INT32,
    [ActivityRewardIndex] INT32,
    [activityRating] INT32,
    [LootMatrixIndex] INT32,
    [CurrencyIndex] INT32,
    [ChallengeRating] INT32,
    [description] TEXT4);

CREATE TABLE "ActivityText"
(
    [activityID] INT32,
    [type] TEXT4,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "AnimationIndex"
(
    [animationGroupID] INT32,
    [description] TEXT4,
    [groupType] TEXT4);

CREATE TABLE "Animations"
(
    [animationGroupID] INT32,
    [animation_type] TEXT4,
    [animation_name] TEXT4,
    [chance_to_play] REAL,
    [min_loops] INT32,
    [max_loops] INT32,
    [animation_length] REAL,
    [hideEquip] INT_BOOL,
    [ignoreUpperBody] INT_BOOL,
    [restartable] INT_BOOL,
    [face_animation_name] TEXT4,
    [priority] REAL,
    [blendTime] REAL);

CREATE TABLE "BaseCombatAIComponent"
(
    [id] INT32,
    [behaviorType] INT32,
    [combatRoundLength] REAL,
    [combatRole] INT32,
    [minRoundLength] REAL,
    [maxRoundLength] REAL,
    [tetherSpeed] REAL,
    [pursuitSpeed] REAL,
    [combatStartDelay] REAL,
    [softTetherRadius] REAL,
    [hardTetherRadius] REAL,
    [spawnTimer] REAL,
    [tetherEffectID] INT32,
    [ignoreMediator] INT_BOOL,
    [aggroRadius] REAL,
    [ignoreStatReset] INT_BOOL,
    [ignoreParent] INT_BOOL);

CREATE TABLE "BehaviorEffect"
(
    [effectID] INT32,
    [effectType] TEXT4,
    [effectName] TEXT4,
    [trailID] INT32,
    [pcreateDuration] REAL,
    [animationName] TEXT4,
    [attachToObject] INT_BOOL,
    [boneName] TEXT4,
    [useSecondary] INT_BOOL,
    [cameraEffectType] INT32,
    [cameraDuration] REAL,
    [cameraFrequency] REAL,
    [cameraXAmp] REAL,
    [cameraYAmp] REAL,
    [cameraZAmp] REAL,
    [cameraRotFrequency] REAL,
    [cameraRoll] REAL,
    [cameraPitch] REAL,
    [cameraYaw] REAL,
    [AudioEventGUID] TEXT4,
    [renderEffectType] INT32,
    [renderEffectTime] REAL,
    [renderStartVal] REAL,
    [renderEndVal] REAL,
    [renderDelayVal] REAL,
    [renderValue1] REAL,
    [renderValue2] REAL,
    [renderValue3] REAL,
    [renderRGBA] TEXT4,
    [renderShaderVal] INT32,
    [motionID] INT32,
    [meshID] INT32,
    [meshDuration] REAL,
    [meshLockedNode] TEXT4);

CREATE TABLE "BehaviorParameter"
(
    [behaviorID] INT32,
    [parameterID] TEXT4,
    [value] REAL);

CREATE TABLE "BehaviorTemplate"
(
    [behaviorID] INT32,
    [templateID] INT32,
    [effectID] INT32,
    [effectHandle] TEXT4);

CREATE TABLE "BehaviorTemplateName"
(
    [templateID] INT32,
    [name] TEXT4);

CREATE TABLE "Blueprints"
(
    [id] INT64,
    [name] TEXT4,
    [description] TEXT4,
    [accountid] INT64,
    [characterid] INT64,
    [price] INT32,
    [rating] INT32,
    [categoryid] INT32,
    [lxfpath] TEXT4,
    [deleted] INT_BOOL,
    [created] INT64,
    [modified] INT64);

CREATE TABLE "BrickColors"
(
    [id] INT32,
    [red] REAL,
    [green] REAL,
    [blue] REAL,
    [alpha] REAL,
    [legopaletteid] INT32,
    [description] TEXT4,
    [validTypes] INT32,
    [validCharacters] INT32,
    [factoryValid] INT_BOOL);

CREATE TABLE "BrickIDTable"
(
    [NDObjectID] INT32,
    [LEGOBrickID] INT32);

CREATE TABLE "BuffDefinitions"
(
    [ID] INT32,
    [Priority] REAL,
    [UIIcon] TEXT4);

CREATE TABLE "BuffParameters"
(
    [BuffID] INT32,
    [ParameterName] TEXT4,
    [NumberValue] REAL,
    [StringValue] TEXT4,
    [EffectID] INT32);

CREATE TABLE "Camera"
(
    [camera_name] TEXT4,
    [pitch_angle_tolerance] REAL,
    [starting_zoom] REAL,
    [zoom_return_modifier] REAL,
    [pitch_return_modifier] REAL,
    [tether_out_return_modifier] REAL,
    [tether_in_return_multiplier] REAL,
    [verticle_movement_dampening_modifier] REAL,
    [return_from_incline_modifier] REAL,
    [horizontal_return_modifier] REAL,
    [yaw_behavior_speed_multiplier] REAL,
    [camera_collision_padding] REAL,
    [glide_speed] REAL,
    [fade_player_min_range] REAL,
    [min_movement_delta_tolerance] REAL,
    [min_glide_distance_tolerance] REAL,
    [look_forward_offset] REAL,
    [look_up_offset] REAL,
    [minimum_vertical_dampening_distance] REAL,
    [maximum_vertical_dampening_distance] REAL,
    [minimum_ignore_jump_distance] REAL,
    [maximum_ignore_jump_distance] REAL,
    [maximum_auto_glide_angle] REAL,
    [minimum_tether_glide_distance] REAL,
    [yaw_sign_correction] REAL,
    [set_1_look_forward_offset] REAL,
    [set_1_look_up_offset] REAL,
    [set_2_look_forward_offset] REAL,
    [set_2_look_up_offset] REAL,
    [set_0_speed_influence_on_dir] REAL,
    [set_1_speed_influence_on_dir] REAL,
    [set_2_speed_influence_on_dir] REAL,
    [set_0_angular_relaxation] REAL,
    [set_1_angular_relaxation] REAL,
    [set_2_angular_relaxation] REAL,
    [set_0_position_up_offset] REAL,
    [set_1_position_up_offset] REAL,
    [set_2_position_up_offset] REAL,
    [set_0_position_forward_offset] REAL,
    [set_1_position_forward_offset] REAL,
    [set_2_position_forward_offset] REAL,
    [set_0_FOV] REAL,
    [set_1_FOV] REAL,
    [set_2_FOV] REAL,
    [set_0_max_yaw_angle] REAL,
    [set_1_max_yaw_angle] REAL,
    [set_2_max_yaw_angle] REAL,
    [set_1_fade_in_camera_set_change] INT32,
    [set_1_fade_out_camera_set_change] INT32,
    [set_2_fade_in_camera_set_change] INT32,
    [set_2_fade_out_camera_set_change] INT32,
    [input_movement_scalar] REAL,
    [input_rotation_scalar] REAL,
    [input_zoom_scalar] REAL,
    [minimum_pitch_desired] REAL,
    [maximum_pitch_desired] REAL,
    [minimum_zoom] REAL,
    [maximum_zoom] REAL,
    [horizontal_rotate_tolerance] REAL,
    [horizontal_rotate_modifier] REAL);

CREATE TABLE "CelebrationParameters"
(
    [id] INT32,
    [animation] TEXT4,
    [backgroundObject] INT32,
    [duration] REAL,
    [subText] TEXT4,
    [mainText] TEXT4,
    [iconID] INT32,
    [celeLeadIn] REAL,
    [celeLeadOut] REAL,
    [cameraPathLOT] INT32,
    [pathNodeName] TEXT4,
    [ambientR] REAL,
    [ambientG] REAL,
    [ambientB] REAL,
    [directionalR] REAL,
    [directionalG] REAL,
    [directionalB] REAL,
    [specularR] REAL,
    [specularG] REAL,
    [specularB] REAL,
    [lightPositionX] REAL,
    [lightPositionY] REAL,
    [lightPositionZ] REAL,
    [blendTime] REAL,
    [fogColorR] REAL,
    [fogColorG] REAL,
    [fogColorB] REAL,
    [musicCue] TEXT4,
    [soundGUID] TEXT4,
    [mixerProgram] TEXT4);

CREATE TABLE "ChoiceBuildComponent"
(
    [id] INT32,
    [selections] TEXT4,
    [imaginationOverride] INT32);

CREATE TABLE "CollectibleComponent"
(
    [id] INT32,
    [requirement_mission] INT32);

CREATE TABLE "ComponentsRegistry"
(
    [id] INT32,
    [component_type] INT32,
    [component_id] INT32);

CREATE TABLE "ControlSchemes"
(
    [control_scheme] INT32,
    [scheme_name] TEXT4,
    [rotation_speed] REAL,
    [walk_forward_speed] REAL,
    [walk_backward_speed] REAL,
    [walk_strafe_speed] REAL,
    [walk_strafe_forward_speed] REAL,
    [walk_strafe_backward_speed] REAL,
    [run_backward_speed] REAL,
    [run_strafe_speed] REAL,
    [run_strafe_forward_speed] REAL,
    [run_strafe_backward_speed] REAL,
    [keyboard_zoom_sensitivity] REAL,
    [keyboard_pitch_sensitivity] REAL,
    [keyboard_yaw_sensitivity] REAL,
    [mouse_zoom_wheel_sensitivity] REAL,
    [x_mouse_move_sensitivity_modifier] REAL,
    [y_mouse_move_sensitivity_modifier] REAL,
    [freecam_speed_modifier] REAL,
    [freecam_slow_speed_multiplier] REAL,
    [freecam_fast_speed_multiplier] REAL,
    [freecam_mouse_modifier] REAL,
    [gamepad_pitch_rot_sensitivity] REAL,
    [gamepad_yaw_rot_sensitivity] REAL,
    [gamepad_trigger_sensitivity] REAL);

CREATE TABLE "CurrencyDenominations"
(
    [value] INT32,
    [objectid] INT32);

CREATE TABLE "CurrencyTable"
(
    [currencyIndex] INT32,
    [npcminlevel] INT32,
    [minvalue] INT32,
    [maxvalue] INT32,
    [id] INT32);

CREATE TABLE "DBExclude"
(
    [table] TEXT4,
    [column] TEXT4);

CREATE TABLE "DeletionRestrictions"
(
    [id] INT32,
    [restricted] INT_BOOL,
    [ids] TEXT4,
    [checkType] INT32,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "DestructibleComponent"
(
    [id] INT32,
    [faction] INT32,
    [factionList] TEXT4,
    [life] INT32,
    [imagination] INT32,
    [LootMatrixIndex] INT32,
    [CurrencyIndex] INT32,
    [level] INT32,
    [armor] REAL,
    [death_behavior] INT32,
    [isnpc] INT_BOOL,
    [attack_priority] INT32,
    [isSmashable] INT_BOOL,
    [difficultyLevel] INT32);

CREATE TABLE "DevModelBehaviors"
(
    [ModelID] INT32,
    [BehaviorID] INT32);

CREATE TABLE "Emotes"
(
    [id] INT32,
    [animationName] TEXT4,
    [iconFilename] TEXT4,
    [channel] TEXT4,
    [command] TEXT4,
    [locked] INT_BOOL,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "EventGating"
(
    [eventName] TEXT4,
    [date_start] INT64,
    [date_end] INT64);

CREATE TABLE "ExhibitComponent"
(
    [id] INT32,
    [length] REAL,
    [width] REAL,
    [height] REAL,
    [offsetX] REAL,
    [offsetY] REAL,
    [offsetZ] REAL,
    [fReputationSizeMultiplier] REAL,
    [fImaginationCost] REAL);

CREATE TABLE "Factions"
(
    [faction] INT32,
    [factionList] TEXT4,
    [factionListFriendly] INT_BOOL,
    [friendList] TEXT4,
    [enemyList] TEXT4);

CREATE TABLE "FeatureGating"
(
    [featureName] TEXT4,
    [major] INT32,
    [current] INT32,
    [minor] INT32,
    [description] TEXT4);

CREATE TABLE "FlairTable"
(
    [id] INT32,
    [asset] TEXT4);

CREATE TABLE "Icons"
(
    [IconID] INT32,
    [IconPath] TEXT4,
    [IconName] TEXT4);

CREATE TABLE "InventoryComponent"
(
    [id] INT32,
    [itemid] INT32,
    [count] INT32,
    [equip] INT_BOOL);

CREATE TABLE "ItemComponent"
(
    [id] INT32,
    [equipLocation] TEXT4,
    [baseValue] INT32,
    [isKitPiece] INT_BOOL,
    [rarity] INT32,
    [itemType] INT32,
    [itemInfo] INT64,
    [inLootTable] INT_BOOL,
    [inVendor] INT_BOOL,
    [isUnique] INT_BOOL,
    [isBOP] INT_BOOL,
    [isBOE] INT_BOOL,
    [reqFlagID] INT32,
    [reqSpecialtyID] INT32,
    [reqSpecRank] INT32,
    [reqAchievementID] INT32,
    [stackSize] INT32,
    [color1] INT32,
    [decal] INT32,
    [offsetGroupID] INT32,
    [buildTypes] INT32,
    [reqPrecondition] TEXT4,
    [animationFlag] INT32,
    [equipEffects] INT32,
    [readyForQA] INT_BOOL,
    [itemRating] INT32,
    [isTwoHanded] INT_BOOL,
    [minNumRequired] INT32,
    [delResIndex] INT32,
    [currencyLOT] INT32,
    [altCurrencyCost] INT32,
    [subItems] TEXT4,
    [audioEventUse] TEXT4,
    [noEquipAnimation] INT_BOOL,
    [commendationLOT] INT32,
    [commendationCost] INT32,
    [audioEquipMetaEventSet] TEXT4,
    [currencyCosts] TEXT4,
    [ingredientInfo] TEXT4,
    [locStatus] INT32,
    [forgeType] INT32,
    [SellMultiplier] REAL);

CREATE TABLE "ItemEggData"
(
    [id] INT32,
    [chassie_type_id] INT32);

CREATE TABLE "ItemFoodData"
(
    [id] INT32,
    [element_1] INT32,
    [element_1_amount] INT32,
    [element_2] INT32,
    [element_2_amount] INT32,
    [element_3] INT32,
    [element_3_amount] INT32,
    [element_4] INT32,
    [element_4_amount] INT32);

CREATE TABLE "ItemSetSkills"
(
    [SkillSetID] INT32,
    [SkillID] INT32,
    [SkillCastType] INT32);

CREATE TABLE "ItemSets"
(
    [setID] INT32,
    [locStatus] INT32,
    [itemIDs] TEXT4,
    [kitType] INT32,
    [kitRank] INT32,
    [kitImage] INT32,
    [skillSetWith2] INT32,
    [skillSetWith3] INT32,
    [skillSetWith4] INT32,
    [skillSetWith5] INT32,
    [skillSetWith6] INT32,
    [localize] INT_BOOL,
    [gate_version] TEXT4,
    [kitID] INT32,
    [priority] REAL);

CREATE TABLE "JetPackPadComponent"
(
    [id] INT32,
    [xDistance] REAL,
    [yDistance] REAL,
    [warnDistance] REAL,
    [lotBlocker] INT32,
    [lotWarningVolume] INT32);

CREATE TABLE "LUPExhibitComponent"
(
    [id] INT32,
    [minXZ] REAL,
    [maxXZ] REAL,
    [maxY] REAL,
    [offsetX] REAL,
    [offsetY] REAL,
    [offsetZ] REAL);

CREATE TABLE "LUPExhibitModelData"
(
    [LOT] INT32,
    [minXZ] REAL,
    [maxXZ] REAL,
    [maxY] REAL,
    [description] TEXT4,
    [owner] TEXT4);

CREATE TABLE "LUPZoneIDs"
(
    [zoneID] INT32);

CREATE TABLE "LanguageType"
(
    [LanguageID] INT32,
    [LanguageDescription] TEXT4);

CREATE TABLE "LevelProgressionLookup"
(
    [id] INT32,
    [requiredUScore] INT32,
    [BehaviorEffect] TEXT4);

CREATE TABLE "LootMatrix"
(
    [LootMatrixIndex] INT32,
    [LootTableIndex] INT32,
    [RarityTableIndex] INT32,
    [percent] REAL,
    [minToDrop] INT32,
    [maxToDrop] INT32,
    [id] INT32,
    [flagID] INT32,
    [gate_version] TEXT4);

CREATE TABLE "LootMatrixIndex"
(
    [LootMatrixIndex] INT32,
    [inNpcEditor] INT_BOOL);

CREATE TABLE "LootTable"
(
    [itemid] INT32,
    [LootTableIndex] INT32,
    [id] INT32,
    [MissionDrop] INT_BOOL,
    [sortPriority] INT32);

CREATE TABLE "LootTableIndex"
(
    [LootTableIndex] INT32);

CREATE TABLE "MinifigComponent"
(
    [id] INT32,
    [head] INT32,
    [chest] INT32,
    [legs] INT32,
    [hairstyle] INT32,
    [haircolor] INT32,
    [chestdecal] INT32,
    [headcolor] INT32,
    [lefthand] INT32,
    [righthand] INT32,
    [eyebrowstyle] INT32,
    [eyesstyle] INT32,
    [mouthstyle] INT32);

CREATE TABLE "MinifigDecals_Eyebrows"
(
    [ID] INT32,
    [High_path] TEXT4,
    [Low_path] TEXT4,
    [CharacterCreateValid] INT_BOOL,
    [male] INT_BOOL,
    [female] INT_BOOL);

CREATE TABLE "MinifigDecals_Eyes"
(
    [ID] INT32,
    [High_path] TEXT4,
    [Low_path] TEXT4,
    [CharacterCreateValid] INT_BOOL,
    [male] INT_BOOL,
    [female] INT_BOOL);

CREATE TABLE "MinifigDecals_Legs"
(
    [ID] INT32,
    [High_path] TEXT4);

CREATE TABLE "MinifigDecals_Mouths"
(
    [ID] INT32,
    [High_path] TEXT4,
    [Low_path] TEXT4,
    [CharacterCreateValid] INT_BOOL,
    [male] INT_BOOL,
    [female] INT_BOOL);

CREATE TABLE "MinifigDecals_Torsos"
(
    [ID] INT32,
    [High_path] TEXT4,
    [CharacterCreateValid] INT_BOOL,
    [male] INT_BOOL,
    [female] INT_BOOL);

CREATE TABLE "MissionEmail"
(
    [ID] INT32,
    [messageType] INT32,
    [notificationGroup] INT32,
    [missionID] INT32,
    [attachmentLOT] INT32,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "MissionNPCComponent"
(
    [id] INT32,
    [missionID] INT32,
    [offersMission] INT_BOOL,
    [acceptsMission] INT_BOOL,
    [gate_version] TEXT4);

CREATE TABLE "MissionTasks"
(
    [id] INT32,
    [locStatus] INT32,
    [taskType] INT32,
    [target] INT32,
    [targetGroup] TEXT4,
    [targetValue] INT32,
    [taskParam1] TEXT4,
    [largeTaskIcon] TEXT4,
    [IconID] INT32,
    [uid] INT32,
    [largeTaskIconID] INT32,
    [localize] INT_BOOL,
    [gate_version] TEXT4);

CREATE TABLE "MissionText"
(
    [id] INT32,
    [story_icon] TEXT4,
    [missionIcon] TEXT4,
    [offerNPCIcon] TEXT4,
    [IconID] INT32,
    [state_1_anim] TEXT4,
    [state_2_anim] TEXT4,
    [state_3_anim] TEXT4,
    [state_4_anim] TEXT4,
    [state_3_turnin_anim] TEXT4,
    [state_4_turnin_anim] TEXT4,
    [onclick_anim] TEXT4,
    [CinematicAccepted] TEXT4,
    [CinematicAcceptedLeadin] REAL,
    [CinematicCompleted] TEXT4,
    [CinematicCompletedLeadin] REAL,
    [CinematicRepeatable] TEXT4,
    [CinematicRepeatableLeadin] REAL,
    [CinematicRepeatableCompleted] TEXT4,
    [CinematicRepeatableCompletedLeadin] REAL,
    [AudioEventGUID_Interact] TEXT4,
    [AudioEventGUID_OfferAccept] TEXT4,
    [AudioEventGUID_OfferDeny] TEXT4,
    [AudioEventGUID_Completed] TEXT4,
    [AudioEventGUID_TurnIn] TEXT4,
    [AudioEventGUID_Failed] TEXT4,
    [AudioEventGUID_Progress] TEXT4,
    [AudioMusicCue_OfferAccept] TEXT4,
    [AudioMusicCue_TurnIn] TEXT4,
    [turnInIconID] INT32,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "Missions"
(
    [id] INT32,
    [defined_type] TEXT4,
    [defined_subtype] TEXT4,
    [UISortOrder] INT32,
    [offer_objectID] INT32,
    [target_objectID] INT32,
    [reward_currency] INT64,
    [LegoScore] INT32,
    [reward_reputation] INT64,
    [isChoiceReward] INT_BOOL,
    [reward_item1] INT32,
    [reward_item1_count] INT32,
    [reward_item2] INT32,
    [reward_item2_count] INT32,
    [reward_item3] INT32,
    [reward_item3_count] INT32,
    [reward_item4] INT32,
    [reward_item4_count] INT32,
    [reward_emote] INT32,
    [reward_emote2] INT32,
    [reward_emote3] INT32,
    [reward_emote4] INT32,
    [reward_maximagination] INT32,
    [reward_maxhealth] INT32,
    [reward_maxinventory] INT32,
    [reward_maxmodel] INT32,
    [reward_maxwidget] INT32,
    [reward_maxwallet] INT64,
    [repeatable] INT_BOOL,
    [reward_currency_repeatable] INT64,
    [reward_item1_repeatable] INT32,
    [reward_item1_repeat_count] INT32,
    [reward_item2_repeatable] INT32,
    [reward_item2_repeat_count] INT32,
    [reward_item3_repeatable] INT32,
    [reward_item3_repeat_count] INT32,
    [reward_item4_repeatable] INT32,
    [reward_item4_repeat_count] INT32,
    [time_limit] INT32,
    [isMission] INT_BOOL,
    [missionIconID] INT32,
    [prereqMissionID] TEXT4,
    [localize] INT_BOOL,
    [inMOTD] INT_BOOL,
    [cooldownTime] INT64,
    [isRandom] INT_BOOL,
    [randomPool] TEXT4,
    [UIPrereqID] INT32,
    [gate_version] TEXT4,
    [HUDStates] TEXT4,
    [locStatus] INT32,
    [reward_bankinventory] INT32);

CREATE TABLE "ModelBehavior"
(
    [id] INT32,
    [definitionXMLfilename] TEXT4);

CREATE TABLE "ModularBuildComponent"
(
    [id] INT32,
    [buildType] INT32,
    [xml] TEXT_XML,
    [createdLOT] INT32,
    [createdPhysicsID] INT32,
    [AudioEventGUID_Snap] TEXT4,
    [AudioEventGUID_Complete] TEXT4,
    [AudioEventGUID_Present] TEXT4);

CREATE TABLE "ModuleComponent"
(
    [id] INT32,
    [partCode] INT32,
    [buildType] INT32,
    [xml] TEXT_XML,
    [primarySoundGUID] TEXT4,
    [assembledEffectID] INT32);

CREATE TABLE "MotionFX"
(
    [id] INT32,
    [typeID] INT32,
    [slamVelocity] REAL,
    [addVelocity] REAL,
    [duration] REAL,
    [destGroupName] TEXT4,
    [startScale] REAL,
    [endScale] REAL,
    [velocity] REAL,
    [distance] REAL);

CREATE TABLE "MovementAIComponent"
(
    [id] INT32,
    [MovementType] TEXT4,
    [WanderChance] REAL,
    [WanderDelayMin] REAL,
    [WanderDelayMax] REAL,
    [WanderSpeed] REAL,
    [WanderRadius] REAL,
    [attachedPath] TEXT4);

CREATE TABLE "MovingPlatforms"
(
    [id] INT32,
    [platformIsSimpleMover] INT_BOOL,
    [platformMoveX] REAL,
    [platformMoveY] REAL,
    [platformMoveZ] REAL,
    [platformMoveTime] REAL,
    [platformStartAtEnd] INT_BOOL,
    [description] TEXT4);

CREATE TABLE "NpcIcons"
(
    [id] INT32,
    [color] INT32,
    [offset] REAL,
    [LOT] INT32,
    [Texture] TEXT4,
    [isClickable] INT_BOOL,
    [scale] REAL,
    [rotateToFace] INT_BOOL,
    [compositeHorizOffset] REAL,
    [compositeVertOffset] REAL,
    [compositeScale] REAL,
    [compositeConnectionNode] TEXT4,
    [compositeLOTMultiMission] INT32,
    [compositeLOTMultiMissionVentor] INT32,
    [compositeIconTexture] TEXT4);

CREATE TABLE "ObjectBehaviorXREF"
(
    [LOT] INT32,
    [behaviorID1] INT64,
    [behaviorID2] INT64,
    [behaviorID3] INT64,
    [behaviorID4] INT64,
    [behaviorID5] INT64,
    [type] INT32);

CREATE TABLE "ObjectBehaviors"
(
    [BehaviorID] INT64,
    [xmldata] TEXT_XML);

CREATE TABLE "ObjectSkills"
(
    [objectTemplate] INT32,
    [skillID] INT32,
    [castOnType] INT32,
    [AICombatWeight] INT32);

CREATE TABLE "Objects"
(
    [id] INT32,
    [name] TEXT4,
    [placeable] INT_BOOL,
    [type] TEXT4,
    [description] TEXT4,
    [localize] INT_BOOL,
    [npcTemplateID] INT32,
    [displayName] TEXT4,
    [interactionDistance] REAL,
    [nametag] INT_BOOL,
    [_internalNotes] TEXT4,
    [locStatus] INT32,
    [gate_version] TEXT4,
    [HQ_valid] INT_BOOL);

CREATE TABLE "PackageComponent"
(
    [id] INT32,
    [LootMatrixIndex] INT32,
    [packageType] INT32);

CREATE TABLE "PetAbilities"
(
    [id] INT32,
    [AbilityName] TEXT4,
    [ImaginationCost] INT32,
    [locStatus] INT32);

CREATE TABLE "PetComponent"
(
    [id] INT32,
    [minTameUpdateTime] REAL,
    [maxTameUpdateTime] REAL,
    [percentTameChance] REAL,
    [tamability] REAL,
    [elementType] INT32,
    [walkSpeed] REAL,
    [runSpeed] REAL,
    [sprintSpeed] REAL,
    [idleTimeMin] REAL,
    [idleTimeMax] REAL,
    [petForm] INT32,
    [imaginationDrainRate] REAL,
    [AudioMetaEventSet] TEXT4,
    [buffIDs] TEXT4);

CREATE TABLE "PetNestComponent"
(
    [id] INT32,
    [ElementalType] INT32);

CREATE TABLE "PhysicsComponent"
(
    [id] INT32,
    [static] REAL,
    [physics_asset] TEXT4,
    [jump] REAL,
    [doublejump] REAL,
    [speed] REAL,
    [rotSpeed] REAL,
    [playerHeight] REAL,
    [playerRadius] REAL,
    [pcShapeType] INT32,
    [collisionGroup] INT32,
    [airSpeed] REAL,
    [boundaryAsset] TEXT4,
    [jumpAirSpeed] REAL,
    [friction] REAL,
    [gravityVolumeAsset] TEXT4);

CREATE TABLE "PlayerFlags"
(
    [id] INT32,
    [SessionOnly] INT_BOOL,
    [OnlySetByServer] INT_BOOL,
    [SessionZoneOnly] INT_BOOL);

CREATE TABLE "PlayerStatistics"
(
    [statID] INT32,
    [sortOrder] INT32,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "PossessableComponent"
(
    [id] INT32,
    [controlSchemeID] INT32,
    [minifigAttachPoint] TEXT4,
    [minifigAttachAnimation] TEXT4,
    [minifigDetachAnimation] TEXT4,
    [mountAttachAnimation] TEXT4,
    [mountDetachAnimation] TEXT4,
    [attachOffsetFwd] REAL,
    [attachOffsetRight] REAL,
    [possessionType] INT32,
    [wantBillboard] INT_BOOL,
    [billboardOffsetUp] REAL,
    [depossessOnHit] INT_BOOL,
    [hitStunTime] REAL,
    [skillSet] INT32);

CREATE TABLE "Preconditions"
(
    [id] INT32,
    [type] INT32,
    [targetLOT] TEXT4,
    [targetGroup] TEXT4,
    [targetCount] INT32,
    [iconID] INT32,
    [localize] INT_BOOL,
    [validContexts] INT64,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "PropertyEntranceComponent"
(
    [id] INT32,
    [mapID] INT32,
    [propertyName] TEXT4,
    [isOnProperty] INT_BOOL,
    [groupType] TEXT4);

CREATE TABLE "PropertyTemplate"
(
    [id] INT32,
    [mapID] INT32,
    [vendorMapID] INT32,
    [spawnName] TEXT4,
    [type] INT32,
    [sizecode] INT32,
    [minimumPrice] INT32,
    [rentDuration] INT32,
    [path] TEXT4,
    [cloneLimit] INT32,
    [durationType] INT32,
    [achievementRequired] INT32,
    [zoneX] REAL,
    [zoneY] REAL,
    [zoneZ] REAL,
    [maxBuildHeight] REAL,
    [localize] INT_BOOL,
    [reputationPerMinute] INT32,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "ProximityMonitorComponent"
(
    [id] INT32,
    [Proximities] TEXT4,
    [LoadOnClient] INT_BOOL,
    [LoadOnServer] INT_BOOL);

CREATE TABLE "ProximityTypes"
(
    [id] INT32,
    [Name] TEXT4,
    [Radius] INT32,
    [CollisionGroup] INT32,
    [PassiveChecks] INT_BOOL,
    [IconID] INT32,
    [LoadOnClient] INT_BOOL,
    [LoadOnServer] INT_BOOL);

CREATE TABLE "RacingModuleComponent"
(
    [id] INT32,
    [topSpeed] REAL,
    [acceleration] REAL,
    [handling] REAL,
    [stability] REAL,
    [imagination] REAL);

CREATE TABLE "RailActivatorComponent"
(
    [id] INT32,
    [startAnim] TEXT4,
    [loopAnim] TEXT4,
    [stopAnim] TEXT4,
    [startSound] TEXT4,
    [loopSound] TEXT4,
    [stopSound] TEXT4,
    [effectIDs] TEXT4,
    [preconditions] TEXT4,
    [playerCollision] INT_BOOL,
    [cameraLocked] INT_BOOL,
    [StartEffectID] TEXT4,
    [StopEffectID] TEXT4,
    [DamageImmune] INT_BOOL,
    [NoAggro] INT_BOOL,
    [ShowNameBillboard] INT_BOOL);

CREATE TABLE "RarityTable"
(
    [id] INT32,
    [randmax] REAL,
    [rarity] INT32,
    [RarityTableIndex] INT32);

CREATE TABLE "RarityTableIndex"
(
    [RarityTableIndex] INT32);

CREATE TABLE "RebuildComponent"
(
    [id] INT32,
    [reset_time] REAL,
    [complete_time] REAL,
    [take_imagination] INT32,
    [interruptible] INT_BOOL,
    [self_activator] INT_BOOL,
    [custom_modules] TEXT4,
    [activityID] INT32,
    [post_imagination_cost] INT32,
    [time_before_smash] REAL);

CREATE TABLE "RebuildSections"
(
    [id] INT32,
    [rebuildID] INT32,
    [objectID] INT32,
    [offset_x] REAL,
    [offset_y] REAL,
    [offset_z] REAL,
    [fall_angle_x] REAL,
    [fall_angle_y] REAL,
    [fall_angle_z] REAL,
    [fall_height] REAL,
    [requires_list] TEXT4,
    [size] INT32,
    [bPlaced] INT_BOOL);

CREATE TABLE "Release_Version"
(
    [ReleaseVersion] TEXT4,
    [ReleaseDate] INT64);

CREATE TABLE "RenderComponent"
(
    [id] INT32,
    [render_asset] TEXT4,
    [icon_asset] TEXT4,
    [IconID] INT32,
    [shader_id] INT32,
    [effect1] INT32,
    [effect2] INT32,
    [effect3] INT32,
    [effect4] INT32,
    [effect5] INT32,
    [effect6] INT32,
    [animationGroupIDs] TEXT4,
    [fade] INT_BOOL,
    [usedropshadow] INT_BOOL,
    [preloadAnimations] INT_BOOL,
    [fadeInTime] REAL,
    [maxShadowDistance] REAL,
    [ignoreCameraCollision] INT_BOOL,
    [renderComponentLOD1] INT32,
    [renderComponentLOD2] INT32,
    [gradualSnap] INT_BOOL,
    [animationFlag] INT32,
    [AudioMetaEventSet] TEXT4,
    [billboardHeight] REAL,
    [chatBubbleOffset] REAL,
    [staticBillboard] INT_BOOL,
    [LXFMLFolder] TEXT4,
    [attachIndicatorsToNode] INT_BOOL);

CREATE TABLE "RenderComponentFlash"
(
    [id] INT32,
    [interactive] INT_BOOL,
    [animated] INT_BOOL,
    [nodeName] TEXT4,
    [flashPath] TEXT4,
    [elementName] TEXT4,
    [_uid] INT32);

CREATE TABLE "RenderComponentWrapper"
(
    [id] INT32,
    [defaultWrapperAsset] TEXT4);

CREATE TABLE "RenderIconAssets"
(
    [id] INT32,
    [icon_asset] TEXT4,
    [blank_column] TEXT4);

CREATE TABLE "ReputationRewards"
(
    [repLevel] INT32,
    [sublevel] INT32,
    [reputation] REAL);

CREATE TABLE "RewardCodes"
(
    [id] INT32,
    [code] TEXT4,
    [attachmentLOT] INT32,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "Rewards"
(
    [id] INT32,
    [LevelID] INT32,
    [MissionID] INT32,
    [RewardType] INT32,
    [value] INT32,
    [count] INT32);

CREATE TABLE "RocketLaunchpadControlComponent"
(
    [id] INT32,
    [targetZone] INT32,
    [defaultZoneID] INT32,
    [targetScene] TEXT4,
    [gmLevel] INT32,
    [playerAnimation] TEXT4,
    [rocketAnimation] TEXT4,
    [launchMusic] TEXT4,
    [useLaunchPrecondition] INT_BOOL,
    [useAltLandingPrecondition] INT_BOOL,
    [launchPrecondition] TEXT4,
    [altLandingPrecondition] TEXT4,
    [altLandingSpawnPointName] TEXT4);

CREATE TABLE "SceneTable"
(
    [sceneID] INT32,
    [sceneName] TEXT4);

CREATE TABLE "ScriptComponent"
(
    [id] INT32,
    [script_name] TEXT4,
    [client_script_name] TEXT4);

CREATE TABLE "SkillBehavior"
(
    [skillID] INT32,
    [locStatus] INT32,
    [behaviorID] INT32,
    [imaginationcost] INT32,
    [cooldowngroup] INT32,
    [cooldown] REAL,
    [inNpcEditor] INT_BOOL,
    [skillIcon] INT32,
    [oomSkillID] TEXT4,
    [oomBehaviorEffectID] INT32,
    [castTypeDesc] INT32,
    [imBonusUI] INT32,
    [lifeBonusUI] INT32,
    [armorBonusUI] INT32,
    [damageUI] INT32,
    [hideIcon] INT_BOOL,
    [localize] INT_BOOL,
    [gate_version] TEXT4,
    [cancelType] INT32);

CREATE TABLE "SmashableChain"
(
    [chainIndex] INT32,
    [chainLevel] INT32,
    [lootMatrixID] INT32,
    [rarityTableIndex] INT32,
    [currencyIndex] INT32,
    [currencyLevel] INT32,
    [smashCount] INT32,
    [timeLimit] INT32,
    [chainStepID] INT32);

CREATE TABLE "SmashableChainIndex"
(
    [id] INT32,
    [targetGroup] TEXT4,
    [description] TEXT4,
    [continuous] INT32);

CREATE TABLE "SmashableComponent"
(
    [id] INT32,
    [LootMatrixIndex] INT32);

CREATE TABLE "SmashableElements"
(
    [elementID] INT32,
    [dropWeight] INT32);

CREATE TABLE "SpeedchatMenu"
(
    [id] INT32,
    [parentId] INT32,
    [emoteId] INT32,
    [imageName] TEXT4,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "SubscriptionPricing"
(
    [id] INT32,
    [countryCode] TEXT4,
    [monthlyFeeGold] TEXT4,
    [monthlyFeeSilver] TEXT4,
    [monthlyFeeBronze] TEXT4,
    [monetarySymbol] INT32,
    [symbolIsAppended] INT_BOOL);

CREATE TABLE "SurfaceType"
(
    [SurfaceType] INT32,
    [FootstepNDAudioMetaEventSetName] TEXT4);

CREATE TABLE "TamingBuildPuzzles"
(
    [id] INT32,
    [PuzzleModelLot] INT32,
    [NPCLot] INT32,
    [ValidPiecesLXF] TEXT4,
    [InvalidPiecesLXF] TEXT4,
    [Difficulty] INT32,
    [Timelimit] INT32,
    [NumValidPieces] INT32,
    [TotalNumPieces] INT32,
    [ModelName] TEXT4,
    [FullModelLXF] TEXT4,
    [Duration] REAL,
    [imagCostPerBuild] INT32);

CREATE TABLE "TextDescription"
(
    [TextID] INT32,
    [TestDescription] TEXT4);

CREATE TABLE "TextLanguage"
(
    [TextID] INT32,
    [LanguageID] INT32,
    [Text] TEXT4);

CREATE TABLE "TrailEffects"
(
    [trailID] INT32,
    [textureName] TEXT4,
    [blendmode] INT32,
    [cardlifetime] REAL,
    [colorlifetime] REAL,
    [minTailFade] REAL,
    [tailFade] REAL,
    [max_particles] INT32,
    [birthDelay] REAL,
    [deathDelay] REAL,
    [bone1] TEXT4,
    [bone2] TEXT4,
    [texLength] REAL,
    [texWidth] REAL,
    [startColorR] REAL,
    [startColorG] REAL,
    [startColorB] REAL,
    [startColorA] REAL,
    [middleColorR] REAL,
    [middleColorG] REAL,
    [middleColorB] REAL,
    [middleColorA] REAL,
    [endColorR] REAL,
    [endColorG] REAL,
    [endColorB] REAL,
    [endColorA] REAL);

CREATE TABLE "UGBehaviorSounds"
(
    [id] INT32,
    [guid] TEXT4,
    [localize] INT_BOOL,
    [locStatus] INT32,
    [gate_version] TEXT4);

CREATE TABLE "VehiclePhysics"
(
    [id] INT32,
    [hkxFilename] TEXT4,
    [fGravityScale] REAL,
    [fMass] REAL,
    [fChassisFriction] REAL,
    [fMaxSpeed] REAL,
    [fEngineTorque] REAL,
    [fBrakeFrontTorque] REAL,
    [fBrakeRearTorque] REAL,
    [fBrakeMinInputToBlock] REAL,
    [fBrakeMinTimeToBlock] REAL,
    [fSteeringMaxAngle] REAL,
    [fSteeringSpeedLimitForMaxAngle] REAL,
    [fSteeringMinAngle] REAL,
    [fFwdBias] REAL,
    [fFrontTireFriction] REAL,
    [fRearTireFriction] REAL,
    [fFrontTireFrictionSlide] REAL,
    [fRearTireFrictionSlide] REAL,
    [fFrontTireSlipAngle] REAL,
    [fRearTireSlipAngle] REAL,
    [fWheelWidth] REAL,
    [fWheelRadius] REAL,
    [fWheelMass] REAL,
    [fReorientPitchStrength] REAL,
    [fReorientRollStrength] REAL,
    [fSuspensionLength] REAL,
    [fSuspensionStrength] REAL,
    [fSuspensionDampingCompression] REAL,
    [fSuspensionDampingRelaxation] REAL,
    [iChassisCollisionGroup] INT32,
    [fNormalSpinDamping] REAL,
    [fCollisionSpinDamping] REAL,
    [fCollisionThreshold] REAL,
    [fTorqueRollFactor] REAL,
    [fTorquePitchFactor] REAL,
    [fTorqueYawFactor] REAL,
    [fInertiaRoll] REAL,
    [fInertiaPitch] REAL,
    [fInertiaYaw] REAL,
    [fExtraTorqueFactor] REAL,
    [fCenterOfMassFwd] REAL,
    [fCenterOfMassUp] REAL,
    [fCenterOfMassRight] REAL,
    [fWheelHardpointFrontFwd] REAL,
    [fWheelHardpointFrontUp] REAL,
    [fWheelHardpointFrontRight] REAL,
    [fWheelHardpointRearFwd] REAL,
    [fWheelHardpointRearUp] REAL,
    [fWheelHardpointRearRight] REAL,
    [fInputTurnSpeed] REAL,
    [fInputDeadTurnBackSpeed] REAL,
    [fInputAccelSpeed] REAL,
    [fInputDeadAccelDownSpeed] REAL,
    [fInputDecelSpeed] REAL,
    [fInputDeadDecelDownSpeed] REAL,
    [fInputSlopeChangePointX] REAL,
    [fInputInitialSlope] REAL,
    [fInputDeadZone] REAL,
    [fAeroAirDensity] REAL,
    [fAeroFrontalArea] REAL,
    [fAeroDragCoefficient] REAL,
    [fAeroLiftCoefficient] REAL,
    [fAeroExtraGravity] REAL,
    [fBoostTopSpeed] REAL,
    [fBoostCostPerSecond] REAL,
    [fBoostAccelerateChange] REAL,
    [fBoostDampingChange] REAL,
    [fPowerslideNeutralAngle] REAL,
    [fPowerslideTorqueStrength] REAL,
    [iPowerslideNumTorqueApplications] INT32,
    [fImaginationTankSize] REAL,
    [fSkillCost] REAL,
    [fWreckSpeedBase] REAL,
    [fWreckSpeedPercent] REAL,
    [fWreckMinAngle] REAL,
    [AudioEventEngine] TEXT4,
    [AudioEventSkid] TEXT4,
    [AudioEventLightHit] TEXT4,
    [AudioSpeedThresholdLightHit] REAL,
    [AudioTimeoutLightHit] REAL,
    [AudioEventHeavyHit] TEXT4,
    [AudioSpeedThresholdHeavyHit] REAL,
    [AudioTimeoutHeavyHit] REAL,
    [AudioEventStart] TEXT4,
    [AudioEventTreadConcrete] TEXT4,
    [AudioEventTreadSand] TEXT4,
    [AudioEventTreadWood] TEXT4,
    [AudioEventTreadDirt] TEXT4,
    [AudioEventTreadPlastic] TEXT4,
    [AudioEventTreadGrass] TEXT4,
    [AudioEventTreadGravel] TEXT4,
    [AudioEventTreadMud] TEXT4,
    [AudioEventTreadWater] TEXT4,
    [AudioEventTreadSnow] TEXT4,
    [AudioEventTreadIce] TEXT4,
    [AudioEventTreadMetal] TEXT4,
    [AudioEventTreadLeaves] TEXT4,
    [AudioEventLightLand] TEXT4,
    [AudioAirtimeForLightLand] REAL,
    [AudioEventHeavyLand] TEXT4,
    [AudioAirtimeForHeavyLand] REAL,
    [bWheelsVisible] INT_BOOL);

CREATE TABLE "VehicleStatMap"
(
    [id] INT32,
    [ModuleStat] TEXT4,
    [HavokStat] TEXT4,
    [HavokChangePerModuleStat] REAL);

CREATE TABLE "VendorComponent"
(
    [id] INT32,
    [buyScalar] REAL,
    [sellScalar] REAL,
    [refreshTimeSeconds] REAL,
    [LootMatrixIndex] INT32);

CREATE TABLE "WhatsCoolItemSpotlight"
(
    [id] INT32,
    [itemID] INT32,
    [localize] INT_BOOL,
    [gate_version] TEXT4,
    [locStatus] INT32);

CREATE TABLE "WhatsCoolNewsAndTips"
(
    [id] INT32,
    [iconID] INT32,
    [type] INT32,
    [localize] INT_BOOL,
    [gate_version] TEXT4,
    [locStatus] INT32);

CREATE TABLE "WorldConfig"
(
    [WorldConfigID] INT32,
    [pegravityvalue] REAL,
    [pebroadphaseworldsize] REAL,
    [pegameobjscalefactor] REAL,
    [character_rotation_speed] REAL,
    [character_walk_forward_speed] REAL,
    [character_walk_backward_speed] REAL,
    [character_walk_strafe_speed] REAL,
    [character_walk_strafe_forward_speed] REAL,
    [character_walk_strafe_backward_speed] REAL,
    [character_run_backward_speed] REAL,
    [character_run_strafe_speed] REAL,
    [character_run_strafe_forward_speed] REAL,
    [character_run_strafe_backward_speed] REAL,
    [global_cooldown] REAL,
    [characterGroundedTime] REAL,
    [characterGroundedSpeed] REAL,
    [globalImmunityTime] REAL,
    [character_max_slope] REAL,
    [defaultrespawntime] REAL,
    [mission_tooltip_timeout] REAL,
    [vendor_buy_multiplier] REAL,
    [pet_follow_radius] REAL,
    [character_eye_height] REAL,
    [flight_vertical_velocity] REAL,
    [flight_airspeed] REAL,
    [flight_fuel_ratio] REAL,
    [flight_max_airspeed] REAL,
    [fReputationPerVote] REAL,
    [nPropertyCloneLimit] INT32,
    [defaultHomespaceTemplate] INT32,
    [coins_lost_on_death_percent] REAL,
    [coins_lost_on_death_min] INT32,
    [coins_lost_on_death_max] INT32,
    [character_votes_per_day] INT32,
    [property_moderation_request_approval_cost] INT32,
    [property_moderation_request_review_cost] INT32,
    [propertyModRequestsAllowedSpike] INT32,
    [propertyModRequestsAllowedInterval] INT32,
    [propertyModRequestsAllowedTotal] INT32,
    [propertyModRequestsSpikeDuration] INT32,
    [propertyModRequestsIntervalDuration] INT32,
    [modelModerateOnCreate] INT_BOOL,
    [defaultPropertyMaxHeight] REAL,
    [reputationPerVoteCast] REAL,
    [reputationPerVoteReceived] REAL,
    [showcaseTopModelConsiderationBattles] INT32,
    [reputationPerBattlePromotion] REAL,
    [coins_lost_on_death_min_timeout] REAL,
    [coins_lost_on_death_max_timeout] REAL,
    [mail_base_fee] INT32,
    [mail_percent_attachment_fee] REAL,
    [propertyReputationDelay] INT32,
    [LevelCap] INT32,
    [LevelUpBehaviorEffect] TEXT4,
    [CharacterVersion] INT32,
    [LevelCapCurrencyConversion] INT32);

CREATE TABLE "ZoneLoadingTips"
(
    [id] INT32,
    [zoneid] INT32,
    [imagelocation] TEXT4,
    [localize] INT_BOOL,
    [gate_version] TEXT4,
    [locStatus] INT32,
    [weight] INT32,
    [targetVersion] TEXT4);

CREATE TABLE "ZoneSummary"
(
    [zoneID] INT32,
    [type] INT32,
    [value] INT32,
    [_uniqueID] INT32);

CREATE TABLE "ZoneTable"
(
    [zoneID] INT32,
    [locStatus] INT32,
    [zoneName] TEXT4,
    [scriptID] INT32,
    [ghostdistance_min] REAL,
    [ghostdistance] REAL,
    [population_soft_cap] INT32,
    [population_hard_cap] INT32,
    [DisplayDescription] TEXT4,
    [mapFolder] TEXT4,
    [smashableMinDistance] REAL,
    [smashableMaxDistance] REAL,
    [mixerProgram] TEXT4,
    [clientPhysicsFramerate] TEXT4,
    [serverPhysicsFramerate] TEXT4,
    [zoneControlTemplate] INT32,
    [widthInChunks] INT32,
    [heightInChunks] INT32,
    [petsAllowed] INT_BOOL,
    [localize] INT_BOOL,
    [fZoneWeight] REAL,
    [thumbnail] TEXT4,
    [PlayerLoseCoinsOnDeath] INT_BOOL,
    [disableSaveLoc] INT_BOOL,
    [teamRadius] REAL,
    [gate_version] TEXT4,
    [mountsAllowed] INT_BOOL);

CREATE TABLE "brickAttributes"
(
    [ID] INT32,
    [icon_asset] TEXT4,
    [display_order] INT32,
    [locStatus] INT32);

CREATE TABLE "dtproperties"
(
    [id] INT32,
    [objectid] INT32,
    [property] TEXT4,
    [value] TEXT4,
    [uvalue] TEXT4,
    [lvalue] BLOB_NONE,
    [version] INT32);

CREATE TABLE "mapAnimationPriorities"
(
    [id] INT32,
    [name] TEXT4,
    [priority] REAL);

CREATE TABLE "mapAssetType"
(
    [id] INT32,
    [label] TEXT4,
    [pathdir] TEXT4,
    [typelabel] TEXT4);

CREATE TABLE "mapIcon"
(
    [LOT] INT32,
    [iconID] INT32,
    [iconState] INT32);

CREATE TABLE "mapItemTypes"
(
    [id] INT32,
    [description] TEXT4,
    [equipLocation] TEXT4);

CREATE TABLE "mapRenderEffects"
(
    [id] INT32,
    [gameID] INT32,
    [description] TEXT4);

CREATE TABLE "mapShaders"
(
    [id] INT32,
    [label] TEXT4,
    [gameValue] INT32,
    [priority] INT32);

CREATE TABLE "mapTextureResource"
(
    [id] INT32,
    [texturepath] TEXT4,
    [SurfaceType] INT32);

CREATE TABLE "map_BlueprintCategory"
(
    [id] INT32,
    [description] TEXT4,
    [enabled] INT_BOOL);

CREATE TABLE "sysdiagrams"
(
    [name] TEXT4,
    [principal_id] INT32,
    [diagram_id] INT32,
    [version] INT32,
    [definition] TEXT4);

