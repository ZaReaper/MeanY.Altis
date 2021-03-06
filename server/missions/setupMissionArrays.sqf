// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	// Mission filename, weight
	["mission_ArmedDiversquad", .2],
	["mission_Coastal_Convoy", 0.5],
	["mission_Convoy", 1],
	["mission_HostileHeliFormation", 0.5],
	["mission_APC", 1],
	["mission_MBT", .6],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
	//["mission_Hackers", 1],
	["mission_CivHeli", 1]
];

SideMissions =
[
	["mission_HostileHelicopter", 0.3],
	["mission_MiniConvoy", 1],
	["mission_SunkenSupplies", 0.1],
	["mission_TownInvasion", 2],
	//mission_AirWreck", 1.2],
	["mission_WepCache", 1],
	["mission_Roadblock", 1.2],
	["mission_Outpost", 2],
	["mission_Truck", 1],
	["mission_drugsRunners", 1],
	["mission_GeoCache", 1]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1.5],
	["mission_SunkenTreasure", .1],
	["mission_altisPatrol", 1]
];

ExtraMissions =
[
	["mission_Outpost1", 1],
	["mission_Sniper", 1],
	["mission_Smugglers", 1],
	["mission_HostileJet", 0.5],
	["mission_TownInvasion1", 1],
	["mission_HackLaptop", 1]
];

PatrolMissions =
[
	["mission_militaryPatrol", 1]
];

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;
ExtraMissions = [ExtraMissions, [["A3W_heliPatrolMissions", ["mission_HostileJet"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach ExtraMissions;
{ _x set [2, false] } forEach PatrolMissions;

MissionSpawnMarkers = [];
SunkenMissionMarkers = [];
RoadblockMissionMarkers =[];
SniperMissionMarkers =[];
{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["SunkenMission_", _x] call fn_startsWith):
		{
			SunkenMissionMarkers pushBack [_x, false];
		};
		case (["RoadBlock_", _x] call fn_startsWith):
		{
			RoadblockMissionMarkers pushBack [_x, false];
		};
		case (["Sniper_", _x] call fn_startsWith):
		{
			SniperMissionMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

LandConvoyPaths = [];
{
	LandConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf");

CoastalConvoyPaths = [];
{
	CoastalConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf");

PatrolConvoyPaths = [];
{
	PatrolConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\patrolConvoysList.sqf");
