// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Sniper.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_positions", "_boxes1", "_currBox1", "_box1"];

_setupVars =
{
	_missionType = "Sniper Nest";
	_positions = [[12879.5,16773.3,0],[8951.24,20077.1,0],[3185.9,13146.6,0],[17944.4,12226.1,0],[9520.34,15741.5,0]];

	_missionPos = _positions call BIS_fnc_SelectRandom;
};

_setupObjects =
{
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn createsniperGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionHintText = format ["Local Intel indicates there is a group of wookiee suit noobs camping on a hill harrassing the locals. Head to the marked area and Take them out!", extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
};

_successExec =
{
	// Mission completed
	
	_boxes1 = ["Box_East_Support_F","Box_East_Grenades_F","Box_East_WpsLaunch_F","Box_NATO_WpsSpecial_F","C_supplyCrate_F"];
	_currBox1 = _boxes1 call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1, _lastPos, [], 2, "None"];
	_box1 allowDamage false;
	_box1 setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The camping noobs are dead! Well Done!"];
};

_this call extraMissionProcessor;