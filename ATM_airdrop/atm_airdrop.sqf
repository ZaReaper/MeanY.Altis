///////////////////////////////////////////////////////////
//                =ATM= Airdrop       	 				    //
//         		 =ATM=Pokertour        		       		    //
//				version : 6.0							        //
//				date : 12/02/2014						   //
//                   visit us : atmarma.fr                 //
/////////////////////////////////////////////////////////

private ["_position","_cut","_dialog","_s_alt","_s_alt_text","_sound","_sound2","_soundPath"];
	waitUntil { !isNull player };
//[] execVM "ATM_airdrop\functions.sqf";

		_position = GetPos player;
		_z = _position select 2;
		Altitude = 5000;

	hint Localize "STR_ATM_hinton";
	openMap true;

	disableSerialization;
	ATM_Jump_mapclick = false;
	onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; onMapSingleClick ''; true;";
	waitUntil {ATM_Jump_mapclick or !(visibleMap)};
	if (!visibleMap) exitWith { 
		systemChat "Halo jump cancelled.";
		breakOut "main";
	};
	_pos = ATM_Jump_clickpos;
	ATM_Jump_mapclick = if(true) then{
	call compile format ['
	mkr_halo = createMarker ["mkr_halo", ATM_Jump_Clickpos];
	"mkr_halo" setMarkerTypeLocal "hd_dot";
	"mkr_halo" setMarkerColorLocal "ColorGreen";
	"mkr_halo" setMarkerTextLocal "Jump";'];
	};
sleep 1;
	_target = player;

		_posJump = getMarkerPos "mkr_halo";
		_x = _posJump select 0;
		_y = _posJump select 1;
		_z = _posJump select 2;
		_target setPos [_x,_y,_z+Altitude];

	openMap false;
	deleteMarker "mkr_halo";

hintSilent "";

uiSleep 1;

if (true) exitWith {};

