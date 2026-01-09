CREATE TABLE "AICombatRoles" (
	"id"	INTEGER NOT NULL UNIQUE,
	"preferredRole"	INT32,
	"specifiedMinRangeNOUSE"	REAL DEFAULT -1,
	"specifiedMaxRangeNOUSE"	REAL DEFAULT -1,
	"specificMinRange"	REAL,
	"specificMaxRange"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id") REFERENCES "AICombatRoles"("id")
);

CREATE TABLE "AccessoryDefaultLoc" (
	"GroupID"	INT32 NOT NULL UNIQUE,
	"Description"	TEXT4 NOT NULL,
	"Pos_X"	REAL NOT NULL DEFAULT 0,
	"Pos_Y"	REAL NOT NULL DEFAULT 0,
	"Pos_Z"	REAL NOT NULL DEFAULT 0,
	"Rot_X"	REAL NOT NULL DEFAULT 0,
	"Rot_Y"	REAL NOT NULL DEFAULT 0,
	"Rot_Z"	REAL NOT NULL DEFAULT 0,
	PRIMARY KEY("GroupID")
);

CREATE TABLE "Activities" (
	"ActivityID"	INT32 UNIQUE,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"instanceMapID"	INT32,
	"minTeams"	INT32,
	"maxTeams"	INT32,
	"minTeamSize"	INT32,
	"maxTeamSize"	INT32,
	"waitTime"	INT32,
	"startDelay"	INT32,
	"requiresUniqueData"	INT_BOOL NOT NULL DEFAULT 0,
	"leaderboardType"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"optionalCostLOT"	INT32,
	"optionalCostCount"	INT32,
	"showUIRewards"	INT_BOOL NOT NULL DEFAULT 1,
	"CommunityActivityFlagID"	INT32,
	"gate_version"	TEXT4,
	"noTeamLootOnDeath"	INT_BOOL,
	"optionalPercentage"	REAL,
	PRIMARY KEY("ActivityID")
);

CREATE TABLE "ActivityRewards" (
	"objectTemplate"	INT32 NOT NULL,
	"ActivityRewardIndex"	INT32 NOT NULL,
	"activityRating"	INT32 NOT NULL DEFAULT -1,
	"LootMatrixIndex"	INT32,
	"CurrencyIndex"	INT32,
	"ChallengeRating"	INT32,
	"description"	TEXT4,
	PRIMARY KEY("objectTemplate","ActivityRewardIndex")
);

CREATE TABLE "ActivityText" (
	"activityID"	INT32 NOT NULL,
	"type"	TEXT4 NOT NULL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("activityID","type"),
	FOREIGN KEY("activityID") REFERENCES "Activities"("ActivityID")
);

CREATE TABLE "AnimationIndex" (
	"animationGroupID"	INT32 UNIQUE,
	"description"	TEXT4,
	"groupType"	TEXT4,
	PRIMARY KEY("animationGroupID")
);

CREATE TABLE "Animations" (
	"animationGroupID"	INT32 NOT NULL,
	"animation_type"	TEXT4 NOT NULL,
	"animation_name"	TEXT4 NOT NULL,
	"chance_to_play"	REAL NOT NULL,
	"min_loops"	INT32,
	"max_loops"	INT32,
	"animation_length"	REAL NOT NULL,
	"hideEquip"	INT_BOOL NOT NULL DEFAULT 0,
	"ignoreUpperBody"	INT_BOOL NOT NULL DEFAULT 0,
	"restartable"	INT_BOOL NOT NULL DEFAULT 0,
	"face_animation_name"	TEXT4,
	"priority"	REAL,
	"blendTime"	REAL,
	PRIMARY KEY("animationGroupID","animation_type","animation_name"),
	FOREIGN KEY("animationGroupID") REFERENCES "AnimationIndex"("animationGroupID")
);

CREATE TABLE "BaseCombatAIComponent" (
	"id"	INTEGER UNIQUE,
	"behaviorType"	INT32,
	"combatRoundLength"	REAL,
	"combatRole"	INT32,
	"minRoundLength"	REAL,
	"maxRoundLength"	REAL,
	"tetherSpeed"	REAL,
	"pursuitSpeed"	REAL,
	"combatStartDelay"	REAL,
	"softTetherRadius"	REAL,
	"hardTetherRadius"	REAL,
	"spawnTimer"	REAL,
	"tetherEffectID"	INT32,
	"ignoreMediator"	INT_BOOL NOT NULL DEFAULT 1,
	"aggroRadius"	REAL,
	"ignoreStatReset"	INT_BOOL,
	"ignoreParent"	INT_BOOL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "BehaviorEffect" (
	"effectID"	INT32 NOT NULL,
	"effectType"	TEXT4 NOT NULL,
	"effectName"	TEXT4,
	"trailID"	INT32,
	"pcreateDuration"	REAL,
	"animationName"	TEXT4,
	"attachToObject"	INT_BOOL NOT NULL DEFAULT 0,
	"boneName"	TEXT4,
	"useSecondary"	INT_BOOL NOT NULL DEFAULT 0,
	"cameraEffectType"	INT32,
	"cameraDuration"	REAL,
	"cameraFrequency"	REAL,
	"cameraXAmp"	REAL,
	"cameraYAmp"	REAL,
	"cameraZAmp"	REAL,
	"cameraRotFrequency"	REAL,
	"cameraRoll"	REAL,
	"cameraPitch"	REAL,
	"cameraYaw"	REAL,
	"AudioEventGUID"	TEXT4,
	"renderEffectType"	INT32,
	"renderEffectTime"	REAL,
	"renderStartVal"	REAL,
	"renderEndVal"	REAL,
	"renderDelayVal"	REAL,
	"renderValue1"	REAL,
	"renderValue2"	REAL,
	"renderValue3"	REAL,
	"renderRGBA"	TEXT4,
	"renderShaderVal"	INT32,
	"motionID"	INT32,
	"meshID"	INT32,
	"meshDuration"	REAL,
	"meshLockedNode"	TEXT4,
	PRIMARY KEY("effectID","effectType")
);

CREATE TABLE "BehaviorParameter" (
	"behaviorID"	INT32 NOT NULL,
	"parameterID"	TEXT4 NOT NULL,
	"value"	REAL,
	PRIMARY KEY("behaviorID","parameterID"),
	FOREIGN KEY("behaviorID") REFERENCES "BehaviorTemplate"("behaviorID")
);

CREATE TABLE "BehaviorTemplate" (
	"behaviorID"	INT32 NOT NULL,
	"templateID"	INT32 NOT NULL,
	"effectID"	INT32 NOT NULL DEFAULT 0,
	"effectHandle"	TEXT4,
	FOREIGN KEY("templateID") REFERENCES "BehaviorTemplateName"("templateID")
);

CREATE TABLE "BehaviorTemplateName" (
	"templateID"	INT32 UNIQUE,
	"name"	TEXT4 NOT NULL,
	PRIMARY KEY("templateID")
);

CREATE TABLE "Blueprints" (
	"id"	INT64 NOT NULL UNIQUE,
	"name"	TEXT4 NOT NULL,
	"description"	TEXT4,
	"accountid"	INT64 NOT NULL,
	"characterid"	INT64 NOT NULL,
	"price"	INT32 NOT NULL,
	"rating"	INT32,
	"categoryid"	INT32 NOT NULL,
	"lxfpath"	TEXT4,
	"deleted"	INT_BOOL NOT NULL,
	"created"	INT64 NOT NULL,
	"modified"	INT64 NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "BrickColors" (
	"id"	INT32 UNIQUE,
	"red"	REAL NOT NULL DEFAULT 0,
	"green"	REAL NOT NULL DEFAULT 0,
	"blue"	REAL NOT NULL DEFAULT 0,
	"alpha"	REAL,
	"legopaletteid"	INT32 NOT NULL DEFAULT 0 UNIQUE,
	"description"	TEXT4,
	"validTypes"	INT32,
	"validCharacters"	INT32,
	"factoryValid"	INT_BOOL NOT NULL DEFAULT 1,
	PRIMARY KEY("id")
);

CREATE TABLE "BrickIDTable" (
	"NDObjectID"	INT32 NOT NULL,
	"LEGOBrickID"	INT32 NOT NULL UNIQUE,
	PRIMARY KEY("LEGOBrickID"),
	FOREIGN KEY("NDObjectID") REFERENCES "Objects"("id")
);

CREATE TABLE "BuffDefinitions" (
	"ID"	INT32 UNIQUE,
	"Priority"	REAL NOT NULL,
	"UIIcon"	TEXT4,
	PRIMARY KEY("ID")
);

CREATE TABLE "BuffParameters" (
	"BuffID"	INT32,
	"ParameterName"	TEXT4 NOT NULL,
	"NumberValue"	REAL,
	"StringValue"	TEXT4,
	"EffectID"	INT32
);

CREATE TABLE "Camera" (
	"camera_name"	TEXT4 UNIQUE,
	"pitch_angle_tolerance"	REAL DEFAULT .1,
	"starting_zoom"	REAL DEFAULT 28,
	"zoom_return_modifier"	REAL DEFAULT 15,
	"pitch_return_modifier"	REAL DEFAULT 1.5,
	"tether_out_return_modifier"	REAL DEFAULT 1.5,
	"tether_in_return_multiplier"	REAL DEFAULT 5,
	"verticle_movement_dampening_modifier"	REAL DEFAULT 5.5,
	"return_from_incline_modifier"	REAL DEFAULT 1.5,
	"horizontal_return_modifier"	REAL DEFAULT 4.5,
	"yaw_behavior_speed_multiplier"	REAL DEFAULT 4,
	"camera_collision_padding"	REAL DEFAULT .1,
	"glide_speed"	REAL DEFAULT 3.4,
	"fade_player_min_range"	REAL DEFAULT 1.56,
	"min_movement_delta_tolerance"	REAL DEFAULT .0001,
	"min_glide_distance_tolerance"	REAL DEFAULT .0005,
	"look_forward_offset"	REAL DEFAULT 120.0,
	"look_up_offset"	REAL DEFAULT 10.0,
	"minimum_vertical_dampening_distance"	REAL DEFAULT 4.0,
	"maximum_vertical_dampening_distance"	REAL DEFAULT 6.5,
	"minimum_ignore_jump_distance"	REAL DEFAULT 5.0,
	"maximum_ignore_jump_distance"	REAL DEFAULT 13.0,
	"maximum_auto_glide_angle"	REAL DEFAULT .5235,
	"minimum_tether_glide_distance"	REAL DEFAULT 3.0,
	"yaw_sign_correction"	REAL DEFAULT 1.0,
	"set_1_look_forward_offset"	REAL,
	"set_1_look_up_offset"	REAL,
	"set_2_look_forward_offset"	REAL,
	"set_2_look_up_offset"	REAL,
	"set_0_speed_influence_on_dir"	REAL DEFAULT 1.0,
	"set_1_speed_influence_on_dir"	REAL DEFAULT 1.0,
	"set_2_speed_influence_on_dir"	REAL,
	"set_0_angular_relaxation"	REAL DEFAULT 3.5,
	"set_1_angular_relaxation"	REAL DEFAULT 4.5,
	"set_2_angular_relaxation"	REAL,
	"set_0_position_up_offset"	REAL DEFAULT 8.0,
	"set_1_position_up_offset"	REAL,
	"set_2_position_up_offset"	REAL,
	"set_0_position_forward_offset"	REAL DEFAULT -25.0,
	"set_1_position_forward_offset"	REAL,
	"set_2_position_forward_offset"	REAL,
	"set_0_FOV"	REAL DEFAULT 60,
	"set_1_FOV"	REAL DEFAULT 82.5,
	"set_2_FOV"	REAL,
	"set_0_max_yaw_angle"	REAL,
	"set_1_max_yaw_angle"	REAL,
	"set_2_max_yaw_angle"	REAL,
	"set_1_fade_in_camera_set_change"	INT32,
	"set_1_fade_out_camera_set_change"	INT32,
	"set_2_fade_in_camera_set_change"	INT32,
	"set_2_fade_out_camera_set_change"	INT32,
	"input_movement_scalar"	REAL DEFAULT 1,
	"input_rotation_scalar"	REAL DEFAULT 1,
	"input_zoom_scalar"	REAL,
	"minimum_pitch_desired"	REAL DEFAULT 105,
	"maximum_pitch_desired"	REAL DEFAULT 100,
	"minimum_zoom"	REAL DEFAULT 15,
	"maximum_zoom"	REAL DEFAULT 50,
	"horizontal_rotate_tolerance"	REAL DEFAULT 0.35,
	"horizontal_rotate_modifier"	REAL DEFAULT 2.5,
	PRIMARY KEY("camera_name")
);

CREATE TABLE "CelebrationParameters" (
	"id"	INTEGER UNIQUE,
	"animation"	TEXT4,
	"backgroundObject"	INT32 NOT NULL,
	"duration"	REAL NOT NULL,
	"subText"	TEXT4,
	"mainText"	TEXT4,
	"iconID"	INT32,
	"celeLeadIn"	REAL NOT NULL,
	"celeLeadOut"	REAL NOT NULL,
	"cameraPathLOT"	INT32,
	"pathNodeName"	TEXT4 NOT NULL,
	"ambientR"	REAL,
	"ambientG"	REAL,
	"ambientB"	REAL,
	"directionalR"	REAL,
	"directionalG"	REAL,
	"directionalB"	REAL,
	"specularR"	REAL,
	"specularG"	REAL,
	"specularB"	REAL,
	"lightPositionX"	REAL,
	"lightPositionY"	REAL,
	"lightPositionZ"	REAL,
	"blendTime"	REAL,
	"fogColorR"	REAL,
	"fogColorG"	REAL,
	"fogColorB"	REAL,
	"musicCue"	TEXT4,
	"soundGUID"	TEXT4,
	"mixerProgram"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ChoiceBuildComponent" (
	"id"	INT32 UNIQUE,
	"selections"	TEXT4,
	"imaginationOverride"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "CollectibleComponent" (
	"id"	INT32 UNIQUE,
	"requirement_mission"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "ComponentsRegistry" (
	"id"	INT32 NOT NULL,
	"component_type"	INT32 NOT NULL DEFAULT 0,
	"component_id"	INT32 NOT NULL
);

CREATE TABLE "ControlSchemes" (
	"control_scheme"	INT32 UNIQUE,
	"scheme_name"	TEXT4,
	"rotation_speed"	REAL,
	"walk_forward_speed"	REAL,
	"walk_backward_speed"	REAL,
	"walk_strafe_speed"	REAL,
	"walk_strafe_forward_speed"	REAL,
	"walk_strafe_backward_speed"	REAL,
	"run_backward_speed"	REAL,
	"run_strafe_speed"	REAL,
	"run_strafe_forward_speed"	REAL,
	"run_strafe_backward_speed"	REAL,
	"keyboard_zoom_sensitivity"	REAL,
	"keyboard_pitch_sensitivity"	REAL,
	"keyboard_yaw_sensitivity"	REAL,
	"mouse_zoom_wheel_sensitivity"	REAL,
	"x_mouse_move_sensitivity_modifier"	REAL,
	"y_mouse_move_sensitivity_modifier"	REAL,
	"freecam_speed_modifier"	REAL,
	"freecam_slow_speed_multiplier"	REAL,
	"freecam_fast_speed_multiplier"	REAL,
	"freecam_mouse_modifier"	REAL,
	"gamepad_pitch_rot_sensitivity"	REAL,
	"gamepad_yaw_rot_sensitivity"	REAL,
	"gamepad_trigger_sensitivity"	REAL,
	PRIMARY KEY("control_scheme")
);

CREATE TABLE "CurrencyDenominations" (
	"value"	INT32 NOT NULL,
	"objectid"	INT32 NOT NULL,
	PRIMARY KEY("value")
);

CREATE TABLE "CurrencyTable" (
	"currencyIndex"	INT32,
	"npcminlevel"	INT32 NOT NULL,
	"minvalue"	INT32 NOT NULL,
	"maxvalue"	INT32 NOT NULL,
	"id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "DBExclude"
(
    [table] TEXT4,
    [column] TEXT4);

CREATE TABLE "DeletionRestrictions" (
	"id"	INT32 UNIQUE,
	"restricted"	INT_BOOL NOT NULL DEFAULT 0,
	"ids"	TEXT4,
	"checkType"	INT32 NOT NULL DEFAULT 0,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "DestructibleComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"faction"	INT32,
	"factionList"	TEXT4,
	"life"	INT32,
	"imagination"	INT32,
	"LootMatrixIndex"	INT32,
	"CurrencyIndex"	INT32,
	"level"	INT32,
	"armor"	REAL,
	"death_behavior"	INT32 NOT NULL DEFAULT 0,
	"isnpc"	INT_BOOL NOT NULL DEFAULT 0,
	"attack_priority"	INT32 NOT NULL DEFAULT 1,
	"isSmashable"	INT_BOOL NOT NULL DEFAULT 0,
	"difficultyLevel"	INT32,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("LootMatrixIndex") REFERENCES "LootMatrixIndex"("LootMatrixIndex")
);

CREATE TABLE "DevModelBehaviors" (
	"ModelID"	INT32 UNIQUE,
	"BehaviorID"	INTEGER NOT NULL,
	PRIMARY KEY("ModelID")
);

CREATE TABLE "Emotes" (
	"id"	INTEGER UNIQUE,
	"animationName"	TEXT4,
	"iconFilename"	TEXT4,
	"channel"	TEXT4,
	"command"	TEXT4,
	"locked"	INT_BOOL NOT NULL DEFAULT 0,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "EventGating" (
	"eventName"	TEXT4 UNIQUE,
	"date_start"	INT64,
	"date_end"	INT64,
	PRIMARY KEY("eventName")
);

CREATE TABLE "ExhibitComponent" (
	"id"	INT32 UNIQUE,
	"length"	REAL,
	"width"	REAL,
	"height"	REAL,
	"offsetX"	REAL,
	"offsetY"	REAL,
	"offsetZ"	REAL,
	"fReputationSizeMultiplier"	REAL,
	"fImaginationCost"	REAL,
	PRIMARY KEY("id")
);

CREATE TABLE "Factions" (
	"faction"	INT32 UNIQUE,
	"factionList"	TEXT4 NOT NULL,
	"factionListFriendly"	INT_BOOL NOT NULL,
	"friendList"	TEXT4,
	"enemyList"	TEXT4,
	PRIMARY KEY("faction")
);

CREATE TABLE "FeatureGating" (
	"featureName"	TEXT4 UNIQUE,
	"major"	INT32,
	"current"	INT32,
	"minor"	INT32,
	"description"	TEXT4,
	PRIMARY KEY("featureName")
);

CREATE TABLE "FlairTable" (
	"id"	INT32 UNIQUE,
	"asset"	TEXT4 NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Icons" (
	"IconID"	INTEGER UNIQUE,
	"IconPath"	TEXT4,
	"IconName"	TEXT4,
	PRIMARY KEY("IconID" AUTOINCREMENT)
);

CREATE TABLE "InventoryComponent" (
	"id"	INT32 NOT NULL,
	"itemid"	INT32 NOT NULL,
	"count"	INT32 NOT NULL DEFAULT 1,
	"equip"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("id","itemid")
);

CREATE TABLE "ItemComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"equipLocation"	TEXT4 DEFAULT 0,
	"baseValue"	INT32,
	"isKitPiece"	INT_BOOL NOT NULL,
	"rarity"	INT32,
	"itemType"	INT32 NOT NULL,
	"itemInfo"	INT64,
	"inLootTable"	INT_BOOL NOT NULL,
	"inVendor"	INT_BOOL NOT NULL,
	"isUnique"	INT_BOOL NOT NULL,
	"isBOP"	INT_BOOL NOT NULL,
	"isBOE"	INT_BOOL NOT NULL,
	"reqFlagID"	INT32 DEFAULT 0,
	"reqSpecialtyID"	INT32 DEFAULT 0,
	"reqSpecRank"	INT32 DEFAULT 0,
	"reqAchievementID"	INT32 DEFAULT 0,
	"stackSize"	INT32 DEFAULT 0,
	"color1"	INT32,
	"decal"	INT32,
	"offsetGroupID"	INT32,
	"buildTypes"	INT32,
	"reqPrecondition"	TEXT4,
	"animationFlag"	INT32,
	"equipEffects"	INT32,
	"readyForQA"	INT_BOOL NOT NULL,
	"itemRating"	INT32,
	"isTwoHanded"	INT_BOOL NOT NULL,
	"minNumRequired"	INT32,
	"delResIndex"	INT32,
	"currencyLOT"	INT32,
	"altCurrencyCost"	INT32,
	"subItems"	TEXT4,
	"audioEventUse"	TEXT4,
	"noEquipAnimation"	INT_BOOL,
	"commendationLOT"	INT32,
	"commendationCost"	INT32,
	"audioEquipMetaEventSet"	TEXT4,
	"currencyCosts"	TEXT4,
	"ingredientInfo"	TEXT4,
	"locStatus"	INT32,
	"forgeType"	INT32,
	"SellMultiplier"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ItemEggData" (
	"id"	INT32,
	"chassie_type_id"	INT32 NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "ItemFoodData" (
	"id"	INT32 UNIQUE,
	"element_1"	INT32,
	"element_1_amount"	INT32,
	"element_2"	INT32,
	"element_2_amount"	INT32,
	"element_3"	INT32,
	"element_3_amount"	INT32,
	"element_4"	INT32,
	"element_4_amount"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "ItemSetSkills" (
	"SkillSetID"	INT32 NOT NULL,
	"SkillID"	INT32 NOT NULL,
	"SkillCastType"	INT32,
	PRIMARY KEY("SkillSetID","SkillID")
);

CREATE TABLE "ItemSets" (
	"setID"	INT32 UNIQUE,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"itemIDs"	TEXT4 NOT NULL,
	"kitType"	INT32,
	"kitRank"	INT32,
	"kitImage"	INT32,
	"skillSetWith2"	INT32,
	"skillSetWith3"	INT32,
	"skillSetWith4"	INT32,
	"skillSetWith5"	INT32,
	"skillSetWith6"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	"kitID"	INT32,
	"priority"	REAL,
	PRIMARY KEY("setID")
);

CREATE TABLE "JetPackPadComponent"
(
    [id] INT32,
    [xDistance] REAL,
    [yDistance] REAL,
    [warnDistance] REAL,
    [lotBlocker] INT32,
    [lotWarningVolume] INT32);

CREATE TABLE "LUPExhibitComponent" (
	"id"	INT32 UNIQUE,
	"minXZ"	REAL,
	"maxXZ"	REAL NOT NULL,
	"maxY"	REAL,
	"offsetX"	REAL,
	"offsetY"	REAL,
	"offsetZ"	REAL,
	PRIMARY KEY("id")
);

CREATE TABLE "LUPExhibitModelData" (
	"LOT"	INT32 UNIQUE,
	"minXZ"	REAL NOT NULL,
	"maxXZ"	REAL NOT NULL,
	"maxY"	REAL NOT NULL,
	"description"	TEXT4,
	"owner"	TEXT4,
	PRIMARY KEY("LOT")
);

CREATE TABLE "LUPZoneIDs" (
	"zoneID"	INT32 UNIQUE,
	PRIMARY KEY("zoneID")
);

CREATE TABLE "LanguageType" (
	"LanguageID"	INT32 UNIQUE,
	"LanguageDescription"	TEXT4 NOT NULL,
	PRIMARY KEY("LanguageID")
);

CREATE TABLE "LevelProgressionLookup"
(
    [id] INT32,
    [requiredUScore] INT32,
    [BehaviorEffect] TEXT4);

CREATE TABLE "LootMatrix" (
	"LootMatrixIndex"	INT32 NOT NULL,
	"LootTableIndex"	INT32 NOT NULL,
	"RarityTableIndex"	INT32 NOT NULL,
	"percent"	REAL NOT NULL,
	"minToDrop"	INT32 NOT NULL DEFAULT 0,
	"maxToDrop"	INT32 NOT NULL DEFAULT 1,
	"id"	INTEGER,
	"flagID"	INT32,
	"gate_version"	TEXT4,
	FOREIGN KEY("RarityTableIndex") REFERENCES "RarityTableIndex"("RarityTableIndex")
);

CREATE TABLE "LootMatrixIndex" (
	"LootMatrixIndex"	INTEGER NOT NULL UNIQUE,
	"inNpcEditor"	INT_BOOL NOT NULL,
	PRIMARY KEY("LootMatrixIndex" AUTOINCREMENT)
);

CREATE TABLE "LootTable" (
	"itemid"	INT32 NOT NULL,
	"LootTableIndex"	INT32 NOT NULL,
	"id"	INTEGER NOT NULL UNIQUE,
	"MissionDrop"	INT_BOOL NOT NULL DEFAULT 0,
	"sortPriority"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id")
);

CREATE TABLE "LootTableIndex" (
	"LootTableIndex"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("LootTableIndex" AUTOINCREMENT)
);

CREATE TABLE "MinifigComponent" (
	"id"	INT32 UNIQUE,
	"head"	INT32,
	"chest"	INT32,
	"legs"	INT32,
	"hairstyle"	INT32,
	"haircolor"	INT32,
	"chestdecal"	INT32,
	"headcolor"	INT32,
	"lefthand"	INT32,
	"righthand"	INT32,
	"eyebrowstyle"	INT32,
	"eyesstyle"	INT32,
	"mouthstyle"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "MinifigDecals_Eyebrows" (
	"ID"	INT32 UNIQUE,
	"High_path"	TEXT4,
	"Low_path"	TEXT4,
	"CharacterCreateValid"	INT_BOOL NOT NULL,
	"male"	INT_BOOL NOT NULL,
	"female"	INT_BOOL NOT NULL,
	PRIMARY KEY("ID")
);

CREATE TABLE "MinifigDecals_Eyes" (
	"ID"	INT32 UNIQUE,
	"High_path"	TEXT4,
	"Low_path"	TEXT4,
	"CharacterCreateValid"	INT_BOOL NOT NULL,
	"male"	INT_BOOL NOT NULL,
	"female"	INT_BOOL NOT NULL,
	PRIMARY KEY("ID")
);

CREATE TABLE "MinifigDecals_Legs" (
	"ID"	INT32 UNIQUE,
	"High_path"	TEXT4 NOT NULL,
	PRIMARY KEY("ID")
);

CREATE TABLE "MinifigDecals_Mouths" (
	"ID"	INT32 UNIQUE,
	"High_path"	TEXT4,
	"Low_path"	TEXT4,
	"CharacterCreateValid"	INT_BOOL NOT NULL,
	"male"	INT_BOOL NOT NULL,
	"female"	INT_BOOL NOT NULL,
	PRIMARY KEY("ID")
);

CREATE TABLE "MinifigDecals_Torsos" (
	"ID"	INT32 UNIQUE,
	"High_path"	TEXT4,
	"CharacterCreateValid"	INT_BOOL NOT NULL,
	"male"	INT_BOOL NOT NULL DEFAULT 0,
	"female"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("ID")
);

CREATE TABLE "MissionEmail" (
	"ID"	INTEGER UNIQUE,
	"messageType"	INT32 NOT NULL,
	"notificationGroup"	INT32 NOT NULL,
	"missionID"	INT32 NOT NULL,
	"attachmentLOT"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

CREATE TABLE "MissionNPCComponent" (
	"id"	INT32 NOT NULL,
	"missionID"	INT32 NOT NULL,
	"offersMission"	INT_BOOL NOT NULL DEFAULT 1,
	"acceptsMission"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	PRIMARY KEY("id","missionID")
);

CREATE TABLE "MissionTasks" (
	"id"	INT32 NOT NULL,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"taskType"	INT32,
	"target"	INT32,
	"targetGroup"	TEXT4,
	"targetValue"	INT32,
	"taskParam1"	TEXT4,
	"largeTaskIcon"	TEXT4,
	"IconID"	INT32,
	"uid"	INTEGER NOT NULL UNIQUE,
	"largeTaskIconID"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	PRIMARY KEY("uid" AUTOINCREMENT)
);

CREATE TABLE "MissionText" (
	"id"	INT32 NOT NULL UNIQUE,
	"story_icon"	TEXT4,
	"missionIcon"	TEXT4,
	"offerNPCIcon"	TEXT4,
	"IconID"	INT32,
	"state_1_anim"	TEXT4,
	"state_2_anim"	TEXT4,
	"state_3_anim"	TEXT4,
	"state_4_anim"	TEXT4,
	"state_3_turnin_anim"	TEXT4,
	"state_4_turnin_anim"	TEXT4,
	"onclick_anim"	TEXT4,
	"CinematicAccepted"	TEXT4,
	"CinematicAcceptedLeadin"	REAL,
	"CinematicCompleted"	TEXT4,
	"CinematicCompletedLeadin"	REAL,
	"CinematicRepeatable"	TEXT4,
	"CinematicRepeatableLeadin"	REAL,
	"CinematicRepeatableCompleted"	TEXT4,
	"CinematicRepeatableCompletedLeadin"	REAL,
	"AudioEventGUID_Interact"	TEXT4,
	"AudioEventGUID_OfferAccept"	TEXT4,
	"AudioEventGUID_OfferDeny"	TEXT4,
	"AudioEventGUID_Completed"	TEXT4,
	"AudioEventGUID_TurnIn"	TEXT4,
	"AudioEventGUID_Failed"	TEXT4,
	"AudioEventGUID_Progress"	TEXT4,
	"AudioMusicCue_OfferAccept"	TEXT4,
	"AudioMusicCue_TurnIn"	TEXT4,
	"turnInIconID"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "Missions" (
	"id"	INT32 NOT NULL UNIQUE,
	"defined_type"	TEXT4,
	"defined_subtype"	TEXT4,
	"UISortOrder"	INT32,
	"offer_objectID"	INT32,
	"target_objectID"	INT32,
	"reward_currency"	INT64,
	"LegoScore"	INT32,
	"reward_reputation"	INT64,
	"isChoiceReward"	INT_BOOL NOT NULL DEFAULT 0,
	"reward_item1"	INT32 NOT NULL DEFAULT -1,
	"reward_item1_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item2"	INT32 NOT NULL DEFAULT -1,
	"reward_item2_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item3"	INT32 NOT NULL DEFAULT -1,
	"reward_item3_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item4"	INT32 NOT NULL DEFAULT -1,
	"reward_item4_count"	INT32 NOT NULL DEFAULT 1,
	"reward_emote"	INT32 NOT NULL DEFAULT -1,
	"reward_emote2"	INT32 NOT NULL DEFAULT -1,
	"reward_emote3"	INT32 NOT NULL DEFAULT -1,
	"reward_emote4"	INT32 NOT NULL DEFAULT -1,
	"reward_maximagination"	INT32 NOT NULL DEFAULT 0,
	"reward_maxhealth"	INT32 NOT NULL DEFAULT 0,
	"reward_maxinventory"	INT32,
	"reward_maxmodel"	INT32,
	"reward_maxwidget"	INT32,
	"reward_maxwallet"	INT64,
	"repeatable"	INT_BOOL NOT NULL DEFAULT 0,
	"reward_currency_repeatable"	INT64,
	"reward_item1_repeatable"	INT32 NOT NULL DEFAULT -1,
	"reward_item1_repeat_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item2_repeatable"	INT32 NOT NULL DEFAULT -1,
	"reward_item2_repeat_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item3_repeatable"	INT32 NOT NULL DEFAULT -1,
	"reward_item3_repeat_count"	INT32 NOT NULL DEFAULT 1,
	"reward_item4_repeatable"	INT32 NOT NULL DEFAULT -1,
	"reward_item4_repeat_count"	INT32 NOT NULL DEFAULT 1,
	"time_limit"	INT32,
	"isMission"	INT_BOOL NOT NULL DEFAULT -1,
	"missionIconID"	INT32,
	"prereqMissionID"	TEXT4,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"inMOTD"	INT_BOOL NOT NULL DEFAULT 0,
	"cooldownTime"	INT64,
	"isRandom"	INT_BOOL NOT NULL DEFAULT 0,
	"randomPool"	TEXT4,
	"UIPrereqID"	INT32,
	"gate_version"	TEXT4,
	"HUDStates"	TEXT4,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"reward_bankinventory"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "ModelBehavior" (
	"id"	INTEGER UNIQUE,
	"definitionXMLfilename"	TEXT4 NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ModularBuildComponent" (
	"id"	INTEGER UNIQUE,
	"buildType"	INT32 NOT NULL,
	"xml"	TEXT_XML,
	"createdLOT"	INT32,
	"createdPhysicsID"	INT32,
	"AudioEventGUID_Snap"	TEXT4,
	"AudioEventGUID_Complete"	TEXT4,
	"AudioEventGUID_Present"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ModuleComponent" (
	"id"	INTEGER UNIQUE,
	"partCode"	INT32 NOT NULL,
	"buildType"	INT32 NOT NULL,
	"xml"	TEXT_XML,
	"primarySoundGUID"	TEXT4,
	"assembledEffectID"	INT32,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "MotionFX" (
	"id"	INT32 NOT NULL UNIQUE,
	"typeID"	INT32 NOT NULL,
	"slamVelocity"	REAL,
	"addVelocity"	REAL,
	"duration"	REAL,
	"destGroupName"	TEXT4,
	"startScale"	REAL,
	"endScale"	REAL,
	"velocity"	REAL,
	"distance"	REAL,
	PRIMARY KEY("id")
);

CREATE TABLE "MovementAIComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"MovementType"	TEXT4 NOT NULL,
	"WanderChance"	REAL,
	"WanderDelayMin"	REAL,
	"WanderDelayMax"	REAL,
	"WanderSpeed"	REAL,
	"WanderRadius"	REAL,
	"attachedPath"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

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

CREATE TABLE "NpcIcons" (
	"id"	INTEGER NOT NULL UNIQUE,
	"color"	INT32,
	"offset"	REAL,
	"LOT"	INT32,
	"Texture"	TEXT4,
	"isClickable"	INT_BOOL NOT NULL,
	"scale"	REAL DEFAULT 1,
	"rotateToFace"	INT_BOOL NOT NULL DEFAULT 0,
	"compositeHorizOffset"	REAL,
	"compositeVertOffset"	REAL,
	"compositeScale"	REAL,
	"compositeConnectionNode"	TEXT4,
	"compositeLOTMultiMission"	INT32,
	"compositeLOTMultiMissionVentor"	INT32,
	"compositeIconTexture"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ObjectBehaviorXREF" (
	"LOT"	INT32 NOT NULL,
	"behaviorID1"	INT64,
	"behaviorID2"	INT64,
	"behaviorID3"	INT64,
	"behaviorID4"	INT64,
	"behaviorID5"	INT64,
	"type"	INT32,
	PRIMARY KEY("LOT")
);

CREATE TABLE "ObjectBehaviors" (
	"BehaviorID"	INT64 NOT NULL UNIQUE,
	"xmldata"	TEXT_XML,
	PRIMARY KEY("BehaviorID")
);

CREATE TABLE "ObjectSkills" (
	"objectTemplate"	INT32 NOT NULL,
	"skillID"	INT32 NOT NULL,
	"castOnType"	INT32,
	"AICombatWeight"	INT32,
	PRIMARY KEY("objectTemplate","skillID"),
	FOREIGN KEY("objectTemplate") REFERENCES "Objects"("id")
);

CREATE TABLE "Objects" (
	"id"	INT32 NOT NULL UNIQUE,
	"name"	TEXT4 DEFAULT ' ',
	"placeable"	INT_BOOL NOT NULL DEFAULT 1,
	"type"	TEXT4 NOT NULL DEFAULT ' ',
	"description"	TEXT4,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"npcTemplateID"	INT32,
	"displayName"	TEXT4,
	"interactionDistance"	REAL,
	"nametag"	INT_BOOL NOT NULL DEFAULT 0,
	"_internalNotes"	TEXT4,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	"HQ_valid"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("id")
);

CREATE TABLE "PackageComponent" (
	"id"	INT32 NOT NULL UNIQUE,
	"LootMatrixIndex"	INT32 NOT NULL,
	"packageType"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id")
);

CREATE TABLE "PetAbilities" (
	"id"	INT32 NOT NULL UNIQUE,
	"AbilityName"	TEXT4,
	"ImaginationCost"	INT32,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id")
);

CREATE TABLE "PetComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"minTameUpdateTime"	REAL,
	"maxTameUpdateTime"	REAL,
	"percentTameChance"	REAL,
	"tamability"	REAL,
	"elementType"	INT32,
	"walkSpeed"	REAL,
	"runSpeed"	REAL,
	"sprintSpeed"	REAL,
	"idleTimeMin"	REAL,
	"idleTimeMax"	REAL,
	"petForm"	INT32,
	"imaginationDrainRate"	REAL,
	"AudioMetaEventSet"	TEXT4,
	"buffIDs"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "PetNestComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"ElementalType"	INT32,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "PhysicsComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"static"	REAL NOT NULL,
	"physics_asset"	TEXT4,
	"jump"	REAL NOT NULL,
	"doublejump"	REAL NOT NULL DEFAULT 0,
	"speed"	REAL,
	"rotSpeed"	REAL,
	"playerHeight"	REAL,
	"playerRadius"	REAL,
	"pcShapeType"	INT32 NOT NULL,
	"collisionGroup"	INT32 NOT NULL,
	"airSpeed"	REAL NOT NULL DEFAULT 10,
	"boundaryAsset"	TEXT4,
	"jumpAirSpeed"	REAL DEFAULT 25,
	"friction"	REAL,
	"gravityVolumeAsset"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "PlayerFlags" (
	"id"	INT32 NOT NULL UNIQUE,
	"SessionOnly"	INT_BOOL NOT NULL DEFAULT 0,
	"OnlySetByServer"	INT_BOOL NOT NULL DEFAULT 0,
	"SessionZoneOnly"	INT_BOOL,
	PRIMARY KEY("id")
);

CREATE TABLE "PlayerStatistics" (
	"statID"	INTEGER NOT NULL UNIQUE,
	"sortOrder"	INT32,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("statID" AUTOINCREMENT)
);

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

CREATE TABLE "Preconditions" (
	"id"	INT32 NOT NULL UNIQUE,
	"type"	INT32,
	"targetLOT"	TEXT4,
	"targetGroup"	TEXT4,
	"targetCount"	INT32,
	"iconID"	INT32,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"validContexts"	INT64 NOT NULL DEFAULT 0,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "PropertyEntranceComponent"
(
    [id] INT32,
    [mapID] INT32,
    [propertyName] TEXT4,
    [isOnProperty] INT_BOOL,
    [groupType] TEXT4);

CREATE TABLE "PropertyTemplate" (
	"id"	INTEGER NOT NULL UNIQUE,
	"mapID"	INT32 NOT NULL,
	"vendorMapID"	INT32,
	"spawnName"	TEXT4 NOT NULL,
	"type"	INT32 NOT NULL DEFAULT 0,
	"sizecode"	INT32 NOT NULL DEFAULT 0,
	"minimumPrice"	INT32 NOT NULL DEFAULT 0,
	"rentDuration"	INT32 NOT NULL DEFAULT 0,
	"path"	TEXT4,
	"cloneLimit"	INT32 NOT NULL DEFAULT 1,
	"durationType"	INT32 NOT NULL DEFAULT 3,
	"achievementRequired"	INT32 DEFAULT 0,
	"zoneX"	REAL DEFAULT 0,
	"zoneY"	REAL,
	"zoneZ"	REAL,
	"maxBuildHeight"	REAL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"reputationPerMinute"	INT32 NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ProximityMonitorComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"Proximities"	TEXT4,
	"LoadOnClient"	INT_BOOL NOT NULL DEFAULT 0,
	"LoadOnServer"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ProximityTypes" (
	"id"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT4 NOT NULL,
	"Radius"	INT32,
	"CollisionGroup"	INT32,
	"PassiveChecks"	INT_BOOL NOT NULL DEFAULT 1,
	"IconID"	INT32,
	"LoadOnClient"	INT_BOOL NOT NULL DEFAULT 0,
	"LoadOnServer"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "RacingModuleComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"topSpeed"	REAL,
	"acceleration"	REAL,
	"handling"	REAL,
	"stability"	REAL,
	"imagination"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

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

CREATE TABLE "RarityTable" (
	"id"	INTEGER NOT NULL UNIQUE,
	"randmax"	REAL NOT NULL,
	"rarity"	INT32 NOT NULL,
	"RarityTableIndex"	INT32 NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("RarityTableIndex") REFERENCES "RarityTableIndex"("RarityTableIndex")
);

CREATE TABLE "RarityTableIndex" (
	"RarityTableIndex"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("RarityTableIndex" AUTOINCREMENT)
);

CREATE TABLE "RebuildComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"reset_time"	REAL NOT NULL DEFAULT 20,
	"complete_time"	REAL,
	"take_imagination"	INT32 NOT NULL DEFAULT 1,
	"interruptible"	INT_BOOL NOT NULL DEFAULT 0,
	"self_activator"	INT_BOOL NOT NULL DEFAULT 0,
	"custom_modules"	TEXT4,
	"activityID"	INT32,
	"post_imagination_cost"	INT32,
	"time_before_smash"	REAL NOT NULL DEFAULT 10,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "RebuildSections" (
	"id"	INTEGER NOT NULL UNIQUE,
	"rebuildID"	INT32 NOT NULL,
	"objectID"	INT32 NOT NULL,
	"offset_x"	REAL,
	"offset_y"	REAL,
	"offset_z"	REAL,
	"fall_angle_x"	REAL,
	"fall_angle_y"	REAL,
	"fall_angle_z"	REAL,
	"fall_height"	REAL,
	"requires_list"	TEXT4,
	"size"	INT32 NOT NULL DEFAULT 0,
	"bPlaced"	INT_BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "Release_Version" (
	"ReleaseVersion"	TEXT4 NOT NULL UNIQUE,
	"ReleaseDate"	INT64 NOT NULL DEFAULT (getutcdate()),
	PRIMARY KEY("ReleaseVersion")
);

CREATE TABLE "RenderComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"render_asset"	TEXT4,
	"icon_asset"	TEXT4,
	"IconID"	INT32,
	"shader_id"	INT32,
	"effect1"	INT32,
	"effect2"	INT32,
	"effect3"	INT32,
	"effect4"	INT32,
	"effect5"	INT32,
	"effect6"	INT32,
	"animationGroupIDs"	TEXT4,
	"fade"	INT_BOOL NOT NULL DEFAULT 1,
	"usedropshadow"	INT_BOOL NOT NULL DEFAULT 0,
	"preloadAnimations"	INT_BOOL NOT NULL DEFAULT 0,
	"fadeInTime"	REAL NOT NULL DEFAULT 1,
	"maxShadowDistance"	REAL NOT NULL DEFAULT 0,
	"ignoreCameraCollision"	INT_BOOL NOT NULL DEFAULT 0,
	"renderComponentLOD1"	INT32,
	"renderComponentLOD2"	INT32,
	"gradualSnap"	INT_BOOL NOT NULL DEFAULT 0,
	"animationFlag"	INT32,
	"AudioMetaEventSet"	TEXT4,
	"billboardHeight"	REAL,
	"chatBubbleOffset"	REAL,
	"staticBillboard"	INT_BOOL NOT NULL DEFAULT 0,
	"LXFMLFolder"	TEXT4,
	"attachIndicatorsToNode"	INT_BOOL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "RenderComponentFlash" (
	"id"	INT32 NOT NULL,
	"interactive"	INT_BOOL NOT NULL,
	"animated"	INT_BOOL NOT NULL,
	"nodeName"	TEXT4 NOT NULL,
	"flashPath"	TEXT4 NOT NULL,
	"elementName"	TEXT4,
	"_uid"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("_uid" AUTOINCREMENT)
);

CREATE TABLE "RenderComponentWrapper" (
	"id"	INT32 NOT NULL UNIQUE,
	"defaultWrapperAsset"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "RenderIconAssets" (
	"id"	INTEGER NOT NULL UNIQUE,
	"icon_asset"	TEXT4,
	"blank_column"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "ReputationRewards" (
	"repLevel"	INT32 NOT NULL,
	"sublevel"	INT32 NOT NULL,
	"reputation"	REAL NOT NULL,
	PRIMARY KEY("repLevel","sublevel")
);

CREATE TABLE "RewardCodes" (
	"id"	INT32 NOT NULL UNIQUE,
	"code"	TEXT4 NOT NULL,
	"attachmentLOT"	INT32,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id")
);

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

CREATE TABLE "SceneTable" (
	"sceneID"	INTEGER NOT NULL UNIQUE,
	"sceneName"	TEXT4,
	PRIMARY KEY("sceneID" AUTOINCREMENT)
);

CREATE TABLE "ScriptComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"script_name"	TEXT4,
	"client_script_name"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "SkillBehavior" (
	"skillID"	INT32 NOT NULL UNIQUE,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"behaviorID"	INT32,
	"imaginationcost"	INT32 NOT NULL DEFAULT 0,
	"cooldowngroup"	INT32,
	"cooldown"	REAL,
	"inNpcEditor"	INT_BOOL NOT NULL DEFAULT 0,
	"skillIcon"	INT32,
	"oomSkillID"	TEXT4,
	"oomBehaviorEffectID"	INT32,
	"castTypeDesc"	INT32,
	"imBonusUI"	INT32,
	"lifeBonusUI"	INT32,
	"armorBonusUI"	INT32,
	"damageUI"	INT32,
	"hideIcon"	INT_BOOL NOT NULL DEFAULT 0,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	"cancelType"	INT32,
	PRIMARY KEY("skillID"),
	FOREIGN KEY("skillID") REFERENCES "BehaviorTemplate"("behaviorID")
);

CREATE TABLE "SmashableChain" (
	"chainIndex"	INT32 NOT NULL DEFAULT 0,
	"chainLevel"	INT32 NOT NULL DEFAULT 0,
	"lootMatrixID"	INT32,
	"rarityTableIndex"	INT32,
	"currencyIndex"	INT32,
	"currencyLevel"	INT32,
	"smashCount"	INT32 NOT NULL DEFAULT 1,
	"timeLimit"	INT32 NOT NULL DEFAULT 0,
	"chainStepID"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("chainIndex","chainLevel")
);

CREATE TABLE "SmashableChainIndex" (
	"id"	INT32 NOT NULL UNIQUE,
	"targetGroup"	TEXT4 NOT NULL,
	"description"	TEXT4,
	"continuous"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "SmashableComponent" (
	"id"	INT32 NOT NULL UNIQUE,
	"LootMatrixIndex"	INT32 NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "SmashableElements" (
	"elementID"	INT32 NOT NULL UNIQUE,
	"dropWeight"	INT32,
	PRIMARY KEY("elementID")
);

CREATE TABLE "SpeedchatMenu" (
	"id"	INTEGER NOT NULL UNIQUE,
	"parentId"	INT32,
	"emoteId"	INT32,
	"imageName"	TEXT4,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("emoteId") REFERENCES "Emotes"("id")
);

CREATE TABLE "SubscriptionPricing"
(
    [id] INT32,
    [countryCode] TEXT4,
    [monthlyFeeGold] TEXT4,
    [monthlyFeeSilver] TEXT4,
    [monthlyFeeBronze] TEXT4,
    [monetarySymbol] INT32,
    [symbolIsAppended] INT_BOOL);

CREATE TABLE "SurfaceType" (
	"SurfaceType"	INT32 NOT NULL DEFAULT 0 UNIQUE,
	"FootstepNDAudioMetaEventSetName"	TEXT4,
	PRIMARY KEY("SurfaceType")
);

CREATE TABLE "TamingBuildPuzzles" (
	"id"	INTEGER NOT NULL UNIQUE,
	"PuzzleModelLot"	INT32 NOT NULL,
	"NPCLot"	INT32 NOT NULL,
	"ValidPiecesLXF"	TEXT4,
	"InvalidPiecesLXF"	TEXT4,
	"Difficulty"	INT32,
	"Timelimit"	INT32,
	"NumValidPieces"	INT32,
	"TotalNumPieces"	INT32,
	"ModelName"	TEXT4,
	"FullModelLXF"	TEXT4,
	"Duration"	REAL NOT NULL DEFAULT 45.0,
	"imagCostPerBuild"	INT32 NOT NULL DEFAULT 1,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "TextDescription" (
	"TextID"	INTEGER NOT NULL UNIQUE,
	"TestDescription"	TEXT4 NOT NULL,
	PRIMARY KEY("TextID" AUTOINCREMENT)
);

CREATE TABLE "TextLanguage" (
	"TextID"	INT32,
	"LanguageID"	INT32 NOT NULL,
	"Text"	TEXT4 NOT NULL,
	PRIMARY KEY("TextID"),
	FOREIGN KEY("TextID") REFERENCES "TextDescription"("TextID")
);

CREATE TABLE "TrailEffects" (
	"trailID"	INTEGER NOT NULL UNIQUE,
	"textureName"	TEXT4,
	"blendmode"	INT32,
	"cardlifetime"	REAL NOT NULL DEFAULT 0,
	"colorlifetime"	REAL NOT NULL DEFAULT 0,
	"minTailFade"	REAL NOT NULL DEFAULT 0,
	"tailFade"	REAL NOT NULL DEFAULT 0,
	"max_particles"	INT32,
	"birthDelay"	REAL NOT NULL DEFAULT 0,
	"deathDelay"	REAL NOT NULL DEFAULT 0,
	"bone1"	TEXT4,
	"bone2"	TEXT4,
	"texLength"	REAL NOT NULL DEFAULT 0,
	"texWidth"	REAL NOT NULL DEFAULT 0,
	"startColorR"	REAL NOT NULL DEFAULT 0,
	"startColorG"	REAL NOT NULL DEFAULT 0,
	"startColorB"	REAL NOT NULL DEFAULT 0,
	"startColorA"	REAL NOT NULL DEFAULT 0,
	"middleColorR"	REAL NOT NULL DEFAULT 0,
	"middleColorG"	REAL NOT NULL DEFAULT 0,
	"middleColorB"	REAL NOT NULL DEFAULT 0,
	"middleColorA"	REAL NOT NULL DEFAULT 0,
	"endColorR"	REAL NOT NULL DEFAULT 0,
	"endColorG"	REAL NOT NULL DEFAULT 0,
	"endColorB"	REAL NOT NULL DEFAULT 0,
	"endColorA"	REAL NOT NULL DEFAULT 0,
	PRIMARY KEY("trailID" AUTOINCREMENT)
);

CREATE TABLE "UGBehaviorSounds" (
	"id"	INT32 NOT NULL UNIQUE,
	"guid"	TEXT4 NOT NULL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"gate_version"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "VehiclePhysics" (
	"id"	INT32 NOT NULL UNIQUE,
	"hkxFilename"	TEXT4,
	"fGravityScale"	REAL NOT NULL,
	"fMass"	REAL NOT NULL,
	"fChassisFriction"	REAL NOT NULL,
	"fMaxSpeed"	REAL NOT NULL,
	"fEngineTorque"	REAL NOT NULL,
	"fBrakeFrontTorque"	REAL NOT NULL,
	"fBrakeRearTorque"	REAL NOT NULL,
	"fBrakeMinInputToBlock"	REAL NOT NULL,
	"fBrakeMinTimeToBlock"	REAL NOT NULL,
	"fSteeringMaxAngle"	REAL NOT NULL,
	"fSteeringSpeedLimitForMaxAngle"	REAL NOT NULL,
	"fSteeringMinAngle"	REAL NOT NULL,
	"fFwdBias"	REAL NOT NULL,
	"fFrontTireFriction"	REAL NOT NULL,
	"fRearTireFriction"	REAL NOT NULL,
	"fFrontTireFrictionSlide"	REAL NOT NULL,
	"fRearTireFrictionSlide"	REAL NOT NULL,
	"fFrontTireSlipAngle"	REAL NOT NULL,
	"fRearTireSlipAngle"	REAL NOT NULL,
	"fWheelWidth"	REAL NOT NULL,
	"fWheelRadius"	REAL NOT NULL,
	"fWheelMass"	REAL NOT NULL,
	"fReorientPitchStrength"	REAL NOT NULL,
	"fReorientRollStrength"	REAL NOT NULL,
	"fSuspensionLength"	REAL NOT NULL,
	"fSuspensionStrength"	REAL NOT NULL,
	"fSuspensionDampingCompression"	REAL NOT NULL,
	"fSuspensionDampingRelaxation"	REAL NOT NULL,
	"iChassisCollisionGroup"	INT32 NOT NULL,
	"fNormalSpinDamping"	REAL NOT NULL,
	"fCollisionSpinDamping"	REAL NOT NULL,
	"fCollisionThreshold"	REAL NOT NULL,
	"fTorqueRollFactor"	REAL NOT NULL,
	"fTorquePitchFactor"	REAL NOT NULL,
	"fTorqueYawFactor"	REAL NOT NULL,
	"fInertiaRoll"	REAL NOT NULL,
	"fInertiaPitch"	REAL NOT NULL,
	"fInertiaYaw"	REAL NOT NULL,
	"fExtraTorqueFactor"	REAL NOT NULL,
	"fCenterOfMassFwd"	REAL NOT NULL,
	"fCenterOfMassUp"	REAL NOT NULL,
	"fCenterOfMassRight"	REAL NOT NULL,
	"fWheelHardpointFrontFwd"	REAL NOT NULL,
	"fWheelHardpointFrontUp"	REAL NOT NULL,
	"fWheelHardpointFrontRight"	REAL NOT NULL,
	"fWheelHardpointRearFwd"	REAL NOT NULL,
	"fWheelHardpointRearUp"	REAL NOT NULL,
	"fWheelHardpointRearRight"	REAL NOT NULL,
	"fInputTurnSpeed"	REAL NOT NULL,
	"fInputDeadTurnBackSpeed"	REAL NOT NULL,
	"fInputAccelSpeed"	REAL NOT NULL,
	"fInputDeadAccelDownSpeed"	REAL NOT NULL,
	"fInputDecelSpeed"	REAL NOT NULL,
	"fInputDeadDecelDownSpeed"	REAL NOT NULL,
	"fInputSlopeChangePointX"	REAL NOT NULL,
	"fInputInitialSlope"	REAL NOT NULL,
	"fInputDeadZone"	REAL NOT NULL,
	"fAeroAirDensity"	REAL NOT NULL,
	"fAeroFrontalArea"	REAL NOT NULL,
	"fAeroDragCoefficient"	REAL NOT NULL,
	"fAeroLiftCoefficient"	REAL NOT NULL,
	"fAeroExtraGravity"	REAL NOT NULL,
	"fBoostTopSpeed"	REAL NOT NULL,
	"fBoostCostPerSecond"	REAL,
	"fBoostAccelerateChange"	REAL NOT NULL,
	"fBoostDampingChange"	REAL NOT NULL,
	"fPowerslideNeutralAngle"	REAL NOT NULL,
	"fPowerslideTorqueStrength"	REAL NOT NULL,
	"iPowerslideNumTorqueApplications"	INT32 NOT NULL,
	"fImaginationTankSize"	REAL,
	"fSkillCost"	REAL NOT NULL DEFAULT 0,
	"fWreckSpeedBase"	REAL,
	"fWreckSpeedPercent"	REAL,
	"fWreckMinAngle"	REAL,
	"AudioEventEngine"	TEXT4,
	"AudioEventSkid"	TEXT4,
	"AudioEventLightHit"	TEXT4,
	"AudioSpeedThresholdLightHit"	REAL NOT NULL DEFAULT 0,
	"AudioTimeoutLightHit"	REAL NOT NULL DEFAULT 0,
	"AudioEventHeavyHit"	TEXT4,
	"AudioSpeedThresholdHeavyHit"	REAL NOT NULL DEFAULT 0,
	"AudioTimeoutHeavyHit"	REAL NOT NULL DEFAULT 0,
	"AudioEventStart"	TEXT4,
	"AudioEventTreadConcrete"	TEXT4,
	"AudioEventTreadSand"	TEXT4,
	"AudioEventTreadWood"	TEXT4,
	"AudioEventTreadDirt"	TEXT4,
	"AudioEventTreadPlastic"	TEXT4,
	"AudioEventTreadGrass"	TEXT4,
	"AudioEventTreadGravel"	TEXT4,
	"AudioEventTreadMud"	TEXT4,
	"AudioEventTreadWater"	TEXT4,
	"AudioEventTreadSnow"	TEXT4,
	"AudioEventTreadIce"	TEXT4,
	"AudioEventTreadMetal"	TEXT4,
	"AudioEventTreadLeaves"	TEXT4,
	"AudioEventLightLand"	TEXT4,
	"AudioAirtimeForLightLand"	REAL NOT NULL DEFAULT 0,
	"AudioEventHeavyLand"	TEXT4,
	"AudioAirtimeForHeavyLand"	REAL NOT NULL DEFAULT 0,
	"bWheelsVisible"	INT_BOOL NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "VehicleStatMap" (
	"id"	INT32 NOT NULL,
	"ModuleStat"	TEXT4 NOT NULL,
	"HavokStat"	TEXT4 NOT NULL,
	"HavokChangePerModuleStat"	REAL NOT NULL,
	PRIMARY KEY("id","ModuleStat","HavokStat")
);

CREATE TABLE "VendorComponent" (
	"id"	INTEGER NOT NULL UNIQUE,
	"buyScalar"	REAL NOT NULL DEFAULT 1,
	"sellScalar"	REAL NOT NULL DEFAULT 1,
	"refreshTimeSeconds"	REAL NOT NULL DEFAULT 1800,
	"LootMatrixIndex"	INT32 NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "WhatsCoolItemSpotlight" (
	"id"	INTEGER NOT NULL UNIQUE,
	"itemID"	INT32 NOT NULL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "WhatsCoolNewsAndTips" (
	"id"	INTEGER NOT NULL UNIQUE,
	"iconID"	INT32,
	"type"	INT32 NOT NULL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "WorldConfig" (
	"WorldConfigID"	INT32 NOT NULL UNIQUE,
	"pegravityvalue"	REAL,
	"pebroadphaseworldsize"	REAL,
	"pegameobjscalefactor"	REAL,
	"character_rotation_speed"	REAL,
	"character_walk_forward_speed"	REAL,
	"character_walk_backward_speed"	REAL,
	"character_walk_strafe_speed"	REAL,
	"character_walk_strafe_forward_speed"	REAL,
	"character_walk_strafe_backward_speed"	REAL,
	"character_run_backward_speed"	REAL,
	"character_run_strafe_speed"	REAL,
	"character_run_strafe_forward_speed"	REAL,
	"character_run_strafe_backward_speed"	REAL,
	"global_cooldown"	REAL,
	"characterGroundedTime"	REAL,
	"characterGroundedSpeed"	REAL,
	"globalImmunityTime"	REAL,
	"character_max_slope"	REAL,
	"defaultrespawntime"	REAL,
	"mission_tooltip_timeout"	REAL,
	"vendor_buy_multiplier"	REAL,
	"pet_follow_radius"	REAL,
	"character_eye_height"	REAL,
	"flight_vertical_velocity"	REAL,
	"flight_airspeed"	REAL,
	"flight_fuel_ratio"	REAL,
	"flight_max_airspeed"	REAL,
	"fReputationPerVote"	REAL,
	"nPropertyCloneLimit"	INT32,
	"defaultHomespaceTemplate"	INT32,
	"coins_lost_on_death_percent"	REAL,
	"coins_lost_on_death_min"	INT32,
	"coins_lost_on_death_max"	INT32,
	"character_votes_per_day"	INT32,
	"property_moderation_request_approval_cost"	INT32,
	"property_moderation_request_review_cost"	INT32,
	"propertyModRequestsAllowedSpike"	INT32,
	"propertyModRequestsAllowedInterval"	INT32,
	"propertyModRequestsAllowedTotal"	INT32,
	"propertyModRequestsSpikeDuration"	INT32,
	"propertyModRequestsIntervalDuration"	INT32,
	"modelModerateOnCreate"	INT_BOOL NOT NULL DEFAULT 0,
	"defaultPropertyMaxHeight"	REAL,
	"reputationPerVoteCast"	REAL,
	"reputationPerVoteReceived"	REAL,
	"showcaseTopModelConsiderationBattles"	INT32,
	"reputationPerBattlePromotion"	REAL,
	"coins_lost_on_death_min_timeout"	REAL,
	"coins_lost_on_death_max_timeout"	REAL,
	"mail_base_fee"	INT32,
	"mail_percent_attachment_fee"	REAL,
	"propertyReputationDelay"	INT32,
	"LevelCap"	INT32,
	"LevelUpBehaviorEffect"	TEXT4,
	"CharacterVersion"	INT32,
	"LevelCapCurrencyConversion"	INT32,
	PRIMARY KEY("WorldConfigID")
);

CREATE TABLE "ZoneLoadingTips" (
	"id"	INT32 NOT NULL UNIQUE,
	"zoneid"	INT32,
	"imagelocation"	TEXT4,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"gate_version"	TEXT4,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"weight"	INT32 NOT NULL DEFAULT 1,
	"targetVersion"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "ZoneSummary" (
	"zoneID"	INT32 NOT NULL,
	"type"	INT32 NOT NULL,
	"value"	INT32,
	"_uniqueID"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("_uniqueID" AUTOINCREMENT)
);

CREATE TABLE "ZoneTable" (
	"zoneID"	INT32 NOT NULL UNIQUE,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	"zoneName"	TEXT4,
	"scriptID"	INT32 DEFAULT -1,
	"ghostdistance_min"	REAL,
	"ghostdistance"	REAL DEFAULT 200.0,
	"population_soft_cap"	INT32 DEFAULT 80,
	"population_hard_cap"	INT32 DEFAULT 120,
	"DisplayDescription"	TEXT4,
	"mapFolder"	TEXT4,
	"smashableMinDistance"	REAL,
	"smashableMaxDistance"	REAL,
	"mixerProgram"	TEXT4,
	"clientPhysicsFramerate"	TEXT4,
	"serverPhysicsFramerate"	TEXT4,
	"zoneControlTemplate"	INT32,
	"widthInChunks"	INT32,
	"heightInChunks"	INT32,
	"petsAllowed"	INT_BOOL,
	"localize"	INT_BOOL NOT NULL DEFAULT 1,
	"fZoneWeight"	REAL,
	"thumbnail"	TEXT4,
	"PlayerLoseCoinsOnDeath"	INT_BOOL NOT NULL DEFAULT 1,
	"disableSaveLoc"	INT_BOOL NOT NULL DEFAULT 0,
	"teamRadius"	REAL,
	"gate_version"	TEXT4,
	"mountsAllowed"	INT_BOOL,
	PRIMARY KEY("zoneID")
);

CREATE TABLE "brickAttributes" (
	"ID"	INT32 NOT NULL UNIQUE,
	"icon_asset"	TEXT4,
	"display_order"	INT32 NOT NULL DEFAULT 0,
	"locStatus"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("ID")
);

CREATE TABLE "dtproperties" (
	"id"	INTEGER NOT NULL UNIQUE,
	"objectid"	INT32,
	"property"	TEXT4 NOT NULL,
	"value"	TEXT4,
	"uvalue"	TEXT4,
	"lvalue"	BLOB_NONE,
	"version"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id","property")
);

CREATE TABLE "mapAnimationPriorities" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT4,
	"priority"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "mapAssetType" (
	"id"	INTEGER NOT NULL UNIQUE,
	"label"	TEXT4,
	"pathdir"	TEXT4,
	"typelabel"	TEXT4,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "mapIcon" (
	"LOT"	INT32 NOT NULL,
	"iconID"	INT32 NOT NULL,
	"iconState"	INT32 NOT NULL,
	PRIMARY KEY("LOT","iconState")
);

CREATE TABLE "mapItemTypes" (
	"id"	INT32 NOT NULL UNIQUE,
	"description"	TEXT4 NOT NULL,
	"equipLocation"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "mapRenderEffects" (
	"id"	INT32 NOT NULL UNIQUE,
	"gameID"	INT32 NOT NULL,
	"description"	TEXT4,
	PRIMARY KEY("id")
);

CREATE TABLE "mapShaders" (
	"id"	INT32 NOT NULL UNIQUE,
	"label"	TEXT4,
	"gameValue"	INT32,
	"priority"	INT32,
	PRIMARY KEY("id")
);

CREATE TABLE "mapTextureResource" (
	"id"	INTEGER NOT NULL UNIQUE,
	"texturepath"	TEXT4,
	"SurfaceType"	INT32 NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "map_BlueprintCategory" (
	"id"	INTEGER NOT NULL UNIQUE,
	"description"	TEXT4,
	"enabled"	INT_BOOL NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE "sysdiagrams"
(
    [name] TEXT4,
    [principal_id] INT32,
    [diagram_id] INT32,
    [version] INT32,
    [definition] TEXT4);

