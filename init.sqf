// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

// block script injection exploit
inGameUISetEventHandler ["PrevAction", ""];
inGameUISetEventHandler ["Action", ""];
inGameUISetEventHandler ["NextAction", ""];

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

//disable TAW grass Option 'None'
tawvd_disablenone = true;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Welcome to MAG A3Wasteland, please wait for your client to initialize", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;
//			player setVariable ["playerSpawning", true, true];  

			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		

			[true] ExecVM "ScarCode\SC_restartWarnings.sqf";
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

if (hasInterface || isServer) then
{
//init 3rd Party Scripts
//zod_stakedown_showhint = true;
//zod_stakedown_showtext = true;
[] execVM "addons\R3F_LOG\init.sqf";
//[] execVM "addons\takedown\zod_stakedown_init.sqf"; //takedown
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\JumpMF\init.sqf";
[] execVM "addons\laptop\init.sqf";						// Addon for hack laptop mission
[] execVM "addons\AF_Keypad\AF_KP_vars.sqf";			// Keypad for base locking
[] execVM "addons\vactions\functions.sqf";				// Micovery vehicle actions
//[] execVM "addons\scripts\intro.sqf";					// Welcome intro
//[] execVM "addons\zlt_fastrope\zlt_fastrope.sqf";
[] execVM "addons\safezone\safezone.sqf"; //safezones
[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";
[] execVM "addons\disableThermal\disablethermal.sqf";  //disable thermal vision
//[] execVM "addons\HvT\HvT.sqf"; 							// High Value Target Cheat detection money value
//[] execVM "addons\HvT\HvT2.sqf";  //High value bounty target
//[] execVM "addons\HvT\HvD.sqf"; 
// [] execVM "addons\MeanY_3rd_fps\3rdrestriction.sqf";   //MEANY - Restrict 3rd person while weapon is drawn
[] execVM "addons\statusBar\statusbar.sqf";
[] execVM "addons\outlw_magRepack\MagRepack_init.sqf";
[] execVM "addons\lsd_nvg\init.sqf";
if (isNil "drn_DynamicWeather_MainThread") then { drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf" };
};