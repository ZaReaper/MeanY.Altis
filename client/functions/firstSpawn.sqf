// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: firstSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/12/2013 19:42

//Setup UID Whitelist here 
/*
_whitelist = [
//"Aussieeeee"
"76561198133491170", 
//"AussiePastor"
"76561198011866491", 
//"Chappy"
"76561198066063340",
//"ChEeZels"
"76561197997766152", 
//Dragonator755
"76561198006483721",
//"DuFuS"
"76561198056071908", 
//"Evil880"
"76561198052127528", 
//"fweedom"
"76561198131597968", 
//"JACKO270REM"
"76561198033365291", 
//"Jumma"
"76561197998124078", 
//"KingOChaos" 
"76561198033822149", 
//"leumas745"
"76561197971987711", 
//"mACmEISTER"
"76561198061588330", 
//"MeanY"
"76561197983999930", 
//"MittagongMat"
"76561197999955570", 
//"Nommingu"
"76561198010526921",
//"NzKiller"
"76561198065586150", 
//"RaVen"
"76561197998124078", 
//"Reno"
"76561198001223651", 
//"Scruffy"
"76561198007468111", 
//"to3cutta"
"76561197994612890", 
//"Ubeen"
"76561198077030445", 
//"Ubeeson"
"76561198156785120",
//"ven0mate"
"76561198056097019", 
//Za Reaper
"76561197976322139",
//"angelight85
"76561197966283232",
//"FaZZyaF0rK"
"76561198033854125",
//"Terkoz" 
"76561198025981553",
//NoLuck
"76561198050463712",
//"Dragon967"
"76561198055792879",
//Tellytubby
"76561197988264762",
//"Pookalocka"
"76561198030942203",
//Deadpixel
"76561197970927195",
//Backdoor Bob
"76561198035570312",
//Nightridr
"76561198015504418",
//Stabb
"76561198000950646",
//Damauler
"76561198025907089",
//Cypress
"76561197980176804"
];

if(playerSide == BLUFOR) then
{
	if(!((getPlayerUID player) in _whitelist)) then
	{
		hint "This team is white-listed for MAG Members only!";
		titleFadeOut 9999;
		titleText [format["BLUFOR is Whitelisted to MAG members"],"PLAIN",0];
		[] spawn{
			sleep 5;
			endMission "Thank You";
		}
	};
};
*/

client_firstSpawn = true;

//[] execVM "client\functions\welcomeMessage.sqf";
[] execVM "addons\TOParmaInfo\loadTOParmaInfo.sqf";

// GoT addition - if this is the first spawn start the loyalty-timer
if(format["%1",firstspawn] == format["%1","1"]) then 
{
	[] spawn fn_rewardLoyalty;
	firstspawn = 0;
};

player addEventHandler ["Take",
{
	_vehicle = _this select 1;

	if (_vehicle isKindOf "LandVehicle" && {!(_vehicle getVariable ["itemTakenFromVehicle", false])}) then
	{
		_vehicle setVariable ["itemTakenFromVehicle", true, true];
	};
}];

player addEventHandler ["Put",
{
	_vehicle = _this select 1;

	if (_vehicle getVariable ["A3W_storeSellBox", false] && isNil {_vehicle getVariable "A3W_storeSellBox_track"}) then
	{
		_vehicle setVariable ["A3W_storeSellBox_track", _vehicle spawn
		{
			_vehicle = _this;

			waitUntil {sleep 1; !alive player || player distance _vehicle > 25};

			_sellScript = [_vehicle, player, -1, [true, true]] execVM "client\systems\selling\sellCrateItems.sqf";
			waitUntil {sleep 0.1; scriptDone _sellScript};

			if (!alive player) then
			{
				sleep 0.5;

				if (player getVariable ["cmoney", 0] > 0) then
				{
					_m = createVehicle ["Land_Money_F", getPosATL player, [], 0.5, "CAN_COLLIDE"];
					_m setVariable ["cmoney", player getVariable "cmoney", true];
					_m setVariable ["owner", "world", true];
					player setVariable ["cmoney", 0, true];
				};
			};

			_vehicle setVariable ["A3W_storeSellBox_track", nil];
		}];
	};
}];

player addEventHandler ["WeaponDisassembled", { _this spawn weaponDisassembledEvent }];

player addEventHandler ["WeaponAssembled",
{
	_player = _this select 0;
	_obj = _this select 1;
	if (_obj isKindOf "UAV_01_base_F") then { _obj setVariable ["ownerUID", getPlayerUID _player, true] };
}];

player addEventHandler ["InventoryOpened",
{
	_obj = _this select 1;
	if (!simulationEnabled _obj) then { _obj enableSimulation true };
	_obj setVariable ["inventoryIsOpen", true];

	if !(_obj isKindOf "Man") then
	{
		if (locked _obj > 1 || (_obj getVariable ["A3W_inventoryLockR3F", false] && _obj getVariable ["R3F_LOG_disabled", false])) then
		{
			if (_obj isKindOf "AllVehicles") then
			{
				["This vehicle is locked.", 5] call mf_notify_client;
			}
			else
			{
				["This object is locked.", 5] call mf_notify_client;
			};

			true
		};
	};
}];

player addEventHandler ["InventoryClosed",
{
	_obj = _this select 1;
	_obj setVariable ["inventoryIsOpen", nil];
}];

[] spawn
{
	_lastVeh = vehicle player;

	waitUntil
	{
		_currVeh = vehicle player;

		// Manual GetIn/GetOut check because BIS is too lazy to implement GetInMan/GetOutMan
		if (_lastVeh != _currVeh) then
		{
			if (_currVeh != player) then
			{
				[_currVeh] call getInVehicle;
			}
			else
			{
				[_lastVeh] call getOutVehicle;
			};
		};

		_lastVeh = _currVeh;

		// Prevent usage of commander camera
		if (cameraView == "GROUP") then
		{
			cameraOn switchCamera "EXTERNAL";
		};

		false
	};
};

player addEventHandler ["HandleDamage", unitHandleDamage];

if (["A3W_combatAbortDelay", 0] call getPublicVar > 0) then
{
	player addEventHandler ["Fired",
	{
		// Remove remote explosives if within 100m of a store
		if (_this select 1 == "Put") then
		{
			_ammo = _this select 4;

			//if ({_ammo isKindOf _x} count ["PipeBombBase", "ClaymoreDirectionalMine_Remote_Ammo"] > 0) then
			if ({_ammo isKindOf _x} count ["PipeBombBase", "ClaymoreDirectionalMine_Remote_Ammo", "APERSTripMine_Wire_Ammo", "APERSBoundingMine_Range_Ammo", "APERSMine_Range_Ammo", "SLAMDirectionalMine_Wire_Ammo", "ATMine_Range_Ammo", "SatchelCharge_Remote_Ammo", "DemoCharge_Remote_Ammo", "IEDUrbanBig_Remote_Ammo", "IEDLandBig_Remote_Ammo", "IEDUrbanSmall_Remote_Ammo", "IEDLandSmall_Remote_Ammo"] > 0) then
			{
				_mag = _this select 5;
				_bomb = _this select 6;
				_minDist = ["A3W_remoteBombStoreRadius", 100] call getPublicVar;

				{
					if (_x getVariable ["storeNPC_setupComplete", false] && {_bomb distance _x < _minDist}) exitWith
					{
						deleteVehicle _bomb;
						player addMagazine _mag;
						playSound "FD_CP_Not_Clear_F";
						titleText [format ["You are not allowed to place explosives within %1m of a store.\nThe explosive has been re-added to your inventory.", _minDist], "PLAIN DOWN", 0.5];
					};
				} forEach entities "CAManBase";
			};
		};
	}];

	player addEventHandler ["FiredNear",
	{
		// Prevent aborting if event is not for placing an explosive
		if (_this select 3 != "Put") then {
			combatTimestamp = diag_tickTime;
		};
	}];

	player addEventHandler ["Hit",
	{
		_source = effectiveCommander (_this select 1);
		if (!isNull _source && _source != player) then {
			combatTimestamp = diag_tickTime;
		};
	}];
};

_uid = getPlayerUID player;

if (playerSide in [BLUFOR,OPFOR,INDEPENDENT] && {{_x select 0 == _uid} count pvar_teamSwitchList == 0}) then
{
	_startTime = diag_tickTime;
	waitUntil {sleep 1; diag_tickTime - _startTime >= 180};

	pvar_teamSwitchLock = [_uid, playerSide];
	publicVariableServer "pvar_teamSwitchLock";

	_side = switch (playerSide) do
	{
		case BLUFOR: { "BLUFOR" };
		case OPFOR:  { "OPFOR" };
		case INDEPENDENT:  { "INDEPENDENT" };
	};

	titleText [format ["You have been locked to %1", _side], "PLAIN", 0.5];
};
