if (isDedicated) exitWith {};
waitUntil {!isNull player};
waitUntil {!isNil "playerSpawning" && {!playerSpawning}};


for "_i" from 0 to 1 step 0 do 
{
	if (player getVariable "cmoney" > 184999) then
		{

			_title  = "<t color='#ff0000' size='1.2' align='center'>High Value Target! </t><br />";
			_name = format ["%1<br /> ",name player];     
			_text = "<t color='#FFFFFF' shadow='1' shadowColor='#000000' align='center'>Someone has spotted you carrying a large sum of money and has marked your location on the map!</t><br />";     
			hint parseText (_title +  _name +  _text); 
			playSound "Topic_Done";

			_markerName = format ["%1_bountyMarker",name player];  
			_bountyMarker = createMarker [_markerName, getPos (vehicle player)];
			_bountyMarker setMarkerShape "ICON";
			_bounty = [player getVariable ["cmoney", 0]] call fn_numbersText;
			_bountyMarker setMarkerText (format ["High Value Target: %1 (%2$)", name player, _bounty]);
			_bountyMarker setMarkerColor "ColorRed";
			_bountyMarker setMarkerType "mil_dot";
			sleep 45;
			deleteMarker _markerName;
		};
		uisleep 0.5;	
}; //will run infinitely